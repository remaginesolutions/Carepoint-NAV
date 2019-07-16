tableextension 16035559 tableextension16035559 extends "Workflow Step Argument"
{
    // version NAVW113.00,CAREPOINT1.00

    // HBS SA CAREPOINT1.00 31/12/2015 new option 'Global Dimension1' added to Approver Type field
    fields
    {
        field(16035404; "Carepoint Approval Type"; Option)
        {
            OptionMembers = "Salesperson/Purchaser",Approver,"Workflow User Group","Global Dimension 1";
            Description = 'CAREPOINT1.00';
            trigger OnValidate()
            begin
                IF "CarePoint Approval Type" <> "CarePoint Approval Type"::"Global Dimension 1" THEN
                    VALIDATE("Approver Type", "CarePoint Approval Type");
            End;
        }
    }
}

