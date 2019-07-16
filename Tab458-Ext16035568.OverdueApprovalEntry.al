tableextension 16035568 tableextension16035568 extends "Overdue Approval Entry"
{
    // version NAVW113.00,CAREPOINT1.00

    // HBSTG CAREPOINT1.00 2014-09-22: Added option "Global Dimension 1" in "Approval Type" Field
    fields
    {
        field(16035404; "Carepoint Approval Type"; Option)
        {
            OptionMembers = "Workflow User Group","Sales Pers./Purchaser",Approver,"Global Dimension 1";
            Description = 'CAREPOINT1.00';
        }

    }
}

