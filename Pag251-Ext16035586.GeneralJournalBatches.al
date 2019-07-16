pageextension 16035586 pageextension16035586 extends "General Journal Batches"
{
    // version NAVW113.00,CAREPOINT1.00

    // ReSRP #10867:Field "Enable EFT Warning Msg" added for giving warning message for EFT
    // ReSRP #10882:Field "Enable Bank Ref.No Generation"
    layout
    {
        addafter("Posting No. Series")
        {
            field("Cost Allocation Type"; "Cost Allocation Type")
            {
                ApplicationArea = All;
            }
        }
        addafter("Bank Statement Import Format")
        {
            field("Enable EFT Pmt. Posting Rmd."; "Enable EFT Pmt. Posting Rmd.")
            {
                ApplicationArea = All;
            }
            field("Enable Bank Ref. No Generation"; "Enable Bank Ref. No Generation")
            {
                ApplicationArea = All;
            }
        }
    }
}

