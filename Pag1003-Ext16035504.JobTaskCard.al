pageextension 16035504 pageextension16035504 extends "Job Task Card"
{
    // version NAVW113.00,CAREPOINT1.00

    // HBS VK CAREPOINT1.00 2016-07-04: Object modified, Field "Closed" added (ticket #10021)
    layout
    {
        addafter("No. of Blank Lines")
        {
            field(Closed; Closed)
            {
                ApplicationArea = All;
            }
        }
    }
}

