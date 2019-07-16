pageextension 16035527 pageextension16035527 extends "Job Task Lines"
{
    // version NAVW113.00,CAREPOINT1.00

    // HBS VK CAREPOINT1.00 2016-07-04: Object modified, Field "Closed" added (ticket #10021)
    layout
    {
        addafter("Amt. Rcd. Not Invoiced")
        {
            field(Closed; Closed)
            {
                ApplicationArea = All;
            }
        }
    }
}

