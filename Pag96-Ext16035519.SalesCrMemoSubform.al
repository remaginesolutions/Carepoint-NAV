pageextension 16035519 pageextension16035519 extends "Sales Cr. Memo Subform"
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    // ReSRP CAREPOINT1.00 2018-08-14: New field "NDIS Claim Reference Code" added (Ticket #10997)
    layout
    {
        addafter("Line Amount")
        {
            field("NDIS Claim Reference Code"; "NDIS Claim Reference Code")
            {
                ApplicationArea = All;
            }
        }
    }
}

