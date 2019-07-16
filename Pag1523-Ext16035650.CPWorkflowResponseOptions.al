pageextension 16035650 CPWorkflowResponseOptions extends "Workflow Response Options"
{
    layout
    {
        modify("Approver Type")
        {
            Visible = false;
        }
        addafter("Approver Type")
        {
            field("Carepoint Approval Type"; "Carepoint Approval Type")
            {
                ApplicationArea = All;
            }
        }
    }
}
