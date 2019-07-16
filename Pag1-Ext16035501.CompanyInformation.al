pageextension 16035501 pageextension16035501 extends "Company Information"
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    // HBS VK 2016-11-07 CAREPOINT1.00: Field "NDIS Registration Number" added (ticket #10235)
    layout
    {
        addafter("General")
        {
            group(NDIS)
            {
                Caption = 'NDIS';
                field("NDIS Registration Number"; "NDIS Registration Number")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}

