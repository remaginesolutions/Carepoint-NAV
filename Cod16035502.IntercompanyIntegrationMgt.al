codeunit 16035502 "Intercompany Integration Mgt."
{
    // version CAREPOINT1.00


    trigger OnRun()
    begin
    end;

    var
        CarepointSetup: Record "Carepoint Setup";
        CarepointManagement: Codeunit "Carepoint Management";
        Txt: Text;

    [EventSubscriber(ObjectType::Codeunit, 5345, 'OnBeforeInsertRecord', '', false, false)]
    local procedure PerformIntercompanySync(IntegrationTableMapping: Record "Integration Table Mapping"; SourceRecordRef: RecordRef; var DestinationRecordRef: RecordRef)
    var
        IntercompanyIntegrationConf: Record "Intercompany Integration Conf.";
        TargetIntercompanyIntegrationConf: Record "Intercompany Integration Conf.";
        CRMBusinessunitCompanyMapp: Record "CRM Businessunit Company Mapp.";
        JobTask: Record "Job Task";
        msdyn_agreementbookingsetup: Record "msdyn_agreementbookingsetup";
        msdyn_agreement: Record "msdyn_agreement";
        CRMProgramme: Record "CRM Programme";
        CRMSubprogramme: Record "CRM Subprogramme";
        DefaultDimension: Record "Default Dimension";
        DimValue: Record "Dimension Value";
        NoSeriesManagement: Codeunit "NoSeriesManagement";
        NAVFieldRef: FieldRef;
        CRMFieldRef: FieldRef;
        TargetSourceRecordRef: RecordRef;
        TargetDestinationRecordRef: RecordRef;
        BusinessUnitFieldRef: FieldRef;
        PKCodeFieldRef: FieldRef;
        TargetPKCodeFieldRef: FieldRef;
        NewNo: Code[20];
        CompaniesCount: Integer;
        i: Integer;
    begin
        CarepointSetup.GET;
        IF CarepointSetup."Consolidation Company" = '' THEN
            EXIT;

        IF IntegrationTableMapping."Table ID" = DestinationRecordRef.NUMBER THEN BEGIN
            // From Integration Table to NAV
            // 1. Determine the target company
            IntercompanyIntegrationConf.GET(DestinationRecordRef.NUMBER, SourceRecordRef.NUMBER);
            IF IntercompanyIntegrationConf."Business Unit Field No." <> 0 THEN BEGIN
                BusinessUnitFieldRef := SourceRecordRef.FIELD(IntercompanyIntegrationConf."Business Unit Field No.");
                CRMBusinessunitCompanyMapp.GET(BusinessUnitFieldRef.VALUE);
                CompaniesCount := 1;
            END ELSE BEGIN
                CompaniesCount := CRMBusinessunitCompanyMapp.COUNT;
                CRMBusinessunitCompanyMapp.FINDSET;
            END;

            FOR i := 1 TO CompaniesCount DO BEGIN
                CLEAR(TargetDestinationRecordRef);
                CLEAR(TargetPKCodeFieldRef);
                TargetDestinationRecordRef.OPEN(DestinationRecordRef.NUMBER, FALSE, CRMBusinessunitCompanyMapp."Company Name");
                CopyRec(DestinationRecordRef, TargetDestinationRecordRef);
                TargetPKCodeFieldRef := TargetDestinationRecordRef.FIELD(IntercompanyIntegrationConf."Primary Key Code Field");
                // 2. Determine the No. Series
                TargetIntercompanyIntegrationConf.CHANGECOMPANY(CRMBusinessunitCompanyMapp."Company Name");
                TargetIntercompanyIntegrationConf.GET(DestinationRecordRef.NUMBER, SourceRecordRef.NUMBER);
                IF TargetIntercompanyIntegrationConf."NAV No. Series" <> '' THEN
                    TargetPKCodeFieldRef.VALUE := CarepointManagement.GetNextNoCompany(TargetIntercompanyIntegrationConf."NAV No. Series", WORKDATE, TRUE, TRUE, CRMBusinessunitCompanyMapp."Company Name");
                // 3. Insert the record into the target Company with getting a new Primary key/No.
                TargetDestinationRecordRef.INSERT;
                CRMBusinessunitCompanyMapp.NEXT;
            END;

            IF CompaniesCount = 1 THEN BEGIN
                // 4. Return primary key back to consolidation company
                PKCodeFieldRef := DestinationRecordRef.FIELD(IntercompanyIntegrationConf."Primary Key Code Field");
                PKCodeFieldRef.VALUE := TargetPKCodeFieldRef.VALUE;
            END;

        END ELSE BEGIN
            // From NAV To Integration Table
            // (not required)
        END;
    end;

    [EventSubscriber(ObjectType::Codeunit, 5345, 'OnBeforeModifyRecord', '', false, false)]
    local procedure PerformIntercompanyModify(IntegrationTableMapping: Record "Integration Table Mapping"; SourceRecordRef: RecordRef; var DestinationRecordRef: RecordRef)
    var
        IntercompanyIntegrationConf: Record "Intercompany Integration Conf.";
        TargetIntercompanyIntegrationConf: Record "Intercompany Integration Conf.";
        CRMBusinessunitCompanyMapp: Record "CRM Businessunit Company Mapp.";
        JobTask: Record "Job Task";
        msdyn_agreementbookingsetup: Record "msdyn_agreementbookingsetup";
        msdyn_agreement: Record "msdyn_agreement";
        CRMProgramme: Record "CRM Programme";
        CRMSubprogramme: Record "CRM Subprogramme";
        DefaultDimension: Record "Default Dimension";
        DimValue: Record "Dimension Value";
        NoSeriesManagement: Codeunit "NoSeriesManagement";
        NAVFieldRef: FieldRef;
        CRMFieldRef: FieldRef;
        TargetSourceRecordRef: RecordRef;
        TargetDestinationRecordRef: RecordRef;
        BusinessUnitFieldRef: FieldRef;
        PKCodeFieldRef: FieldRef;
        TargetPKCodeFieldRef: FieldRef;
        NewNo: Code[20];
        CompaniesCount: Integer;
        i: Integer;
    begin
        CarepointSetup.GET;
        IF CarepointSetup."Consolidation Company" = '' THEN
            EXIT;

        IF IntegrationTableMapping."Table ID" = DestinationRecordRef.NUMBER THEN BEGIN
            // From Integration Table to NAV
            // 1. Determine the target company
            IntercompanyIntegrationConf.GET(DestinationRecordRef.NUMBER, SourceRecordRef.NUMBER);
            IF IntercompanyIntegrationConf."Business Unit Field No." <> 0 THEN BEGIN
                BusinessUnitFieldRef := SourceRecordRef.FIELD(IntercompanyIntegrationConf."Business Unit Field No.");
                CRMBusinessunitCompanyMapp.GET(BusinessUnitFieldRef.VALUE);
                CompaniesCount := 1;
            END ELSE BEGIN
                CompaniesCount := CRMBusinessunitCompanyMapp.COUNT;
                CRMBusinessunitCompanyMapp.FINDSET;
            END;

            FOR i := 1 TO CompaniesCount DO BEGIN
                CLEAR(TargetDestinationRecordRef);
                CLEAR(TargetPKCodeFieldRef);
                TargetDestinationRecordRef.OPEN(DestinationRecordRef.NUMBER, FALSE, CRMBusinessunitCompanyMapp."Company Name");
                IF TargetDestinationRecordRef.GET(DestinationRecordRef.RECORDID) THEN BEGIN
                    CopyRec(DestinationRecordRef, TargetDestinationRecordRef);
                    // 3. Modify the record in the target Company
                    TargetDestinationRecordRef.MODIFY;
                END;
                CRMBusinessunitCompanyMapp.NEXT;
            END;
        END ELSE BEGIN
            // From NAV To Integration Table
            // (not required)
        END;
    end;

    local procedure CopyRec(var RecRefFrom: RecordRef; var RecRefTo: RecordRef)
    var
        "Field": Record "Field";
        FieldRefFrom: FieldRef;
        FieldRefTo: FieldRef;
    begin
        Field.RESET;
        Field.SETRANGE(TableNo, RecRefFrom.NUMBER);
        Field.SETRANGE(Enabled, TRUE);
        Field.SETRANGE(Class, Field.Class::Normal);
        IF Field.FINDSET THEN
            REPEAT
                FieldRefTo := RecRefTo.FIELD(Field."No.");
                FieldRefFrom := RecRefFrom.FIELD(Field."No.");
                IF Field.Type = Field.Type::BLOB THEN
                    FieldRefFrom.CALCFIELD;
                FieldRefTo.VALUE := FieldRefFrom.VALUE;
            UNTIL Field.NEXT = 0;
    end;

    [EventSubscriber(ObjectType::Codeunit, 2000000002, 'OnDatabaseInsert', '', false, false)]
    local procedure ConsolidateInsert(RecRef: RecordRef)
    var
        DestinationRecRef: RecordRef;
    begin
        Txt := RecRef.CURRENTCOMPANY;

        IF NOT ConsolidationRequired(RecRef) THEN
            EXIT;

        CarepointSetup.GET;
        IF CarepointSetup."Consolidation Company" = '' THEN
            EXIT;

        IF COMPANYNAME = CarepointSetup."Consolidation Company" THEN
            EXIT;

        IF RecRef.CURRENTCOMPANY = CarepointSetup."Consolidation Company" THEN
            EXIT;

        DestinationRecRef.OPEN(RecRef.NUMBER, FALSE, CarepointSetup."Consolidation Company");
        CopyRec(RecRef, DestinationRecRef);
        IF DestinationRecRef.INSERT THEN;
    end;

    [EventSubscriber(ObjectType::Codeunit, 2000000002, 'OnDatabaseModify', '', false, false)]
    local procedure ConsolidateModify(RecRef: RecordRef)
    var
        DestinationRecRef: RecordRef;
    begin
        IF NOT ConsolidationRequired(RecRef) THEN
            EXIT;

        CarepointSetup.GET;
        IF CarepointSetup."Consolidation Company" = '' THEN
            EXIT;

        IF COMPANYNAME = CarepointSetup."Consolidation Company" THEN
            EXIT;

        IF RecRef.CURRENTCOMPANY = CarepointSetup."Consolidation Company" THEN
            EXIT;

        DestinationRecRef.OPEN(RecRef.NUMBER, FALSE, CarepointSetup."Consolidation Company");
        CopyRec(RecRef, DestinationRecRef);
        IF DestinationRecRef.MODIFY THEN;
    end;

    [EventSubscriber(ObjectType::Codeunit, 2000000002, 'OnDatabaseDelete', '', false, false)]
    local procedure ConsolidateDelete(RecRef: RecordRef)
    var
        DestinationRecRef: RecordRef;
    begin
        IF NOT ConsolidationRequired(RecRef) THEN
            EXIT;

        CarepointSetup.GET;
        IF CarepointSetup."Consolidation Company" = '' THEN
            EXIT;

        IF COMPANYNAME = CarepointSetup."Consolidation Company" THEN
            EXIT;

        IF RecRef.CURRENTCOMPANY = CarepointSetup."Consolidation Company" THEN
            EXIT;

        DestinationRecRef.OPEN(RecRef.NUMBER, FALSE, CarepointSetup."Consolidation Company");
        CopyRec(RecRef, DestinationRecRef);
        IF DestinationRecRef.DELETE THEN;
    end;

    local procedure ConsolidationRequired(RecRef: RecordRef): Boolean
    var
        IntercompanyIntegrationConf: Record "Intercompany Integration Conf.";
    begin
        IntercompanyIntegrationConf.SETRANGE("Table ID", RecRef.NUMBER);
        IntercompanyIntegrationConf.SETRANGE("Update To Consolidation Comp.", TRUE);
        EXIT(NOT IntercompanyIntegrationConf.ISEMPTY);
    end;

    [EventSubscriber(ObjectType::Codeunit, 2000000002, 'GetDatabaseTableTriggerSetup', '', false, false)]
    local procedure SetTableTriggerMask(TableId: Integer; var OnDatabaseInsert: Boolean; var OnDatabaseModify: Boolean; var OnDatabaseDelete: Boolean; var OnDatabaseRename: Boolean)
    var
        IntercompanyIntegrationConf: Record "Intercompany Integration Conf.";
    begin
        IntercompanyIntegrationConf.SETRANGE("Table ID", TableId);
        IntercompanyIntegrationConf.SETRANGE("Update To Consolidation Comp.", TRUE);
        IF IntercompanyIntegrationConf.ISEMPTY THEN
            EXIT;

        OnDatabaseDelete := TRUE;
        OnDatabaseInsert := TRUE;
        OnDatabaseModify := TRUE;
    end;

    procedure DetermineTargetCompany(RecRef: RecordRef): Text
    var
        IntercompanyIntegrationConf: Record "Intercompany Integration Conf.";
        CRMBusinessunitCompanyMapp: Record "CRM Businessunit Company Mapp.";
        FRef: FieldRef;
    begin
        IntercompanyIntegrationConf.SETRANGE("Integration Table ID", RecRef.NUMBER);
        IF NOT IntercompanyIntegrationConf.FINDFIRST THEN
            EXIT;

        FRef := RecRef.FIELD(IntercompanyIntegrationConf."Business Unit Field No.");
        IF CRMBusinessunitCompanyMapp.GET(FRef.VALUE) THEN
            EXIT(CRMBusinessunitCompanyMapp."Company Name");
    end;
}

