tableextension 16035517 tableextension16035517 extends "Purchases & Payables Setup" 
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    // HBS TG CAREPOINT1.00 2015-10-01: Added field "Invoice Auth. Mandatory"
    // ReSRP #10882:EFT Bank Reference No. Series field added
    // ReSRP Ticket #10854 2017-11-01: Field added "Enable Milestone"
    fields
    {
        field(16035402;"Invoice Auth. Mandatory";Boolean)
        {
            Description = 'CAREPOINT';
        }
        field(16035403;"EFT Bank Reference No. Series";Code[10])
        {
            Caption = 'EFT Bank Reference No. Series';
            Description = 'CAREPOINT1.00';
            TableRelation = "No. Series".Code;
        }
        field(16035411;"Enable Milestones";Boolean)
        {
            Description = 'CAREPOINT1.00';
        }
    }
}

