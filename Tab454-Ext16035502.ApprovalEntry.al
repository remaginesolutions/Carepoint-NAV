tableextension 16035502 tableextension16035502 extends "Approval Entry"
{
    // version NAVW113.00,CAREPOINT1.00

    // HBSTG CAREPOINT1.00 2014-09-22: Added fields "Approval Level Sequence" "Approval Level" "Approval Level Amount Limit" "Additional Approval"
    //                          Added option "Global Dimension 1" in "Approval Type" Field
    // HUME CAREPOINT1.00 RK : Changed options for Approval Level
    // HBS VK CAREPOINT1.00 2016/01/06: Function GetApprovalLevelDescr added
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

