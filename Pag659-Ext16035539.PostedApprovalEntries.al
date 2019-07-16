pageextension 16035539 pageextension16035539 extends "Posted Approval Entries"
{
    // version NAVW113.00,CAREPOINT1.00

    // HBSTG CAREPOINT1.00 2014-09-22: Added fields "Approval Level Sequence" "Approval Level" "Approval Level Amount Limit" "Additional Approval"
    layout
    {
        addafter("Currency Code")
        {
            field("Approval Type"; "Approval Type")
            {
                ApplicationArea = All;
            }
            field("Limit Type"; "Limit Type")
            {
                ApplicationArea = All;
            }
            field("Approval Level Sequence"; "Approval Level Sequence")
            {
                ApplicationArea = All;
            }
            field("Approval Level"; "Approval Level")
            {
                ApplicationArea = All;
            }
            field("Approval Level Description"; GetApprovalLevelDescr)
            {
                Caption = 'Approval Level Description';
                ApplicationArea = All;
            }
            field("Approval Level Amount Limit"; "Approval Level Amount Limit")
            {
                ApplicationArea = All;
            }
            field("Additional Approval"; "Additional Approval")
            {
                ApplicationArea = All;
            }
        }
    }
}

