pageextension 16035502 pageextension16035502 extends "Purchase Invoices"
{
    // version NAVW113.00,CAREPOINT1.00

    layout
    {
        addafter("Job Queue Status")
        {
            field("Invoice Authorized"; "Invoice Authorized")
            {
                ApplicationArea = All;
            }
        }
    }
}

