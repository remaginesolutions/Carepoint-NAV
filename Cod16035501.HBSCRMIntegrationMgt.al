codeunit 16035501 "HBS CRM Integration Mgt."
{
    // version CAREPOINT1.00


    trigger OnRun()
    begin
    end;

    var
        CarepointSetup: Record "Carepoint Setup";
        NoSerMgt: Codeunit "NoSeriesManagement";

    [EventSubscriber(ObjectType::Codeunit, 5345, 'OnAfterTransferRecordFields', '', false, false)]
    local procedure PopulateOnAfterTransferFields(SourceRecordRef: RecordRef;var DestinationRecordRef: RecordRef;var AdditionalFieldsWereModified: Boolean;DestinationIsInserted: Boolean)
    var
        DimValue: Record "Dimension Value";
        CRMProgramme: Record "CRM Programme";
        CRMSubprogramme: Record "CRM Subprogramme";
        FRef: FieldRef;
    begin
        IF (DestinationRecordRef.NUMBER = DATABASE::"CRM Subprogramme") AND (SourceRecordRef.NUMBER = DATABASE::"Dimension Value") THEN BEGIN
          SourceRecordRef.SETTABLE(DimValue);
          CRMProgramme.SETRANGE(hbs_name,DimValue.BusinessUnit);
          IF CRMProgramme.FINDFIRST THEN BEGIN
            FRef := DestinationRecordRef.FIELD(CRMSubprogramme.FIELDNO(hbs_programme));
            FRef.VALUE := CRMProgramme.hbs_programmeId;
            DestinationRecordRef.MODIFY;
          END;
        END;
    end;

    [EventSubscriber(ObjectType::Codeunit, 5345, 'OnAfterInsertRecord', '', false, false)]
    local procedure PopulateFieldsAfterInsert(IntegrationTableMapping: Record "Integration Table Mapping";SourceRecordRef: RecordRef;var DestinationRecordRef: RecordRef)
    var
        Job: Record "Job";
        msdyn_agreement: Record "msdyn_agreement";
        msdyn_agreement2: Record "msdyn_agreement";
        CRMAccountBillto: Record "CRM Account";
        CRMContactBillto: Record "CRM Contact";
        CRMAccountSellto: Record "CRM Account";
        CRMContactSellto: Record "CRM Contact";
        CRMProgramme: Record "CRM Programme";
        CRMSubprogramme: Record "CRM Subprogramme";
        DefaultDimension: Record "Default Dimension";
        Customer: Record "Customer";
        Vendor: Record "Vendor";
        CRMAccount: Record "CRM Account";
        CRMContact: Record "CRM Contact";
        CRMAccount2: Record "CRM Account";
        CRMContact2: Record "CRM Contact";
        NAVFieldRef: FieldRef;
        CRMFieldRef: FieldRef;
    begin
        // Job <> Agreement
        // IF ((DestinationRecordRef.NUMBER IN [DATABASE::Job]) AND (SourceRecordRef.NUMBER IN [DATABASE::msdyn_agreement])) THEN BEGIN
        //  SourceRecordRef.SETTABLE(msdyn_agreement2);
        //  msdyn_agreement.GET(msdyn_agreement2.msdyn_agreementId);
        //
        //  IF CRMAccountBillto.GET(msdyn_agreement.FIELDNO(rs_billtocustomer)) THEN;
        //  IF CRMContactBillto.GET(msdyn_agreement.FIELDNO(rs_billtocustomer)) THEN;
        //  IF CRMAccountSellto.GET(msdyn_agreement.FIELDNO(rs_otherparty)) THEN;
        //  IF CRMContactSellto.GET(msdyn_agreement.FIELDNO(rs_otherparty)) THEN;
        //  IF CRMProgramme.GET(msdyn_agreement.FIELDNO(rs_programme)) THEN;
        //  IF CRMSubprogramme.GET(msdyn_agreement.FIELDNO(rs_subprogramme)) THEN;
        //
        //  DestinationRecordRef.SETTABLE(Job);
        //  IF CRMAccountBillto.hbs_navcustomerno <> '' THEN
        //    IF Job."Bill-to Customer No." <> CRMAccountBillto.hbs_navcustomerno THEN
        //      Job.VALIDATE("Bill-to Customer No.",CRMAccountBillto.hbs_navcustomerno);
        //  IF CRMContactBillto.hbs_navcustomerno <> '' THEN
        //    IF Job."Bill-to Customer No." <> CRMContactBillto.hbs_navcustomerno THEN
        //      Job.VALIDATE("Bill-to Customer No.",CRMContactBillto.hbs_navcustomerno);
        //
        //  IF CRMAccountBillto.hbs_navcustomerno <> '' THEN
        //    IF Job."Sell-to Customer No." <> CRMAccountBillto.hbs_navcustomerno THEN
        //      Job.VALIDATE("Sell-to Customer No.",CRMAccountBillto.hbs_navcustomerno);
        //  IF CRMContactBillto.hbs_navcustomerno <> '' THEN
        //    IF Job."Sell-to Customer No." <> CRMContactBillto.hbs_navcustomerno THEN
        //      Job.VALIDATE("Sell-to Customer No.",CRMContactBillto.hbs_navcustomerno);
        //
        //  Job.MODIFY;
        //
        //  IF CRMProgramme.hbs_name <> '' THEN BEGIN
        //    DefaultDimension.INIT;
        //    DefaultDimension."Table ID" := DATABASE::Job;
        //    DefaultDimension."No." := Job."No.";
        //    DefaultDimension."Dimension Code" := 'PROGRAM'; // TODO: replace
        //    DefaultDimension."Dimension Value Code" := CRMProgramme.hbs_name;
        //    IF NOT DefaultDimension.INSERT THEN
        //      DefaultDimension.MODIFY;
        //  END;
        //
        //  IF CRMSubprogramme.hbs_name <> '' THEN BEGIN
        //    DefaultDimension.INIT;
        //    DefaultDimension."Table ID" := DATABASE::Job;
        //    DefaultDimension."No." := Job."No.";
        //    DefaultDimension."Dimension Code" := 'SUBPROGRAM'; // TODO: replace
        //    DefaultDimension."Dimension Value Code" := CRMSubprogramme.hbs_name;
        //    IF NOT DefaultDimension.INSERT THEN
        //      DefaultDimension.MODIFY;
        //  END;
        //
        //  // return job no. to CRM
        //  IF FORMAT(msdyn_agreement.rs_navjobno) <> Job."No." THEN
        //    msdyn_agreement.VALIDATE(rs_navjobno,Job."No.");
        //  msdyn_agreement.MODIFY;
        //  SourceRecordRef.GETTABLE(msdyn_agreement);
        // END;
        //
        // // Customer and Vendor No. to CRM
        // IF ((DestinationRecordRef.NUMBER IN [DATABASE::Customer,DATABASE::Vendor]) AND (SourceRecordRef.NUMBER IN [DATABASE::"CRM Account",DATABASE::"CRM Contact"])) THEN BEGIN
        //  CASE SourceRecordRef.NUMBER OF
        //    DATABASE::"CRM Account":
        //      BEGIN
        //        SourceRecordRef.SETTABLE(CRMAccount);
        //        CASE DestinationRecordRef.NUMBER OF
        //          DATABASE::Customer:
        //            BEGIN
        //              DestinationRecordRef.SETTABLE(Customer);
        //              CRMAccount2.GET(CRMAccount.AccountId);
        //              CRMAccount2.hbs_navcustomerno := Customer."No.";
        //              CRMAccount2.MODIFY;
        //            END;
        //          DATABASE::Vendor:
        //            BEGIN
        //              DestinationRecordRef.SETTABLE(Vendor);
        //              CRMAccount2.GET(CRMAccount.AccountId);
        //              CRMAccount2.hbs_navcustomerno := Vendor."No.";
        //              CRMAccount2.MODIFY;
        //            END;
        //        END;
        //      END;
        //    DATABASE::"CRM Contact":
        //      BEGIN
        //        SourceRecordRef.SETTABLE(CRMContact);
        //        CASE DestinationRecordRef.NUMBER OF
        //          DATABASE::Customer:
        //            BEGIN
        //              DestinationRecordRef.SETTABLE(Customer);
        //              CRMContact2.GET(CRMContact.ContactId);
        //              CRMContact2.hbs_navcustomerno := Customer."No.";
        //              CRMContact2.MODIFY;
        //            END;
        //          DATABASE::Vendor:
        //            BEGIN
        //              DestinationRecordRef.SETTABLE(Vendor);
        //              CRMContact2.GET(CRMContact.ContactId);
        //              CRMContact2.hbs_navcustomerno := Vendor."No.";
        //              CRMContact2.MODIFY;
        //            END;
        //        END;
        //      END;
        //  END;
        // END;
    end;

    [EventSubscriber(ObjectType::Codeunit, 5345, 'OnBeforeInsertRecord', '', false, false)]
    local procedure PopulateFieldsBeforeInsert(IntegrationTableMapping: Record "Integration Table Mapping";SourceRecordRef: RecordRef;var DestinationRecordRef: RecordRef)
    var
        JobTask: Record "Job Task";
        msdyn_agreementbookingsetup: Record "msdyn_agreementbookingsetup";
        msdyn_agreement: Record "msdyn_agreement";
        CRMProgramme: Record "CRM Programme";
        CRMSubprogramme: Record "CRM Subprogramme";
        DefaultDimension: Record "Default Dimension";
        DimValue: Record "Dimension Value";
        NAVFieldRef: FieldRef;
        CRMFieldRef: FieldRef;
    begin
        IF ((DestinationRecordRef.NUMBER IN [DATABASE::"Job Task"]) AND (SourceRecordRef.NUMBER IN [DATABASE::msdyn_agreementbookingsetup])) THEN BEGIN
          CRMFieldRef := SourceRecordRef.FIELD(msdyn_agreementbookingsetup.FIELDNO(msdyn_Agreement));
          msdyn_agreement.GET(CRMFieldRef.VALUE);
          msdyn_agreement.TESTFIELD(rs_navjobno);
          msdyn_agreement.TESTFIELD(rs_programme);
          CRMProgramme.GET(msdyn_agreement.rs_programme);
          DestinationRecordRef.SETTABLE(JobTask);
          DimValue.GET('PROGRAM',CRMProgramme.hbs_name); // TODO: replace
          DimValue.TESTFIELD("Job Task No. Series");
          JobTask.VALIDATE("Job No.",msdyn_agreement.rs_navjobno);
          JobTask."Job Task No." := NoSerMgt.GetNextNo(DimValue."Job Task No. Series",WORKDATE,TRUE);
          DestinationRecordRef.GETTABLE(JobTask);
        END;
    end;

    local procedure ComposeSessionId(SalesInvoiceHeader: Record "Sales Invoice Header"): Text
    var
        SalesInvoiceHeader2: Record "Sales Invoice Header";
        Result: Text;
    begin
        CASE SalesInvoiceHeader."Shortcut Dimension 1 Code" OF
          CarepointSetup."GCC Dim. Value Code":
            Result := CarepointSetup."GCC Code";
          CarepointSetup."TCC Dim. Value Code":
            Result := CarepointSetup."TCC Code";
        END;
        Result := Result + FormatDate(DATE2DMY(SalesInvoiceHeader."Posting Date",1)) + FormatDate(DATE2DMY(SalesInvoiceHeader."Posting Date",2)) + FormatDate(DATE2DMY(SalesInvoiceHeader."Posting Date",3));
        Result := Result + '-1';

        SalesInvoiceHeader2.SETRANGE("Session ID",Result);
        WHILE NOT SalesInvoiceHeader2.ISEMPTY DO BEGIN
          Result := INCSTR(Result);
          SalesInvoiceHeader2.SETRANGE("Session ID",Result);
        END;

        EXIT(Result);
    end;

    local procedure FormatDate(Value: Integer): Text
    begin
        IF STRLEN(FORMAT(Value)) = 2 THEN
          EXIT(FORMAT(Value));

        IF STRLEN(FORMAT(Value)) = 1 THEN
          EXIT('0' + FORMAT(Value));

        IF STRLEN(FORMAT(Value)) = 4 THEN
          EXIT(COPYSTR(FORMAT(Value),2,2));
    end;

    local procedure GetCaseDate(): Date
    begin
        IF TODAY <= DMY2DATE(30,6,DATE2DMY(TODAY,3)) THEN
          EXIT(DMY2DATE(30,6,DATE2DMY(TODAY,3)));

        EXIT(DMY2DATE(31,12,DATE2DMY(TODAY,3)));
    end;

    local procedure "-- Obsolete --"()
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, 5345, 'OnAfterTransferRecordFields', '', false, false)]
    local procedure PopulateWorkTypeCode(SourceRecordRef: RecordRef;var DestinationRecordRef: RecordRef;var AdditionalFieldsWereModified: Boolean;DestinationIsInserted: Boolean)
    var
        WorkType: Record "Work Type";
        CodeFieldRef: FieldRef;
        DescriptionFieldRef: FieldRef;
        SourceNameFieldRef: FieldRef;
        SourceDescriptionFieldRef: FieldRef;
        TempBlobTemp: Record "TempBlob" temporary;
        IStream: InStream;
        TextBuffer: Text;
        TextBuffer2: Text;
        i: Integer;
    begin
        /*
        IF DestinationRecordRef.NUMBER IN [DATABASE::"Work Type"] THEN BEGIN
          CodeFieldRef := DestinationRecordRef.FIELD(WorkType.FIELDNO(Code));
          DescriptionFieldRef := DestinationRecordRef.FIELD(WorkType.FIELDNO(Description));
          SourceNameFieldRef := SourceRecordRef.FIELD(CRMService.FIELDNO(Name));
          SourceDescriptionFieldRef := SourceRecordRef.FIELD(CRMService.FIELDNO(Description));
          CodeFieldRef.VALUE := COPYSTR(FORMAT(SourceNameFieldRef.VALUE),1,MAXSTRLEN(WorkType.Code));
          IF UPPERCASE(FORMAT(SourceDescriptionFieldRef.TYPE)) = 'BLOB' THEN
            SourceDescriptionFieldRef.CALCFIELD;
          TempBlobTemp.Blob := SourceDescriptionFieldRef.VALUE;
          TempBlobTemp.INSERT;
          IF TempBlobTemp.Blob.HASVALUE THEN
            TempBlobTemp.CALCFIELDS(Blob);
          TempBlobTemp.Blob.CREATEINSTREAM(IStream);
          WHILE NOT (IStream.EOS) DO BEGIN
            i := IStream.READTEXT(TextBuffer2,MAXSTRLEN(WorkType.Description));
            TextBuffer := TextBuffer + TextBuffer2;
          END;
          DescriptionFieldRef.VALUE := COPYSTR(FORMAT(TextBuffer),1,MAXSTRLEN(WorkType.Description));
        END;
        */

    end;
}

