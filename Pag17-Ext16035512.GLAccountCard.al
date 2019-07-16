pageextension 16035512 pageextension16035512 extends "G/L Account Card"
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    // HBSVK 2016-05-30 CAREPOINT1.00: Control "Purchasing Filter" added (ticket #10029)
    layout
    {
        addafter("Omit Default Descr. in Jnl.")
        {
            field("Purchasing Filter"; "Purchasing Filter")
            {
                ApplicationArea = All;
            }
        }
        addafter("Exchange Rate Adjustment")
        {
            field("BI360 - Budget Type"; "BI360 - Budget Type")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("BI360 - Budget Sheet"; "BI360 - Budget Sheet")
            {
                ApplicationArea = All;
            }
            field("BI360 - FA Acquisition Account"; "BI360 - FA Acquisition Account")
            {
                ApplicationArea = All;
            }
        }
    }
}

