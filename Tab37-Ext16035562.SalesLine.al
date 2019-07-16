tableextension 16035562 tableextension16035562 extends "Sales Line"
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    // ReSRP CAREPOINT1.00 2018-08-14: New field "NDIS Claim Reference Code" added (Ticket #10997)
    fields
    {
        field(16035500; "NDIS Claim Reference Code"; Code[20])
        {
            Description = 'CAREPOINT1.0';
        }
        field(16035501; "Scheduled Start"; DateTime)
        {
            Description = 'NDIS';
        }
        field(16035502; "Scheduled End"; DateTime)
        {
            Description = 'NDIS';
        }
    }
}

