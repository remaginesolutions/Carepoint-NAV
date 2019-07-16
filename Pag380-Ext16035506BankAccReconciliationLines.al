pageextension 16035506 pageextension16035506 extends "Bank Acc. Reconciliation Lines"
{
    // version NAVW113.00,CAREPOINT1.00

    // ReSRP #10882:Bank Reference field Added
    layout
    {
        addafter("Additional Transaction Info")
        {
            field("Bank Reference"; "Bank Reference")
            {
            }
        }
    }
}

