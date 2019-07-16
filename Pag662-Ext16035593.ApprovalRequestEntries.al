pageextension 16035593 pageextension16035593 extends "Approval Request Entries"
{
    // version NAVW113.00,CAREPOINT1.00

    // HBSTG CAREPOINT1.00 2014-09-22: Added fields "Approval Level Sequence" "Approval Level" "Approval Level Amount Limit" "Additional Approval"
    layout
    {
        addafter("Available Credit Limit (LCY)")
        {
            field("Approval Type"; "Approval Type")
            {
            }
            field("Limit Type"; "Limit Type")
            {
            }
            field("Approval Level Sequence"; "Approval Level Sequence")
            {
            }
            field("Approval Level"; "Approval Level")
            {
            }
            field("Approval Level Amount Limit"; "Approval Level Amount Limit")
            {
            }
        }
    }
}

