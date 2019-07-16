tableextension 16035544 tableextension16035544 extends "Sales Line Archive" 
{
    // version NAVW113.00,CAREPOINT1.00

    // HBS CAREPOINT1.00 #10691: Work Type Code field type changed from Code10 to Code50
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
