tableextension 16035522 tableextension16035522 extends "Gen. Journal Line" 
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    // ReSRP #10867:Function ShowWarningMsg and "GetNotProcessedEFTRegNo" added for giving warning message for EFT
    // ReSRP #10882:Bank Reference field added and code added to flow
    fields
    {
        field(16035400;"Cost Allocation Line";Boolean)
        {
            Description = 'CAREPOINT1.00';
        }
        field(16035401;"Vendor Lodgement Reference";Text[18])
        {
            Caption = 'Vendor Lodgement Reference';
            Description = 'CAREPOINT1.00';
        }
        field(16035402;"Account Description";Text[50])
        {
            Description = 'CAREPOINT1.00';
        }
        field(16035403;"Bank Reference";Text[18])
        {
            Caption = 'Bank Reference';
            Description = 'CAREPOINT1.00';
        }
        field(16035404;"Bal. Account Description";Text[50])
        {
            Description = 'CAREPOINT1.00';
        }
    }
}

