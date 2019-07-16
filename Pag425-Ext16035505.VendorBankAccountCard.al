pageextension 16035505 pageextension16035505 extends "Vendor Bank Account Card"
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    // HBSML HUME1.05 26/06/2014 - Add new fields "Lodgement Reference" and "Payee Name" in Transfer tab
    // HBSML HUME1.05 26/06/2014 - Hide unrelated bank details fields in Transfer tab
    // ReSRP #10882:Lodgement Reference field Added
    layout
    {
        addafter("Transit No.")
        {
            field("Lodgement Reference"; "Lodgement Reference")
            {
                ApplicationArea = All;
            }
        }
    }
}

