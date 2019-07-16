tableextension 16035523 tableextension16035523 extends "Sales Cr.Memo Line" 
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    // HBS CAREPOINT1.00 #10691: Work Type Code field type changed from Code10 to Code50
    // ReSRP CAREPOINT1.00 2018-08-14: New field "NDIS Claim Reference Code" added (Ticket #10997)
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

