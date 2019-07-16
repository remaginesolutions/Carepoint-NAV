codeunit 16035405 "Stepped Approval Mgt."
{
    // version CAREPOINT1.00

    // HBS SA 31/12/2015 initial version

    Permissions = TableData 454 = rimd;

    trigger OnRun()
    begin
    end;

    var
        CreateSteppedApprovalRequestsTxt: Label 'Create a stepped approval request for the record using approver type %1 and %2.', Comment = 'Create a stepped approval request for the record using approver type Global Dimension 1 and approver limit type Approver Chain.';
        AdditionalApprovers: Boolean;
        LevelbasedApproval: Record "Level Based Approval";
        DocumentSubType: Option "Normal Purchase","Asset Purchase";
        GlobalDimension1CannotBeBlankTxt: Label 'Global Dimension 1 cannot be blank when Approval Template %1 has Approval Type %2.';
        UserIDDoesNotExistInUserSetupTxt: Label 'User ID %1 does not exist in the User Setup table for %2 %3.';
        ThereAreNoLinksAttachedTxt: Label 'There are no links attached to this document. Do you want to continue?';
        DocumentRequiresFurtherApprovalTxt: Label '%1 %2 requires further approval.\\Approval request entries have been created.';
        WorkflowDoesNotSupportTxt: Label 'Workflow %1 does not support %2 %3.';

    procedure CreateSteppedApprovalRequestCode(): Code[128]
    begin
        EXIT(UPPERCASE('CreateSteppedApprovalRequest'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1521, 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    procedure AddCreateSteppedApprovalRequestToLibrary()
    var
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
    begin
        WorkflowResponseHandling.AddResponseToLibrary(CreateSteppedApprovalRequestCode, 0, CreateSteppedApprovalRequestsTxt, 'GROUP 5');
    end;

    [EventSubscriber(ObjectType::Codeunit, 1521, 'OnAddWorkflowResponsePredecessorsToLibrary', '', false, false)]
    procedure AddCreateSteppedApprovalRequestResponsePredecessors(ResponseFunctionName: Code[128])
    var
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
    begin
        CASE ResponseFunctionName OF
            CreateSteppedApprovalRequestCode:
                BEGIN
                    WorkflowResponseHandling.AddResponsePredecessor(CreateSteppedApprovalRequestCode, WorkflowEventHandling.RunWorkflowOnSendPurchaseDocForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(CreateSteppedApprovalRequestCode, WorkflowEventHandling.RunWorkflowOnSendIncomingDocForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(
                      CreateSteppedApprovalRequestCode, WorkflowEventHandling.RunWorkflowOnSendGeneralJournalLineForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(
                      CreateSteppedApprovalRequestCode, WorkflowEventHandling.RunWorkflowOnSendGeneralJournalBatchForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(CreateSteppedApprovalRequestCode, WorkflowEventHandling.RunWorkflowOnGeneralJournalBatchBalancedCode);
                END;
        END;
    end;

    local procedure CreateSteppedApprovalRequest(RecRef: RecordRef; WorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowStepArgument: Record "Workflow Step Argument";
        ApprovalEntryArgument: Record "Approval Entry";
    begin
        PopulateApprovalEntryArgument(RecRef, WorkflowStepInstance, ApprovalEntryArgument);

        IF WorkflowStepArgument.GET(WorkflowStepInstance.Argument) THEN
            CASE WorkflowStepArgument."Carepoint Approval Type" OF
                WorkflowStepArgument."Carepoint Approval Type"::"Global Dimension 1":
                    CreateApprReqForApprTypeGlobalDimension(WorkflowStepArgument, ApprovalEntryArgument, RecRef);
                ELSE
                    ERROR(WorkflowDoesNotSupportTxt, WorkflowStepInstance."Workflow Code", WorkflowStepArgument.FIELDCAPTION("Carepoint Approval Type"), FORMAT(WorkflowStepArgument."Carepoint Approval Type"));
            END;
    end;

    [EventSubscriber(ObjectType::Codeunit, 1521, 'OnExecuteWorkflowResponse', '', false, false)]
    procedure OnExecuteSteppedApprovalRequestResponse(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowResponse: Record "Workflow Response";
        RecRef: RecordRef;
        PurchaseHeader: Record "Purchase Header";
    begin
        IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
            CASE WorkflowResponse."Function Name" OF
                CreateSteppedApprovalRequestCode:
                    BEGIN
                        RecRef.GETTABLE(Variant);
                        RecRef.SETTABLE(PurchaseHeader);
                        CheckLinkExists(PurchaseHeader);  // HBSVK 2015-12-01
                        CreateSteppedApprovalRequest(RecRef, ResponseWorkflowStepInstance);
                        ResponseExecuted := TRUE;
                        MESSAGE(DocumentRequiresFurtherApprovalTxt, PurchaseHeader."Document Type", PurchaseHeader."No.");
                    END;
            END;
    end;

    local procedure PopulateApprovalEntryArgument(RecRef: RecordRef; WorkflowStepInstance: Record "Workflow Step Instance"; var ApprovalEntryArgument: Record "Approval Entry")
    var
        Customer: Record "Customer";
        GenJournalBatch: Record "Gen. Journal Batch";
        GenJournalLine: Record "Gen. Journal Line";
        PurchaseHeader: Record "Purchase Header";
        SalesHeader: Record "Sales Header";
        IncomingDocument: Record "Incoming Document";
        ApprovalAmount: Decimal;
        ApprovalAmountLCY: Decimal;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        ApprovalEntryArgument.INIT;
        ApprovalEntryArgument."Table ID" := RecRef.NUMBER;
        ApprovalEntryArgument."Record ID to Approve" := RecRef.RECORDID;
        ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::" ";
        ApprovalEntryArgument."Approval Code" := WorkflowStepInstance."Workflow Code";
        ApprovalEntryArgument."Workflow Step Instance ID" := WorkflowStepInstance.ID;

        CASE RecRef.NUMBER OF
            DATABASE::"Purchase Header":
                BEGIN
                    RecRef.SETTABLE(PurchaseHeader);
                    ApprovalsMgmt.CalcPurchaseDocAmount(PurchaseHeader, ApprovalAmount, ApprovalAmountLCY);
                    ApprovalEntryArgument."Document Type" := PurchaseHeader."Document Type";
                    ApprovalEntryArgument."Document No." := PurchaseHeader."No.";
                    ApprovalEntryArgument."Salespers./Purch. Code" := PurchaseHeader."Purchaser Code";
                    ApprovalEntryArgument.Amount := ApprovalAmount;
                    ApprovalEntryArgument."Amount (LCY)" := ApprovalAmountLCY;
                    ApprovalEntryArgument."Currency Code" := PurchaseHeader."Currency Code";
                END;
        END;
    end;

    local procedure CreateApprReqForApprTypeGlobalDimension(WorkflowStepArgument: Record "Workflow Step Argument"; ApprovalEntryArgument: Record "Approval Entry"; RecRef: RecordRef)
    begin
        CASE WorkflowStepArgument."Approver Limit Type" OF
            WorkflowStepArgument."Approver Limit Type"::"Approver Chain":
                BEGIN
                    CreateApprovalRequestForUser(WorkflowStepArgument, ApprovalEntryArgument, RecRef);
                    CreateApprovalRequestForChainOfApprovers(WorkflowStepArgument, ApprovalEntryArgument, RecRef);
                END;
            WorkflowStepArgument."Approver Limit Type"::"First Qualified Approver":
                BEGIN
                    CreateApprovalRequestForUser(WorkflowStepArgument, ApprovalEntryArgument, RecRef);
                    CreateApprovalRequestForApproverWithSufficientLimit(WorkflowStepArgument, ApprovalEntryArgument, RecRef);
                END;
            ELSE
                ERROR(WorkflowDoesNotSupportTxt, '', WorkflowStepArgument.FIELDCAPTION("Carepoint Approval Type"), FORMAT(WorkflowStepArgument."Carepoint Approval Type"));
        END;
    end;

    local procedure CreateApprovalRequestForUser(WorkflowStepArgument: Record "Workflow Step Argument"; ApprovalEntryArgument: Record "Approval Entry"; RecRef: RecordRef)
    var
        SequenceNo: Integer;
    begin
        SequenceNo := GetLastSequenceNo(ApprovalEntryArgument);
        SequenceNo += 1;
        MakeApprovalEntry(ApprovalEntryArgument, SequenceNo, USERID, WorkflowStepArgument);
    end;

    local procedure MakeApprovalEntry(ApprovalEntryArgument: Record "Approval Entry"; SequenceNo: Integer; ApproverId: Code[50]; WorkflowStepArgument: Record "Workflow Step Argument")
    var
        ApprovalEntry: Record "Approval Entry";
    begin
        WITH ApprovalEntry DO BEGIN
            "Table ID" := ApprovalEntryArgument."Table ID";
            "Document Type" := ApprovalEntryArgument."Document Type";
            "Document No." := ApprovalEntryArgument."Document No.";
            "Salespers./Purch. Code" := ApprovalEntryArgument."Salespers./Purch. Code";
            "Sequence No." := SequenceNo;
            "Sender ID" := USERID;
            Amount := ApprovalEntryArgument.Amount;
            "Amount (LCY)" := ApprovalEntryArgument."Amount (LCY)";
            "Currency Code" := ApprovalEntryArgument."Currency Code";
            "Approver ID" := ApproverId;
            "Workflow Step Instance ID" := ApprovalEntryArgument."Workflow Step Instance ID";
            IF ApproverId = USERID THEN
                Status := Status::Approved
            ELSE
                Status := Status::Created;
            "Date-Time Sent for Approval" := CREATEDATETIME(TODAY, TIME);
            "Last Date-Time Modified" := CREATEDATETIME(TODAY, TIME);
            "Last Modified By User ID" := USERID;
            "Due Date" := CALCDATE(WorkflowStepArgument."Due Date Formula", TODAY);

            CASE WorkflowStepArgument."Delegate After" OF
                WorkflowStepArgument."Delegate After"::Never:
                    EVALUATE("Delegation Date Formula", '');
                WorkflowStepArgument."Delegate After"::"1 day":
                    EVALUATE("Delegation Date Formula", '<1D>');
                WorkflowStepArgument."Delegate After"::"2 days":
                    EVALUATE("Delegation Date Formula", '<2D>');
                WorkflowStepArgument."Delegate After"::"5 days":
                    EVALUATE("Delegation Date Formula", '<5D>');
                ELSE
                    EVALUATE("Delegation Date Formula", '');
            END;
            "Available Credit Limit (LCY)" := ApprovalEntryArgument."Available Credit Limit (LCY)";
            SetApproverType(WorkflowStepArgument, ApprovalEntry);
            SetLimitType(WorkflowStepArgument, ApprovalEntry);
            "Record ID to Approve" := ApprovalEntryArgument."Record ID to Approve";
            "Approval Code" := ApprovalEntryArgument."Approval Code";

            //HBSTG CAREPOINT1.00 2014-09-18: Start >> Flow extra fields to recognise level based approvals
            IF LevelbasedApproval."Sequence No." > 0 THEN BEGIN
                "Approval Level Sequence" := LevelbasedApproval."Sequence No.";
                "Approval Level" := LevelbasedApproval.Level;
                IF DocumentSubType = DocumentSubType::"Normal Purchase" THEN
                    "Approval Level Amount Limit" := LevelbasedApproval."Normal Purchase Amount Limit"
                ELSE
                    "Approval Level Amount Limit" := LevelbasedApproval."Asset Purchase Amount Limit";
            END ELSE BEGIN
                "Approval Level Sequence" := 0;
                "Approval Level" := '';
                "Approval Level Amount Limit" := 0;
            END;
            //HBSTG CAREPOINT1.00 2014-09-19: End <<
            INSERT(TRUE);
        END;
    end;

    local procedure CreateApprovalRequestForChainOfApprovers(WorkflowStepArgument: Record "Workflow Step Argument"; ApprovalEntryArgument: Record "Approval Entry"; RecRef: RecordRef)
    begin
        CreateApprovalRequestForApproverChain(WorkflowStepArgument, ApprovalEntryArgument, FALSE, RecRef);
    end;

    local procedure CreateApprovalRequestForApproverWithSufficientLimit(WorkflowStepArgument: Record "Workflow Step Argument"; ApprovalEntryArgument: Record "Approval Entry"; RecRef: RecordRef)
    begin
        CreateApprovalRequestForApproverChain(WorkflowStepArgument, ApprovalEntryArgument, TRUE, RecRef);
    end;

    local procedure CreateApprovalRequestForApproverChain(WorkflowStepArgument: Record "Workflow Step Argument"; ApprovalEntryArgument: Record "Approval Entry"; SufficientApproverOnly: Boolean; RecRef: RecordRef)
    var
        LevelBasedApprovalSetup: Record "Level Based Approval Setup";
        ApprovalEntry: Record "Approval Entry";
        UserSetup: Record "User Setup";
        ApproverId: Code[50];
        SequenceNo: Integer;
        PurchaseHeader: Record "Purchase Header";
        DimValue: Record "Dimension Value";
        ApproverDimValue: Record "Dimension Value";
        GLSetup: Record "General Ledger Setup";
        SufficientApprover: Boolean;
    begin
        ApproverId := USERID;
        RecRef.SETTABLE(PurchaseHeader); // HBS
        SequenceNo := GetLastSequenceNo(ApprovalEntryArgument);
        LevelBasedApprovalSetup.GET;
        //HBS Stepped Purchase Approval
        IF PurchaseHeader."Shortcut Dimension 1 Code" <> '' THEN BEGIN
            GLSetup.GET;
            DimValue.GET(GLSetup."Shortcut Dimension 1 Code", PurchaseHeader."Shortcut Dimension 1 Code");
            DocumentSubType := PurchaseHeader."Document Sub-Type";
            LevelbasedApproval.RESET;
            IF LevelbasedApproval.FINDSET THEN BEGIN
                REPEAT
                    IF NOT LevelbasedApproval."Company Level Approval" THEN BEGIN
                        CLEAR(ApproverDimValue);
                        CASE LevelbasedApproval.Level OF
                            'APPROVER1':
                                BEGIN
                                    IF DimValue.Approver1 <> '' THEN
                                        ApproverDimValue.GET(LevelBasedApprovalSetup."Approver1 Dimension Code", DimValue.Approver1);
                                END;
                            'APPROVER2':
                                BEGIN
                                    IF DimValue.Approver2 <> '' THEN
                                        ApproverDimValue.GET(LevelBasedApprovalSetup."Approver2 Dimension Code", DimValue.Approver2);
                                END;
                            'APPROVER3':
                                BEGIN
                                    IF DimValue.Approver3 <> '' THEN
                                        ApproverDimValue.GET(LevelBasedApprovalSetup."Approver3 Dimension Code", DimValue.Approver3);
                                END;
                            'APPROVER4':
                                BEGIN
                                    IF DimValue.Approver4 <> '' THEN
                                        ApproverDimValue.GET(LevelBasedApprovalSetup."Approver4 Dimension Code", DimValue.Approver4);
                                END;
                            'APPROVER5':
                                BEGIN
                                    IF DimValue.Approver5 <> '' THEN
                                        ApproverDimValue.GET(LevelBasedApprovalSetup."Approver5 Dimension Code", DimValue.Approver5);
                                END;
                            'APPROVER6':
                                BEGIN
                                    IF DimValue.Approver6 <> '' THEN
                                        ApproverDimValue.GET(LevelBasedApprovalSetup."Approver6 Dimension Code", DimValue.Approver6);
                                END;
                                //TODO: add new approvers processing here:
                        END;
                        IF ApproverDimValue.Code <> '' THEN BEGIN
                            UserSetup.RESET;
                            UserSetup.SETRANGE("User ID", ApproverDimValue."User ID");
                            IF NOT UserSetup.FINDFIRST THEN
                                ERROR(UserIDDoesNotExistInUserSetupTxt, ApproverDimValue."User ID", ApproverDimValue."Dimension Code", ApproverDimValue.Code);

                            // HBS VK 2016-12-05 #10296 >>
                            IF LevelBasedApprovalSetup."Restrict Self-Approval" THEN
                                IF UserSetup."User ID" = USERID THEN
                                    UserSetup.GET(UserSetup."Approver ID");
                            // HBS VK 2016-12-05 #10296 <<



                            IF IsSufficientApprover(UserSetup, ApprovalEntryArgument."Amount (LCY)", LevelbasedApproval.Level, DocumentSubType) OR (NOT SufficientApproverOnly) THEN
                                MakeApprovalEntry(ApprovalEntryArgument, SequenceNo, UserSetup."User ID", WorkflowStepArgument);

                        END;

                    END ELSE BEGIN
                        UserSetup.RESET;
                        UserSetup.SETRANGE("User ID", LevelbasedApproval."User ID");
                        IF NOT UserSetup.FINDFIRST THEN
                            ERROR(UserIDDoesNotExistInUserSetupTxt, LevelbasedApproval."User ID", LevelbasedApproval.Level, LevelbasedApproval.Description);

                        // HBS VK 2016-12-05 #10296 >>
                        IF LevelBasedApprovalSetup."Restrict Self-Approval" THEN
                            IF UserSetup."User ID" = USERID THEN
                                UserSetup.GET(UserSetup."Approver ID");
                        // HBS VK 2016-12-05 #10296 <<
                        IF IsSufficientApprover(UserSetup, ApprovalEntryArgument."Amount (LCY)", LevelbasedApproval.Level, DocumentSubType) OR (NOT SufficientApproverOnly) THEN // HBS VK 01032017 Ticket #10434
                            MakeApprovalEntry(ApprovalEntryArgument, SequenceNo, UserSetup."User ID", WorkflowStepArgument);
                    END;

                    IF ((NOT LevelbasedApproval."Company Level Approval") AND (ApproverDimValue.Code <> '')) OR (LevelbasedApproval."Company Level Approval") THEN BEGIN
                        SufficientApprover := IsSufficientApprover(UserSetup, ApprovalEntryArgument."Amount (LCY)", LevelbasedApproval.Level, DocumentSubType);
                        SequenceNo += 1;
                    END;
                UNTIL (LevelbasedApproval.NEXT = 0) OR SufficientApprover;
            END;
        END ELSE
            ERROR(GlobalDimension1CannotBeBlankTxt, ApprovalEntryArgument."Approval Code", ApprovalEntryArgument."Approval Type");
    end;

    local procedure IsSufficientApprover(UserSetup: Record "User Setup"; ApprovalAmountLCY: Decimal; Level: Code[20]; DocSubType: Option "Normal Purchase","Asset Purchase"): Boolean
    var
        PurchaseHeader: Record "Purchase Header";
        LevelbasedApproval: Record "Level Based Approval";
    begin
        IF UserSetup."User ID" = UserSetup."Approver ID" THEN
            EXIT(TRUE);

        LevelbasedApproval.SETRANGE(Level, Level);
        IF LevelbasedApproval.FINDFIRST THEN
            CASE DocSubType OF
                DocSubType::"Normal Purchase":
                    IF LevelbasedApproval."Unlimited Normal Purch Limit" OR
                       ((ApprovalAmountLCY <= LevelbasedApproval."Normal Purchase Amount Limit") AND (LevelbasedApproval."Normal Purchase Amount Limit" <> 0))
                    THEN
                        EXIT(TRUE);
                ELSE
                    IF LevelbasedApproval."Unlimited Asset Purchase Limit" OR
                      ((ApprovalAmountLCY <= LevelbasedApproval."Asset Purchase Amount Limit") AND (LevelbasedApproval."Asset Purchase Amount Limit" <> 0))
                    THEN
                        EXIT(TRUE);
            END;

        EXIT(FALSE);
    end;

    local procedure GetLastSequenceNo(ApprovalEntryArgument: Record "Approval Entry"): Integer
    var
        ApprovalEntry: Record "Approval Entry";
    begin
        WITH ApprovalEntry DO BEGIN
            SETCURRENTKEY("Record ID to Approve", "Workflow Step Instance ID", "Sequence No.");
            SETRANGE("Table ID", ApprovalEntryArgument."Table ID");
            SETRANGE("Record ID to Approve", ApprovalEntryArgument."Record ID to Approve");
            SETRANGE("Workflow Step Instance ID", ApprovalEntryArgument."Workflow Step Instance ID");
            IF FINDLAST THEN
                EXIT("Sequence No.");
        END;
        EXIT(0);
    end;

    local procedure CheckLinkExists(PurchHeader: Record "Purchase Header"): Boolean
    var
        RecRef: RecordRef;
    begin
        // HBSVK 2015-12-01 Start:
        IF NOT (PurchHeader."Document Type" IN [PurchHeader."Document Type"::Order, PurchHeader."Document Type"::Invoice]) THEN
            EXIT;
        // HBSSA 2016-02-19 Change links to Incoming Documents. Only for NAV2016. Start:
        // RecRef.GETTABLE(PurchHeader);
        // IF NOT RecRef.HASLINKS THEN
        IF PurchHeader."Incoming Document Entry No." = 0 THEN
            // HBSSA 2016-02-19 Change links to Incoming Documents. Only for NAV2016 End:
            IF NOT CONFIRM(ThereAreNoLinksAttachedTxt, FALSE) THEN
                ERROR('');
        // HBSVK 2015-12-01 End:
    end;

    local procedure SetApproverType(WorkflowStepArgument: Record "Workflow Step Argument"; var ApprovalEntry: Record "Approval Entry")
    begin
        // CASE WorkflowStepArgument."Approver Type" OF
        //  WorkflowStepArgument."Approver Type"::"Global Dimension 1":
        //    ApprovalEntry."Approval Type" := ApprovalEntry."Approval Type"::"Global Dimension 1";
        // END;
        CASE WorkflowStepArgument."CarePoint Approval Type" OF
            WorkflowStepArgument."CarePoint Approval Type"::"Global Dimension 1":
                BEGIN
                    ApprovalEntry."CarePoint Approval Type" := ApprovalEntry."CarePoint Approval Type"::"Global Dimension 1";
                END;
            WorkflowStepArgument."CarePoint Approval Type"::Approver:
                BEGIN
                    ApprovalEntry."Approval Type" := ApprovalEntry."Approval Type"::Approver;
                    ApprovalEntry."CarePoint Approval Type" := ApprovalEntry."CarePoint Approval Type"::Approver;
                END;
            WorkflowStepArgument."CarePoint Approval Type"::"Salesperson/Purchaser":
                BEGIN
                    ApprovalEntry."Approval Type" := ApprovalEntry."Approval Type"::"Sales Pers./Purchaser";
                    ApprovalEntry."CarePoint Approval Type" := ApprovalEntry."CarePoint Approval Type"::"Sales Pers./Purchaser"
                END;
            WorkflowStepArgument."CarePoint Approval Type"::"Workflow User Group":
                BEGIN
                    ApprovalEntry."Approval Type" := ApprovalEntry."Approval Type"::"Workflow User Group";
                    ApprovalEntry."CarePoint Approval Type" := ApprovalEntry."CarePoint Approval Type"::"Workflow User Group";
                END;
        END;
    end;

    local procedure SetLimitType(WorkflowStepArgument: Record "Workflow Step Argument"; var ApprovalEntry: Record "Approval Entry")
    begin
        CASE WorkflowStepArgument."Approver Limit Type" OF
            WorkflowStepArgument."Approver Limit Type"::"Approver Chain",
          WorkflowStepArgument."Approver Limit Type"::"First Qualified Approver":
                ApprovalEntry."Limit Type" := ApprovalEntry."Limit Type"::"Approval Limits";
        END;

        IF ApprovalEntry."Approval Type" = ApprovalEntry."Approval Type"::"Workflow User Group" THEN
            ApprovalEntry."Limit Type" := ApprovalEntry."Limit Type"::"No Limits";
    end;

    [EventSubscriber(ObjectType::Codeunit, 2000000004, 'CaptionClassTranslate', '', false, false)]
    procedure GetApproverCaption(Language: Integer; CaptionExpr: Text[1024]; var Translation: Text[1024])
    var
        LevelBasedApprovalSetup: Record "Level Based Approval Setup";
    begin
        IF LevelBasedApprovalSetup.GET THEN;
        CASE CaptionExpr OF
            'Approver1':
                BEGIN
                    IF LevelBasedApprovalSetup.Approver1 <> '' THEN
                        Translation := LevelBasedApprovalSetup.Approver1
                    ELSE
                        Translation := LevelBasedApprovalSetup.FIELDCAPTION(Approver1);
                END;
            'Approver2':
                BEGIN
                    IF LevelBasedApprovalSetup.Approver2 <> '' THEN
                        Translation := LevelBasedApprovalSetup.Approver2
                    ELSE
                        Translation := LevelBasedApprovalSetup.FIELDCAPTION(Approver2);
                END;
            'Approver3':
                BEGIN
                    IF LevelBasedApprovalSetup.Approver3 <> '' THEN
                        Translation := LevelBasedApprovalSetup.Approver3
                    ELSE
                        Translation := LevelBasedApprovalSetup.FIELDCAPTION(Approver3);
                END;
            'Approver4':
                BEGIN
                    IF LevelBasedApprovalSetup.Approver4 <> '' THEN
                        Translation := LevelBasedApprovalSetup.Approver4
                    ELSE
                        Translation := LevelBasedApprovalSetup.FIELDCAPTION(Approver4);
                END;
            'Approver5':
                BEGIN
                    IF LevelBasedApprovalSetup.Approver5 <> '' THEN
                        Translation := LevelBasedApprovalSetup.Approver5
                    ELSE
                        Translation := LevelBasedApprovalSetup.FIELDCAPTION(Approver5);
                END;
            'Approver6':
                BEGIN
                    IF LevelBasedApprovalSetup.Approver6 <> '' THEN
                        Translation := LevelBasedApprovalSetup.Approver6
                    ELSE
                        Translation := LevelBasedApprovalSetup.FIELDCAPTION(Approver6);
                END;
                //TODO: Add new approvers here
        END;
    end;

    [EventSubscriber(ObjectType::Codeunit, 90, 'OnBeforePostPurchaseDoc', '', false, false)]
    procedure PurchaseAuthorization(var PurchaseHeader: Record "Purchase Header")
    var
        PurchSetup: Record "Purchases & Payables Setup";
    begin
        //HBSTG PA1.02 2015-09-21 >>
        PurchSetup.GET;
        IF PurchSetup."Invoice Auth. Mandatory" THEN
            IF PurchaseHeader."Document Type" IN [PurchaseHeader."Document Type"::Invoice, PurchaseHeader."Document Type"::Order] THEN
                PurchaseHeader.TESTFIELD("Invoice Authorized", TRUE);
        //HBSTG PA1.02 2015-09-21 <<
    end;
}

