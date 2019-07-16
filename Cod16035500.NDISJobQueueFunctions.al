codeunit 16035500 "NDIS Job Queue Functions"
{
    // version CAREPOINT1.00

    // HBSVK 2016-06-20 Object created (ticket #10021, ticket #10206)
    // ReSRP 2018-08-14: Code added for NDIS Claim Reference (Ticket #10997)

    Subtype = Normal;
    TableNo = 472;

    trigger OnRun()
    var
        ServiceActivity: Record "msdyn_workorder";
        ServiceActivityTmp: Record "msdyn_workorder" temporary;
        BankAccount: Record "Bank Account";
        PurchaseHeader: Record "Purchase Header";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        HBSCRMIntegrationMgt: Codeunit "HBS CRM Integration Mgt.";
    begin
        CASE "Parameter String" OF
            'CHANGEPOPOSTINGDATE':
                BEGIN
                    PurchaseHeader.SETFILTER(Status, '<>%1', PurchaseHeader.Status::"Pending Approval");
                    IF NOT PurchaseHeader.ISEMPTY THEN BEGIN
                        PurchaseHeader.SetHideValidationDialog(TRUE);
                        PurchaseHeader.MODIFYALL("Posting Date", TODAY, TRUE);
                    END;
                END;
            'PROCESS_SERVICE_ACTIVITY':
                BEGIN
                    //      ServiceActivity.SETCURRENTKEY(traversedpath,Status);
                    //      ServiceActivity.SETRANGE(traversedpath,ServiceActivity.traversedpath::"7");
                    //      ServiceActivity.SETRANGE(Status,ServiceActivity.Status::"0");
                    //      ServiceActivity.SETFILTER(msdyn_StateOrProvince,'<>%1','{00000000-0000-0000-0000-000000000000}');
                    //      ServiceActivity.SETRANGE("Error Status",FALSE);
                    //      ServiceActivity.SETRANGE("System Created",FALSE);
                    //      IF ServiceActivity.FINDSET(FALSE,FALSE) THEN
                    //        REPEAT
                    //          ServiceActivityTmp := ServiceActivity;
                    //          ServiceActivityTmp.INSERT;
                    //        UNTIL ServiceActivity.NEXT = 0;
                    //
                    //      IF ServiceActivityTmp.FINDSET(FALSE,FALSE) THEN
                    //        REPEAT
                    //          IF ProcessCompletedServiceActivity(ServiceActivityTmp) THEN
                    //            COMMIT
                    //          ELSE BEGIN
                    //            SetErrorRec(ServiceActivityTmp,GETLASTERRORTEXT);
                    //            COMMIT;
                    //            ERROR(ServActivityProcessingFailedErr,ServiceActivityTmp.UTCConversionTimeZoneCode,GETLASTERRORTEXT); // TODO: replace with event
                    //          END;
                    //        UNTIL ServiceActivityTmp.NEXT = 0;
                END;
            'PROCESS_PANTRY_INVOICES':
                BEGIN
                    //        SalesInvoiceHeader.SETRANGE("Pantry Invoice",TRUE);
                    //        SalesInvoiceHeader.SETRANGE("Session ID",'');
                    //        IF SalesInvoiceHeader.FINDSET THEN
                    //          REPEAT
                    //            HBSCRMIntegrationMgt.ProcessPantryServiceInvoice(SalesInvoiceHeader);
                    //          UNTIL SalesInvoiceHeader.NEXT = 0;
                END;
        END;
    end;

    var
        HBSWorkflowMgt: Codeunit "HBS Workflow Mgt.";
        ServActivityProcessingFailedErr: Label 'Service Activity processing failed. Activity id: %1. Detailed description: %2.';

    local procedure ProcessCreatedServiceActivity()
    begin
    end;

    [TryFunction]
    local procedure ProcessCompletedServiceActivity(ServiceActivityTmp: Record "msdyn_workorder")
    var
        ServiceActivity: Record "msdyn_workorder";
        Job: Record "Job";
        JobTask: Record "Job Task";
        CRMJobTask: Record "msdyn_workorderservice";
        JobPlanningLine: Record "Job Planning Line";
        CRMService: Record "CRM Resource";
        CRMIntegrationRecord: Record "CRM Integration Record";
        IntegrationRecord: Record "Integration Record";
        WorkType: Record "Work Type";
        Resource: Record "Resource";
        CRMSystemuser: Record "CRM Systemuser";
    begin
        /*
        ServiceActivity.GET(ServiceActivityTmp.UTCConversionTimeZoneCode);
        ServiceActivity.TESTFIELD(traversedpath,ServiceActivity.traversedpath::"7");
        ServiceActivity.TESTFIELD(Status,ServiceActivity.Status::"0");
        ServiceActivity.TESTFIELD("Error Status",FALSE);
        ServiceActivity.TESTFIELD("System Created",FALSE);
        IF ServiceActivity.msdyn_StateOrProvince = '{00000000-0000-0000-0000-000000000000}' THEN
          ServiceActivity.FIELDERROR(msdyn_StateOrProvince);
        
        CRMJobTask.GET(ServiceActivity.msdyn_StateOrProvince);
        JobTask.GET(CRMJobTask.msdyn_InternalDescription,CRMJobTask.msdyn_InternalFlags);
        Job.GET(CRMJobTask.msdyn_InternalDescription);
        CRMService.GET(ServiceActivity.msdyn_SubtotalAmount);
        CRMIntegrationRecord.SETRANGE("CRM ID",CRMService.CreatedOn);
        CRMIntegrationRecord.FINDFIRST;
        IntegrationRecord.GET(CRMIntegrationRecord."Integration ID");
        WorkType.GET(IntegrationRecord."Record ID");
        // CRMSystemuser.GET(ServiceActivity.hbs_resources);
        // Resource.SETRANGE("Time Sheet Owner User ID",CRMSystemuser.DomainName);
        // Resource.FINDFIRST;
        
        JobPlanningLine.SETRANGE("Job No.",JobTask."Job No.");
        JobPlanningLine.SETRANGE("Job Task No.",JobTask."Job Task No.");
        IF JobPlanningLine.FINDLAST THEN;
        
        JobPlanningLine.INIT;
        JobPlanningLine.VALIDATE("Job No.",JobTask."Job No.");
        JobPlanningLine.VALIDATE("Job Task No.",JobTask."Job Task No.");
        JobPlanningLine."Line No." := JobPlanningLine."Line No." + 10000;
        JobPlanningLine.VALIDATE("Line Type",JobPlanningLine."Line Type"::Billable);
        JobPlanningLine.VALIDATE(Type,JobPlanningLine.Type::Resource);
        JobPlanningLine.VALIDATE("No.",Job."Person Responsible");
        JobPlanningLine.VALIDATE("Work Type Code",WorkType.Code);
        JobPlanningLine.Description := ServiceActivity.msdyn_ChildIndex;
        IF ServiceActivity.OverriddenCreatedOn <> 0 THEN
          JobPlanningLine.VALIDATE(Quantity,ServiceActivity.OverriddenCreatedOn / 60); // TODO: case for non-duration services
        JobPlanningLine.VALIDATE("Work Order Id",ServiceActivity.UTCConversionTimeZoneCode);
        JobPlanningLine.VALIDATE("Scheduled Start",ServiceActivity.TimeZoneRuleVersionNumber);
        JobPlanningLine.VALIDATE("Scheduled End",ServiceActivity.ModifiedOn);
        
        JobPlanningLine.INSERT(TRUE);
        
        ServiceActivity."Job No." := JobTask."Job No.";
        ServiceActivity."Job Task No." := JobTask."Job Task No.";
        ServiceActivity."Resource No." := Resource."No.";
        ServiceActivity."Work Type Code" := WorkType.Code;
        ServiceActivity.Status := ServiceActivity.Status::"2";
        ServiceActivity.MODIFY(TRUE);
        
        //ServiceActivity."Invoice Created" := TRUE;
        //ServiceActivity."Invoice No." := ''; //TODO: replace with Order No.
        //ServiceActivity.MODIFY(TRUE);
        */

    end;

    local procedure SetErrorRec(ServiceActivity: Record "msdyn_workorder"; ErrorText: Text)
    begin
        /*
        ServiceActivity."Error Status" := TRUE;
        ServiceActivity."Error Description" := COPYSTR(ErrorText,1,MAXSTRLEN(ServiceActivity."Error Description"));
        ServiceActivity.MODIFY;
        */

    end;

    [EventSubscriber(ObjectType::Codeunit, 80, 'OnBeforePostSalesDoc', '', false, false)]
    [TryFunction]
    local procedure CheckJobSalesLine(var SalesHeader: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
    begin
        SalesLine.SETRANGE("Document Type", SalesHeader."Document Type");
        SalesLine.SETRANGE("Document No.", SalesHeader."No.");
        IF SalesLine.FINDSET THEN
            REPEAT
                IF SalesLine."Job Task No." <> '' THEN
                    SalesLine.TESTFIELD("Unit Price");
            UNTIL SalesLine.NEXT = 0;
    end;

    [EventSubscriber(ObjectType::Codeunit, 80, 'OnAfterPostSalesDoc', '', false, false)]
    procedure CreateNDISRegister_OnAfterSalesPost(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20])
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesInvoiceLine: Record "Sales Invoice Line";
        NDISUploadRegister: Record "NDIS Upload Register";
        Job: Record "Job";
        NDISUploadRegister1: Record "NDIS Upload Register";
        EntryNo: Integer;
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
        SalesCrMemoLine: Record "Sales Cr.Memo Line";
    begin
        //Posting of sales credit note
        IF SalesCrMemoHdrNo <> '' THEN BEGIN
            SalesCrMemoHeader.RESET;
            SalesCrMemoHeader.GET(SalesCrMemoHdrNo);
            SalesCrMemoLine.RESET;
            SalesCrMemoLine.SETRANGE("Document No.", SalesCrMemoHdrNo);
            SalesCrMemoLine.SETFILTER("NDIS Claim Reference Code", '<>%1', '');
            IF SalesCrMemoLine.FINDSET THEN BEGIN
                REPEAT
                    //Update corrected if claim reference already exist
                    NDISUploadRegister1.RESET;
                    NDISUploadRegister1.SETRANGE("NDIS Claim Reference Code", SalesCrMemoLine."NDIS Claim Reference Code");
                    //NDISUploadRegister1.SETRANGE("Work Type Code",SalesCrMemoLine."Work Type Code");
                    IF NDISUploadRegister1.FINDSET THEN BEGIN
                        REPEAT
                            IF (NDISUploadRegister1.Status = NDISUploadRegister1.Status::ERROR) THEN BEGIN
                                NDISUploadRegister1.Status := NDISUploadRegister1.Status::REVERSED;
                                NDISUploadRegister1.MODIFY;
                            END;
                        UNTIL NDISUploadRegister1.NEXT = 0;
                    END;
                UNTIL SalesCrMemoLine.NEXT = 0;
            END;
        END;

        //Posting of sales Invoices
        IF SalesInvHdrNo <> '' THEN BEGIN
            SalesInvoiceHeader.RESET;
            SalesInvoiceHeader.GET(SalesInvHdrNo);

            SalesInvoiceLine.RESET;
            SalesInvoiceLine.SETRANGE("Document No.", SalesInvHdrNo);
            SalesInvoiceLine.SETFILTER("NDIS Claim Reference Code", '<>%1', '');
            IF SalesInvoiceLine.FINDSET THEN BEGIN
                REPEAT

                    //Update corrected if claim reference already exist
                    NDISUploadRegister1.RESET;
                    NDISUploadRegister1.SETRANGE("NDIS Claim Reference Code", SalesInvoiceLine."NDIS Claim Reference Code");
                    //NDISUploadRegister1.SETRANGE("Work Type Code",SalesInvoiceLine."Work Type Code");
                    IF NDISUploadRegister1.FINDSET THEN BEGIN
                        REPEAT
                            IF (NDISUploadRegister1.Status = NDISUploadRegister1.Status::ERROR) OR (NDISUploadRegister1.Status = NDISUploadRegister1.Status::REVERSED) THEN BEGIN
                                NDISUploadRegister1.Status := NDISUploadRegister1.Status::CORRECTED;
                                NDISUploadRegister1.MODIFY;
                            END;
                        UNTIL NDISUploadRegister1.NEXT = 0;
                    END;
                    //Insert NDIS Upload register.
                    CLEAR(NDISUploadRegister);
                    Job.GET(SalesInvoiceLine."Job No.");
                    IF Job."NDIA Claim" THEN BEGIN
                        NDISUploadRegister1.RESET;
                        IF NDISUploadRegister1.FINDLAST THEN
                            EntryNo := NDISUploadRegister1."Entry No." + 1
                        ELSE
                            EntryNo := 1;
                        NDISUploadRegister1.RESET;
                        NDISUploadRegister1.SETRANGE("Posted Sales Invoice No.", SalesInvoiceHeader."No.");
                        NDISUploadRegister1.SETRANGE("NDIS Claim Reference Code", SalesInvoiceLine."NDIS Claim Reference Code");
                        //NDISUploadRegister1.SETRANGE("Work Type Code",SalesInvoiceLine."Work Type Code");
                        IF NOT NDISUploadRegister1.FINDFIRST THEN BEGIN
                            WITH NDISUploadRegister DO BEGIN
                                RESET;
                                INIT;
                                "Entry No." := EntryNo;
                                "Posted Sales Invoice No." := SalesInvoiceHeader."No.";
                                "Sell-to Customer No." := SalesInvoiceHeader."Sell-to Customer No.";
                                "Sell-to Customer Name" := SalesInvoiceHeader."Sell-to Customer Name";
                                "Posting Date" := SalesInvoiceHeader."Posting Date";
                                "Shipment Date" := SalesInvoiceLine."Shipment Date";
                                "Posted Sales Invoice Line No." := SalesInvoiceLine."Line No.";
                                "Job No." := SalesInvoiceLine."Job No.";
                                "Job Task No." := SalesInvoiceLine."Job Task No.";
                                Status := NDISUploadRegister.Status::OPEN;
                                "NDIS Claim Reference Code" := SalesInvoiceLine."NDIS Claim Reference Code";
                                Quantity := SalesInvoiceLine.Quantity;
                                Amount := SalesInvoiceLine.Amount;
                                "Work Type Code" := SalesInvoiceLine."Work Type Code";
                                "Date Logged" := WORKDATE;
                                "Time Logged" := TIME;
                                "Logged By" := USERID;
                                INSERT();
                            END;
                        END ELSE BEGIN
                            NDISUploadRegister1.Amount += SalesInvoiceLine."Amount Including VAT";
                            NDISUploadRegister1.Quantity += SalesInvoiceLine.Quantity;
                            NDISUploadRegister1.MODIFY();
                        END;
                    END;
                UNTIL SalesInvoiceLine.NEXT = 0;
            END;
        END;
    end;
}

