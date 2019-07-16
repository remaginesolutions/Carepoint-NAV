tableextension 16035535 tableextension16035535 extends "Vendor Bank Account" 
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    // ReSRP #10882:Lodgement Reference field added
    fields
    {
        field(16035403;"Lodgement Reference";Text[18])
        {
            Caption = 'Lodgement Reference';
            Description = 'CAREPOINT1.00';
        }
    }
}

