pageextension 16035514 pageextension16035514 extends "Job Card"
{
    // version NAVW113.00,CAREPOINT1.00

    // HBSVK CAREPOINT1.00 2016-07-20 "Sell-to Customer" group of fields added (ticket #10021)
    layout
    {
        addafter(Description)
        {
            field("NDIA Claim"; "NDIA Claim")
            {
                ApplicationArea = All;
            }
        }
    }
}

