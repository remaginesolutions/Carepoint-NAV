pageextension 16035577 pageextension16035577 extends "Purch. Invoice Subform"
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    // HBSTG CAREPOINT1.00 2015-09-19: Created new functions for changing GL Code and direct unit cost on Purchase Line
    // HBSSA 06/11/2017 #10864 Created new control "VAT amount"
    layout
    {
        addafter("VAT Prod. Posting Group")
        {
            field("VAT Amount"; "VAT Amount")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter("F&unctions")
        {
            action("Change G/L Account")
            {

                trigger OnAction()
                begin
                    // HBSTG CAREPOINT1.00 2015-09-19
                    ChangeGLAcc;
                end;
            }
            action("Change Amount")
            {

                trigger OnAction()
                begin
                    // HBSTG CAREPOINT1.00 2015-09-19
                    ChangeDirectUnitCost;
                end;
            }
        }
    }
}

