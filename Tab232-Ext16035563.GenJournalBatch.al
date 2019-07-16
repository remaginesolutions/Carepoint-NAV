tableextension 16035563 tableextension16035563 extends "Gen. Journal Batch" 
{
    // version NAVW113.00,CAREPOINT1.00

    // HBS CAREPOINT1.00 Field "Cost Allocation Type" added
    // ReSRP #10867:Field "Enable EFT Warning Msg" added for giving warning message for EFT
    // ReSRP #10882:Field "Enable Bank Reference No. Generation" added
    fields
    {
        field(16035400;"Cost Allocation Type";Option)
        {
            Description = 'CAREPOINT';
            OptionCaption = ' ,Service % Based,Drivers Based,Drivers Based 2 (Different Charge Acc)';
            OptionMembers = " ","Service % Based","Drivers Based","Drivers Based 2 (Different Charge Acc)";
        }
        field(16035411;"Enable EFT Pmt. Posting Rmd.";Boolean)
        {
            Caption = 'Enable EFT Payment Posting Reminder';
            Description = 'CAREPOINT';
        }
        field(16035412;"Enable Bank Ref. No Generation";Boolean)
        {
            Description = 'CAREPOINT';
        }
    }
}

