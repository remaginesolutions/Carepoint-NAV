table 16035402 "Level Based Approval"
{
    // version CAREPOINT1.00

    // HBSTG CAREPOINT1.00 2014-09-22: New table to store Level based approvals required when Approval type is Global Dimension 1
    // CAREPOINT1.00 RK : Changed option to team leader
    // CAREPOINT1.00 RK : Changed options as per EIS structure


    fields
    {
        field(1;"Sequence No.";Integer)
        {
            AutoIncrement = true;
            BlankZero = true;
            NotBlank = true;
        }
        field(2;Level;Code[30])
        {
        }
        field(3;Description;Text[80])
        {
        }
        field(4;"Company Level Approval";Boolean)
        {
        }
        field(5;"User ID";Code[50])
        {
            TableRelation = "User Setup"."User ID";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(10;"Normal Purchase Amount Limit";Integer)
        {
            BlankZero = true;

            trigger OnValidate()
            begin
                IF "Unlimited Normal Purch Limit" AND ("Normal Purchase Amount Limit" <> 0) THEN
                  ERROR(Text003,FIELDCAPTION("Normal Purchase Amount Limit"),FIELDCAPTION("Unlimited Normal Purch Limit"));
                IF "Normal Purchase Amount Limit" < 0 THEN
                  ERROR(Text005);
            end;
        }
        field(11;"Asset Purchase Amount Limit";Integer)
        {
            BlankZero = true;

            trigger OnValidate()
            begin
                IF "Unlimited Asset Purchase Limit" AND ("Asset Purchase Amount Limit" <> 0) THEN
                  ERROR(Text003,FIELDCAPTION("Asset Purchase Amount Limit"),FIELDCAPTION("Unlimited Asset Purchase Limit"));
                IF "Asset Purchase Amount Limit" < 0 THEN
                  ERROR(Text005);
            end;
        }
        field(12;"Unlimited Normal Purch Limit";Boolean)
        {

            trigger OnValidate()
            begin
                IF "Unlimited Normal Purch Limit" THEN
                  "Normal Purchase Amount Limit" := 0;
            end;
        }
        field(13;"Unlimited Asset Purchase Limit";Boolean)
        {

            trigger OnValidate()
            begin
                IF "Unlimited Asset Purchase Limit" THEN
                  "Asset Purchase Amount Limit" := 0;
            end;
        }
    }

    keys
    {
        key(Key1;"Sequence No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        Text003: Label 'You cannot have both a %1 and %2. ';
        Text005: Label 'You cannot have approval limits less than zero.';
        TableNotEmptyTxt: Label 'Table %1 must be empty to perform this action.';

    procedure PopulateFromApproverSetup()
    var
        LevelBasedApproval: Record "Level Based Approval";
        RecRef: RecordRef;
        FRef: FieldRef;
        i: Integer;
    begin
        IF NOT ISEMPTY THEN
          ERROR(TableNotEmptyTxt,Rec.TABLECAPTION);

        RecRef.OPEN(DATABASE::"Level Based Approval Setup");
        RecRef.FINDFIRST;
        FOR i := 2 TO RecRef.FIELDCOUNT DO BEGIN
          FRef := RecRef.FIELDINDEX(i);
          IF (FORMAT(FRef.VALUE) <> '') THEN
            IF (STRPOS(FRef.NAME,'Dimension') = 0) AND (STRPOS(FRef.NAME,'Restrict') = 0)THEN BEGIN
              LevelBasedApproval.INIT;
              LevelBasedApproval."Sequence No." := i - 1;
              LevelBasedApproval.Level := FRef.NAME;
              LevelBasedApproval.Description := FRef.VALUE;
              LevelBasedApproval.INSERT;
            END;
        END;
    end;
}

