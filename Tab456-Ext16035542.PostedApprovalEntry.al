tableextension 16035542 tableextension16035542 extends "Posted Approval Entry"
{
    // version NAVW113.00,CAREPOINT1.00

    // HBS TG CAREPOINT1.00 2014-09-22: Added fields "Approval Level Sequence" "Approval Level" "Approval Level Amount Limit" "Additional Approval"
    //                          Added option "Global Dimension 1" in "Approval Type" Field
    fields
    {
        field(16035400; "Approval Level Sequence"; Integer)
        {
            BlankZero = true;
            Description = 'CAREPOINT1.00';
        }
        field(16035401; "Approval Level"; Code[30])
        {
            Description = 'CAREPOINT1.00';
        }
        field(16035402; "Approval Level Amount Limit"; Integer)
        {
            BlankZero = true;
            Description = 'CAREPOINT1.00';
        }
        field(16035403; "Additional Approval"; Boolean)
        {
            Description = 'CAREPOINT1.00';
        }
        field(16035404; "Carepoint Approval Type"; Option)
        {
            OptionMembers = "Workflow User Group","Sales Pers./Purchaser",Approver,"Global Dimension 1";
            Description = 'CAREPOINT1.00';
        }

    }

    procedure GetApprovalLevelDescr(): Text
    var
        LevelBasedApprovalSetup: Record "Level Based Approval Setup";
        RecRef: RecordRef;
        FRef: FieldRef;
        i: Integer;
    begin
        // HBS CAREPOINT1.00 >>
        IF NOT LevelBasedApprovalSetup.GET THEN
            EXIT;
        RecRef.GETTABLE(LevelBasedApprovalSetup);
        FOR i := 1 TO RecRef.FIELDCOUNT DO BEGIN
            FRef := RecRef.FIELDINDEX(i);
            IF UPPERCASE(FRef.NAME) = "Approval Level" THEN
                EXIT(FRef.VALUE);
        END;
        // HBS CAREPOINT1.00 <<
    end;
}

