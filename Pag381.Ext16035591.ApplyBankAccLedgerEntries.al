pageextension 16035591 pageextension16035591 extends "Apply Bank Acc. Ledger Entries"
{
    // version NAVW113.00,CAREPOINT1.00

    // ReSRP #10882:Bank Reference field Added
    layout
    {
        addafter("Global Dimension 2 Code")
        {
            field("Bank Reference"; "Bank Reference")
            {
            }
        }
    }
}

