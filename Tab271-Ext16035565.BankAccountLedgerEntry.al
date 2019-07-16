tableextension 16035565 tableextension16035565 extends "Bank Account Ledger Entry" 
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    // ReSRP #10882:Bank Reference field added
    fields
    {
        field(16035403;"Bank Reference";Text[18])
        {
            Caption = 'Bank Reference';
            Description = 'CAREPOINT1.00';
        }
    }
}

