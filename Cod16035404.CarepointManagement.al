codeunit 16035404 "Carepoint Management"
{
    // version CAREPOINT1.00

    // ReSRP #10882:Code added to flow Bank Reference field


    trigger OnRun()
    begin
    end;

    var
        Text004: Label 'You cannot assign new numbers from the number series %1 on %2.';
        Text005: Label 'You cannot assign new numbers from the number series %1.';
        Text006: Label 'You cannot assign new numbers from the number series %1 on a date before %2.';
        Text007: Label 'You cannot assign numbers greater than %1 from the number series %2.';
        NoSeriesManagement: Codeunit "NoSeriesManagement";
        FileManagement: Codeunit "File Management";
        Text003a: Label 'Text Files (*.txt)|*.txt|All Files (*.*)|*.*';
        Text004a: Label 'Microsoft Excel Files (*.xl*)|*.xl*|All Files (*.*)|*.*';
        Text005a: Label 'Word Documents (*.doc)|*.doc|All Files (*.*)|*.*';
        Text006a: Label 'XML files (*.xml)|*.xml|All Files (*.*)|*.*';
        Text007a: Label 'HTM files (*.htm)|*.htm|All Files (*.*)|*.*';
        Text008a: Label 'XML Schema Files (*.xsd)|*.xsd|All Files (*.*)|*.*';
        Text009a: Label 'XSL Transform Files(*.xslt)|*.xslt|All Files (*.*)|*.*';

    [EventSubscriber(ObjectType::Codeunit, 12, 'OnAfterInitBankAccLedgEntry', '', false, false)]
    local procedure GenJnlPostSetBankReference(var BankAccountLedgerEntry: Record "Bank Account Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        BankAccountLedgerEntry."Bank Reference" := GenJournalLine."Bank Reference"; //ReSRP #10882:
    end;

    [EventSubscriber(ObjectType::Codeunit, 90, 'OnAfterDeleteAfterPosting', '', false, false)]
    local procedure OnAfterDeleteAfterPosting(PurchHeader: Record "Purchase Header"; PurchInvHeader: Record "Purch. Inv. Header"; PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr."; CommitIsSupressed: Boolean)
    var
        PurchOrdMilestoneLine: Record "Purch. Ord. Milestone Line";
    begin
        //ReSRP 2017-11-01 Start:
        PurchOrdMilestoneLine.SETRANGE("Document Type", PurchHeader."Document Type");
        PurchOrdMilestoneLine.SETRANGE("No.", PurchHeader."No.");
        IF NOT PurchOrdMilestoneLine.ISEMPTY THEN
            PurchOrdMilestoneLine.DELETEALL;
        //ReSRP 2017-11-01 End:
    end;

    [EventSubscriber(ObjectType::Codeunit, 90, 'OnAfterInsertPostedHeaders', '', false, false)]
    local procedure OnAfterInsertPostedHeaders(var PurchaseHeader: Record "Purchase Header"; var PurchRcptHeader: Record "Purch. Rcpt. Header"; var PurchInvHeader: Record "Purch. Inv. Header"; var PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr."; var ReturnShptHeader: Record "Return Shipment Header")
    var
        PurchOrdMilestoneLine: Record "Purch. Ord. Milestone Line";
    begin
        //ReSRP 2017-11-01 Start:
        IF PurchRcptHeader."No." <> '' THEN
            CopyMilestoneLines(
              PurchaseHeader."Document Type", PurchOrdMilestoneLine."Document Type"::Receipt,
              PurchaseHeader."No.", PurchRcptHeader."No.");

        IF PurchInvHeader."No." <> '' THEN
            CopyMilestoneLines(
              PurchaseHeader."Document Type", PurchOrdMilestoneLine."Document Type"::Invoice,
              PurchaseHeader."No.", PurchInvHeader."No.");
        //ReSRP 2017-11-01 End:
    end;

    local procedure CopyMilestoneLines(FromDocumentType: Integer; ToDocumentType: Integer; FromNumber: Code[20]; ToNumber: Code[20])
    var
        PurchOrdMilestoneLine: Record "Purch. Ord. Milestone Line";
        PurchOrdMilestoneLine2: Record "Purch. Ord. Milestone Line";
    begin
        //ReSRP 2017-11-01 Start:
        PurchOrdMilestoneLine.SETRANGE("Document Type", FromDocumentType);
        PurchOrdMilestoneLine.SETRANGE("No.", FromNumber);
        IF PurchOrdMilestoneLine.FINDSET THEN
            REPEAT
                PurchOrdMilestoneLine2 := PurchOrdMilestoneLine;
                PurchOrdMilestoneLine2."Document Type" := ToDocumentType;
                PurchOrdMilestoneLine2."No." := ToNumber;
                PurchOrdMilestoneLine2.INSERT;
            UNTIL PurchOrdMilestoneLine.NEXT = 0;
        //ReSRP 2017-11-01 Start:
    end;

    procedure GetNextNoCompany(NoSeriesCode: Code[10]; SeriesDate: Date; ModifySeries: Boolean; NoErrorsOrWarnings: Boolean; ForCompanyName: Text): Code[20]
    var
        NoSeriesLine: Record "No. Series Line";
        NoSeries: Record "No. Series";
        LastNoSeriesLine: Record "No. Series Line";
        WarningNoSeriesCode: Code[20];
        TryNoSeriesCode: Code[20];
        TrySeriesDate: Date;
        TryNo: Code[20];
    begin
        // CAREPOINT1.00 >>
        IF COMPANYNAME <> ForCompanyName THEN BEGIN
            NoSeriesLine.CHANGECOMPANY(ForCompanyName);
            NoSeries.CHANGECOMPANY(ForCompanyName);
            LastNoSeriesLine.CHANGECOMPANY(ForCompanyName);
        END;

        IF SeriesDate = 0D THEN
            SeriesDate := WORKDATE;

        IF ModifySeries OR (LastNoSeriesLine."Series Code" = '') THEN BEGIN
            IF ModifySeries THEN
                NoSeriesLine.LOCKTABLE;
            NoSeries.GET(NoSeriesCode);
            NoSeriesManagement.SetNoSeriesLineFilter(NoSeriesLine, NoSeriesCode, SeriesDate);
            IF NOT NoSeriesLine.FINDFIRST THEN BEGIN
                IF NoErrorsOrWarnings THEN
                    EXIT('');
                NoSeriesLine.SETRANGE("Starting Date");
                IF NOT NoSeriesLine.ISEMPTY THEN
                    ERROR(
                      Text004,
                      NoSeriesCode, SeriesDate);
                ERROR(
                  Text005,
                  NoSeriesCode);
            END;
        END ELSE
            NoSeriesLine := LastNoSeriesLine;

        IF NoSeries."Date Order" AND (SeriesDate < NoSeriesLine."Last Date Used") THEN BEGIN
            IF NoErrorsOrWarnings THEN
                EXIT('');
            ERROR(
              Text006,
              NoSeries.Code, NoSeriesLine."Last Date Used");
        END;
        NoSeriesLine."Last Date Used" := SeriesDate;
        IF NoSeriesLine."Last No. Used" = '' THEN BEGIN
            IF NoErrorsOrWarnings AND (NoSeriesLine."Starting No." = '') THEN
                EXIT('');
            NoSeriesLine.TESTFIELD("Starting No.");
            NoSeriesLine."Last No. Used" := NoSeriesLine."Starting No.";
        END ELSE
            IF NoSeriesLine."Increment-by No." <= 1 THEN
                NoSeriesLine."Last No. Used" := INCSTR(NoSeriesLine."Last No. Used")
            ELSE
                NoSeriesManagement.IncrementNoText(NoSeriesLine."Last No. Used", NoSeriesLine."Increment-by No.");
        IF (NoSeriesLine."Ending No." <> '') AND
           (NoSeriesLine."Last No. Used" > NoSeriesLine."Ending No.")
        THEN BEGIN
            IF NoErrorsOrWarnings THEN
                EXIT('');
            ERROR(
              Text007,
              NoSeriesLine."Ending No.", NoSeriesCode);
        END;
        IF (NoSeriesLine."Ending No." <> '') AND
           (NoSeriesLine."Warning No." <> '') AND
           (NoSeriesLine."Last No. Used" >= NoSeriesLine."Warning No.") AND
           (NoSeriesCode <> WarningNoSeriesCode) AND
           (TryNoSeriesCode = '')
        THEN BEGIN
            IF NoErrorsOrWarnings THEN
                EXIT('');
            WarningNoSeriesCode := NoSeriesCode;
            MESSAGE(
              Text007,
              NoSeriesLine."Ending No.", NoSeriesCode);
        END;
        NoSeriesLine.VALIDATE(Open);

        IF ModifySeries THEN
            NoSeriesLine.MODIFY
        ELSE
            LastNoSeriesLine := NoSeriesLine;

        IF COMPANYNAME <> ForCompanyName THEN BEGIN
            NoSeriesLine.CHANGECOMPANY(COMPANYNAME);
            NoSeries.CHANGECOMPANY(COMPANYNAME);
            LastNoSeriesLine.CHANGECOMPANY(COMPANYNAME);
        END;

        EXIT(NoSeriesLine."Last No. Used");
        // CAREPOINT1.00 <<
    end;

    // procedure OpenFile(WindowTitle: Text[50]; DefaultFileName: Text[1024]; DefaultFileType: Option " ",Text,Excel,Word,Custom,Xml,Htm,Xsd,Xslt; FilterString: Text[250]; "Action": Option Open,Save): Text[260]
    // var
    //     "Filter": Text[255];
    //     // CommonDialogControl: DotNet FolderBrowserDialog;
    // begin
    //     // CAREPOINT1.00 >>
    //     IF DefaultFileType = DefaultFileType::Custom THEN BEGIN
    //         GetDefaultFileType(DefaultFileName, DefaultFileType);
    //         Filter := FilterString;
    //     END ELSE
    //         Filter := GetFilterString(DefaultFileType);

    //     IF Action = Action::Open THEN
    //         EXIT(FileManagement.OpenFileDialog(WindowTitle, DefaultFileName, Filter))
    //     ELSE
    //         EXIT(FileManagement.SaveFileDialog(WindowTitle, DefaultFileName, Filter));

    //     // CAREPOINT1.00 <<
    // end;

    // procedure OpenFileWithName(DefaultFileName: Text[1024]): Text[260]
    // var
    //     DefaultFileType: Option " ",Text,Excel,Word,Custom,Xml,Htm,Xsd,Xslt;
    //     FilterString: Text[250];
    //     "Action": Option Open,Save;
    // begin
    //     // CAREPOINT1.00 >>
    //     GetDefaultFileType(DefaultFileName, DefaultFileType);
    //     IF DefaultFileType = DefaultFileType::Custom THEN
    //         FilterString := Text003a;

    //     EXIT(OpenFile('', DefaultFileName, DefaultFileType, FilterString, Action::Open));
    //     // CAREPOINT1.00 <<
    // end;

    local procedure GetDefaultFileType(DefaultFileName: Text[1024]; var DefaultFileType: Option " ",Text,Excel,Word,Custom,Xml,Htm,Xsd,Xslt)
    begin
        // CAREPOINT1.00 >>
        CASE TRUE OF
            CheckFileNameForFileType(DefaultFileName, '.DOC'):
                DefaultFileType := DefaultFileType::Word;
            CheckFileNameForFileType(DefaultFileName, '.XLS'):
                DefaultFileType := DefaultFileType::Excel;
            CheckFileNameForFileType(DefaultFileName, '.TXT'):
                DefaultFileType := DefaultFileType::Custom;
            CheckFileNameForFileType(DefaultFileName, '.XML'):
                DefaultFileType := DefaultFileType::Xml;
            CheckFileNameForFileType(DefaultFileName, '.HTM'):
                DefaultFileType := DefaultFileType::Htm;
            CheckFileNameForFileType(DefaultFileName, '.XSD'):
                DefaultFileType := DefaultFileType::Xsd;
            CheckFileNameForFileType(DefaultFileName, '.XSLT'):
                DefaultFileType := DefaultFileType::Xslt;
            ELSE
                DefaultFileType := DefaultFileType::Custom;
        END;
        // CAREPOINT1.00 <<
    end;

    local procedure CheckFileNameForFileType(DefaultFileName: Text[1024]; FileExtension: Text[5]): Boolean
    var
        Position: Integer;
    begin
        // CAREPOINT1.00 >>
        Position := STRPOS(UPPERCASE(DefaultFileName), FileExtension);
        EXIT((Position > 0) AND (Position - 1 = STRLEN(DefaultFileName) - STRLEN(FileExtension)));
        // CAREPOINT1.00 <<
    end;

    procedure GetFilterString(FileType: Option " ",Text,Excel,Word,Custom,Xml,Htm,Xsd,Xslt): Text[255]
    begin
        // CAREPOINT1.00 >>
        CASE FileType OF
            FileType::Text:
                EXIT(Text003a);
            FileType::Excel:
                EXIT(Text004a);
            FileType::Word:
                EXIT(Text005a);
            FileType::Xml:
                EXIT(Text006a);
            FileType::Htm:
                EXIT(Text007a);
            FileType::Xsd:
                EXIT(Text008a);
            FileType::Xslt:
                EXIT(Text009a);
            FileType::Custom:
                EXIT('');
        END;
        // CAREPOINT1.00 <<
    end;

    // procedure DownloadFile(TempFileName: Text[1024]; FileName: Text[1024])
    // var
    //     FileObject: Automation;
    // begin
    //     // CAREPOINT1.00 >>
    //     TempFileName := FileManagement.DownloadTempFile(TempFileName);

    //     IF ISCLEAR(FileObject) THEN

    //         CREATE(FileObject, TRUE, TRUE);

    //     IF FileObject.FileExists(FileName) THEN

    //         FileObject.DeleteFile(FileName, TRUE);

    //     FileObject.MoveFile(TempFileName, FileName);
    //     // CAREPOINT1.00 <<
    // end;

    [EventSubscriber(ObjectType::Codeunit, 1002, 'OnBeforeInsertSalesLine', '', false, false)]
    local procedure OnBeforeInsertSalesLine(var SalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header"; Job: Record "Job"; JobPlanningLine: Record "Job Planning Line")
    begin
        //ReSRP 2018-04-09 Start:
        IF SalesHeader."Document Type" = SalesHeader."Document Type"::Invoice THEN BEGIN
            IF Job."NDIA Claim" THEN BEGIN
                IF SalesLine.Type <> SalesLine.Type::" " THEN BEGIN
                    IF SalesLine."NDIS Claim Reference Code" = '' THEN BEGIN
                        SalesLine.TESTFIELD("Work Type Code");
                        SalesLine."NDIS Claim Reference Code" := GetNDISClaimReferece(SalesLine);
                        JobPlanningLine."NDIS Claim Reference Code" := SalesLine."NDIS Claim Reference Code";
                        SalesLine.MODIFY;
                    END;
                END;
            END;
        END ELSE BEGIN
            SalesLine."NDIS Claim Reference Code" := JobPlanningLine."NDIS Claim Reference Code";
            SalesLine.MODIFY;
        END;
        //ReSRP 2018-04-09 End:
    end;

    local procedure GetNDISClaimReferece(pSalesLine: Record "Sales Line"): Code[20]
    var
        CarepointSetup: Record "Carepoint Setup";
        LSalesLine: Record "Sales Line";
        NoSeriesManagement: Codeunit "NoSeriesManagement";
    begin
        //ReSRP 2018-04-09 Start:
        CarepointSetup.GET;
        IF CarepointSetup."NDIS Claims No Issued Type" = CarepointSetup."NDIS Claims No Issued Type"::Bulk THEN BEGIN
            LSalesLine.RESET;
            LSalesLine.SETRANGE("Document Type", pSalesLine."Document Type");
            LSalesLine.SETRANGE("Document No.", pSalesLine."Document No.");
            LSalesLine.SETRANGE("Work Type Code", pSalesLine."Work Type Code");
            IF LSalesLine.FINDFIRST THEN BEGIN
                IF LSalesLine."NDIS Claim Reference Code" <> '' THEN BEGIN
                    EXIT(LSalesLine."NDIS Claim Reference Code");
                END ELSE BEGIN
                    CarepointSetup.TESTFIELD("NDIS Claim No. Series");
                    EXIT(NoSeriesManagement.GetNextNo(CarepointSetup."NDIS Claim No. Series", WORKDATE, TRUE));
                END
            END;
        END ELSE
            IF CarepointSetup."NDIS Claims No Issued Type" = CarepointSetup."NDIS Claims No Issued Type"::Individual THEN BEGIN
                CarepointSetup.TESTFIELD("NDIS Claim No. Series");
                EXIT(NoSeriesManagement.GetNextNo(CarepointSetup."NDIS Claim No. Series", WORKDATE, TRUE));
            END;
        //ReSRP 2018-04-09 End:
    end;

    procedure CheckReadyStatus(var JobPlanningLine: Record "Job Planning Line")
    begin
        //ReSRP 2018-04-09:Start:
        IF JobPlanningLine.FIND('-') THEN
            REPEAT
                IF NOT JobPlanningLine."CRM-Imported Entry" THEN
                    JobPlanningLine.TESTFIELD("Ready to Credit and Invoice", TRUE);
            UNTIL JobPlanningLine.NEXT = 0;
        //ReSRP 2018-04-09:End:
    end;

    [EventSubscriber(ObjectType::Table, 39, 'OnAfterDeleteEvent', '', false, false)]
    local procedure PurchaseLineOnDelete(var Rec: Record "Purchase Line"; RunTrigger: Boolean)
    var
        PurchOrdMilestoneLine: Record "Purch. Ord. Milestone Line";
    begin
        //ReSRP 2017-11-01 Start:
        PurchOrdMilestoneLine.SETRANGE("Document Type", Rec."Document Type");
        PurchOrdMilestoneLine.SETRANGE("No.", Rec."Document No.");
        PurchOrdMilestoneLine.SETRANGE("Document Line No.", Rec."Line No.");
        IF NOT PurchOrdMilestoneLine.ISEMPTY THEN
            PurchOrdMilestoneLine.DELETEALL;
        //ReSRP 2017-11-01 End:
    end;

    [EventSubscriber(ObjectType::Table, 39, 'OnAfterDeleteEvent', '', false, false)]
    local procedure PurchaseLineOnAfterUpdateAmountsDone(var Rec: Record "Purchase Line"; RunTrigger: Boolean)
    begin
        // HBS SA #10864 >>
        Rec."VAT Amount" := Rec."Amount Including VAT" - Rec."VAT Base Amount";
        Rec.MODIFY;
        // HBS SA #10864 <<
    end;

    [EventSubscriber(ObjectType::Table, 81, 'OnAfterValidateEvent', 'Account Type', false, false)]
    local procedure GenJnlLineOnAfterValidateAccountType(var Rec: Record "Gen. Journal Line"; var xRec: Record "Gen. Journal Line"; CurrFieldNo: Integer)
    begin
        //ReSRP 2018-04-18 Start:
        Rec.VALIDATE("Account Description", '');
        //ReSRP 2018-04-18 End:
    end;

    [EventSubscriber(ObjectType::Table, 81, 'OnAfterAccountNoOnValidateGetGLAccount', '', false, false)]
    local procedure GenJnlLineOnAfterAccountNoOnValidateGetGLAccount(var GenJournalLine: Record "Gen. Journal Line"; var GLAccount: Record "G/L Account")
    begin
        //ReSRP 2018-04-18 Start:
        GenJournalLine.VALIDATE("Account Description", GLAccount.Name);
        //ReSRP 2018-04-18 End:
    end;

    [EventSubscriber(ObjectType::Table, 81, 'OnAfterAccountNoOnValidateGetGLBalAccount', '', false, false)]
    local procedure GenJnlLineOnAfterAccountNoOnValidateGetGLBalAccount(var GenJournalLine: Record "Gen. Journal Line"; var GLAccount: Record "G/L Account")
    begin
        //ReSRP 2018-04-18 Start:
        GenJournalLine.VALIDATE("Account Description", GLAccount.Name);
        //ReSRP 2018-04-18 End:
        GenJournalLine."Bal. Account Description" := GLAccount.Name;  // HBS TG CAREPOINT1.00 2015-10-07
    end;

    [EventSubscriber(ObjectType::Table, 81, 'OnBeforeValidateEvent', 'Bal. Account No.', false, false)]
    local procedure GenJnlLineOnBeforeValidateBalAccountNo(var Rec: Record "Gen. Journal Line"; var xRec: Record "Gen. Journal Line"; CurrFieldNo: Integer)
    begin
        //ReSRP 2018-04-18 Start:
        Rec."Bal. Account Description" := '';  // HBS TG CAREPOINT1.00 2015-10-07
        //ReSRP 2018-04-18 End:
    end;

    [EventSubscriber(ObjectType::Table, 81, 'OnAfterAccountNoOnValidateGetCustomerBalAccount', '', false, false)]
    local procedure GenJnlLineOnAfterAccountNoOnValidateGetCustomerBalAccount(var GenJournalLine: Record "Gen. Journal Line"; var Customer: Record "Customer"; FieldNo: Integer)
    begin
        GenJournalLine."Bal. Account Description" := Customer.Name;  // HBS TG CAREPOINT1.00 2015-10-07
    end;

    [EventSubscriber(ObjectType::Table, 81, 'OnAfterAccountNoOnValidateGetVendorBalAccount', '', false, false)]
    local procedure GenJnlLineOnAfterAccountNoOnValidateGetVendorBalAccount(var GenJournalLine: Record "Gen. Journal Line"; var Vendor: Record "Vendor"; FieldNo: Integer)
    begin
        GenJournalLine."Bal. Account Description" := Vendor.Name;  // HBS TG CAREPOINT1.00 2015-10-07
    end;

    [EventSubscriber(ObjectType::Table, 81, 'OnAfterAccountNoOnValidateGetBankBalAccount', '', false, false)]
    local procedure GenJnlLineOnAfterAccountNoOnValidateGetBankBalAccount(var GenJournalLine: Record "Gen. Journal Line"; var BankAccount: Record "Bank Account"; FieldNo: Integer)
    begin
        GenJournalLine."Bal. Account Description" := BankAccount.Name;  // HBS TG CAREPOINT1.00 2015-10-07
    end;

    [EventSubscriber(ObjectType::Table, 81, 'OnAfterAccountNoOnValidateGetFABalAccount', '', false, false)]
    local procedure GenJnlLineOnAfterAccountNoOnValidateGetFABalAccount(var GenJournalLine: Record "Gen. Journal Line"; var FixedAsset: Record "Fixed Asset")
    begin
        GenJournalLine."Bal. Account Description" := FixedAsset.Description;  // HBS TG CAREPOINT1.00 2015-10-07
    end;

    [EventSubscriber(ObjectType::Table, 81, 'OnAfterAccountNoOnValidateGetICPartnerBalAccount', '', false, false)]
    local procedure GenJnlLineOnAfterAccountNoOnValidateGetICPartnerBalAccount(var GenJournalLine: Record "Gen. Journal Line"; var ICPartner: Record "IC Partner")
    begin
        GenJournalLine."Bal. Account Description" := ICPartner.Name;  // HBS TG CAREPOINT1.00 2015-10-07
    end;

    [EventSubscriber(ObjectType::Table, 91, 'OnAfterModifyEvent', '', false, false)]
    local procedure UserSetupOnAfterModify(var Rec: Record "User Setup"; var xRec: Record "User Setup"; RunTrigger: Boolean)
    var
        User: Record "User";
    begin
        // HBS TG CAREPOINT1.00 2014-09-22: Start >> code to update User Name automatically
        User.SETCURRENTKEY("User Name");
        User.SETRANGE("User Name", Rec."User ID");
        IF User.FINDFIRST THEN
            Rec."User Full Name" := User."Full Name";
        // HBS TG CAREPOINT1.00 2014-09-22: End <<
    end;

    [EventSubscriber(ObjectType::Table, 121, 'OnAfterDeleteEvent', '', false, false)]
    local procedure PurchRcptLineOnAfterDelete(var Rec: Record "Purch. Rcpt. Line"; RunTrigger: Boolean)
    var
        PurchOrdMilestoneLine: Record "Purch. Ord. Milestone Line";
    begin
        //ReSRP 2017-11-01 Start:
        PurchOrdMilestoneLine.SETRANGE("Document Type", PurchOrdMilestoneLine."Document Type"::Receipt);
        PurchOrdMilestoneLine.SETRANGE("No.", Rec."Document No.");
        PurchOrdMilestoneLine.SETRANGE("Document Line No.", Rec."Line No.");
        IF NOT PurchOrdMilestoneLine.ISEMPTY THEN
            PurchOrdMilestoneLine.DELETEALL;
        //ReSRP 2017-11-01 End:
    end;

    [EventSubscriber(ObjectType::Table, 123, 'OnAfterDeleteEvent', '', false, false)]
    local procedure PurchInvLineOnAfterDelete(var Rec: Record "Purch. Inv. Line"; RunTrigger: Boolean)
    var
        PurchOrdMilestoneLine: Record "Purch. Ord. Milestone Line";
    begin
        //ReSRP 2017-11-01 Start:
        PurchOrdMilestoneLine.SETRANGE("Document Type", PurchOrdMilestoneLine."Document Type"::Receipt);
        PurchOrdMilestoneLine.SETRANGE("No.", Rec."Document No.");
        PurchOrdMilestoneLine.SETRANGE("Document Line No.", Rec."Line No.");
        IF NOT PurchOrdMilestoneLine.ISEMPTY THEN
            PurchOrdMilestoneLine.DELETEALL;
        //ReSRP 2017-11-01 End:
    end;

    [EventSubscriber(ObjectType::Table, 125, 'OnAfterDeleteEvent', '', false, false)]
    local procedure PurchCrMemoLineOnAfterDelete(var Rec: Record "Purch. Cr. Memo Line"; RunTrigger: Boolean)
    var
        PurchOrdMilestoneLine: Record "Purch. Ord. Milestone Line";
    begin
        //ReSRP 2017-11-01 Start:
        PurchOrdMilestoneLine.SETRANGE("Document Type", PurchOrdMilestoneLine."Document Type"::Receipt);
        PurchOrdMilestoneLine.SETRANGE("No.", Rec."Document No.");
        PurchOrdMilestoneLine.SETRANGE("Document Line No.", Rec."Line No.");
        IF NOT PurchOrdMilestoneLine.ISEMPTY THEN
            PurchOrdMilestoneLine.DELETEALL;
        //ReSRP 2017-11-01 End:
    end;
}

