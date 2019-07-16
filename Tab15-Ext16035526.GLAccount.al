tableextension 16035526 tableextension16035526 extends "G/L Account"
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    // HBSRP 2016-03-23 CAREPOINT1.00: New options  C2,R1 (Incld in Driver) have been added in the BI-360 Budget Sheet field
    // HBSVK 2016-05-30 CAREPOINT1.00: Field "Purchasing Filter" added (ticket #10029)
    fields
    {
        field(16035400; "BI360 - Budget Type"; Option)
        {
            Description = 'CAREPOINT';
            OptionMembers = " ",Income,Expense,HR,Capex;
        }
        field(16035401; "BI360 - Budget Sheet"; Option)
        {
            Description = 'CAREPOINT';
            OptionCaption = ' ,E1,R1,C1,C2,R1 (Incld in Driver)';
            OptionMembers = " ",E1,R1,C1,C2,"R1 (Incld in Driver)";
        }
        field(16035402; "BI360 - FA Acquisition Account"; Code[20])
        {
            Description = 'CAREPOINT';
            TableRelation = "G/L Account"."No.";
        }
        field(16035403; "Purchasing Filter"; Boolean)
        {
            Description = 'CAREPOINT';
        }
    }
}

