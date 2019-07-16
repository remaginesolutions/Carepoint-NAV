pageextension 16035513 pageextension16035513 extends "Purchase Credit Memo"
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    // CAREPOINT1.00 RK 220914 : Added Document Sub-Type
    layout
    {
        addafter(Status)
        {
            field("Document Sub-Type"; "Document Sub-Type")
            {
                ApplicationArea = All;
            }
        }
    }
}

