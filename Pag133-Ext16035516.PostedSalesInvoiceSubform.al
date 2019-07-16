pageextension 16035516 pageextension16035516 extends "Posted Sales Invoice Subform"
{
    // version NAVW113.00,CAREPOINT1.00

    layout
    {
        addafter("Shortcut Dimension 2 Code")
        {
            field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
            {
                ApplicationArea = All;
                
            }
        }
    }
}

