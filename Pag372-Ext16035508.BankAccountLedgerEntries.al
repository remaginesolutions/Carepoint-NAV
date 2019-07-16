pageextension 16035508 pageextension16035508 extends "Bank Account Ledger Entries"
{
    // version NAVW113.00,CAREPOINT1.00

    // ReSRP #10882:Bank Reference field Added
    layout
    {
        addafter("Entry No.")
        {
            field("Bank Reference"; "Bank Reference")
            {
            }
        }
    }
}

