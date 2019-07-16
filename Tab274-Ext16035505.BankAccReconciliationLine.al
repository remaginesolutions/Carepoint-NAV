tableextension 16035505 tableextension16035505 extends "Bank Acc. Reconciliation Line"
{
    // version NAVW113.00,CAREPOINT1.00

    // ReSRP #10882:Bank Reference field added
    fields
    {
        field(16035403; "Bank Reference"; Text[18])
        {
            Caption = 'Bank Reference';
            Description = 'CAREPOINT1.00';
        }
    }
}

