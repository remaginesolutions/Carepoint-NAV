tableextension 16035529 tableextension16035529 extends "Return Receipt Line" 
{
    // version NAVW113.00,CAREPOINT1.00

    // ReSRP CAREPOINT1.00 2018-08-14: New fields related to  NDIS have been added (Ticket #10997)
    fields
    {
        field(16035500;"NDIS Claim Reference Code";Code[20])
        {
            Description = 'CAREPOINT1.0';
        }
        field(16035501;"Scheduled Start";DateTime)
        {
            Description = 'NDIS';
        }
        field(16035502;"Scheduled End";DateTime)
        {
            Description = 'NDIS';
        }
    }
}

