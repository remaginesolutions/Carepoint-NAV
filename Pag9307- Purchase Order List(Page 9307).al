pageextension 16035579 pageextension16035579 extends "Purchase Order List"
{
    // version NAVW113.00,CAREPOINT1.00

    layout
    {
        addafter("Job Queue Status")
        {
            field("Total Amount Excl. GST"; "Total Amount Excl. GST")
            {
                ApplicationArea = All;
            }
            field("Outstanding Amount Excl. GST"; "Outstanding Amount Excl. GST")
            {
                ApplicationArea = All;
            }
        }
    }
}

