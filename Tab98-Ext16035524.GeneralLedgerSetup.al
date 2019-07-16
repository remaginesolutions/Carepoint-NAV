tableextension 16035524 tableextension16035524 extends "General Ledger Setup"
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    // CAREPOINT1.00 220714 RK : Added Cost Allocation - Expense Acc. and Cost Allocation - Overhead Prg, for cost allocations
    // HBSRP CAREPOINT1.00 2015-06-18: Field "Cost Allocation Expense Acc" and "Program Dimension" added
    // HBSRP CAREPOINT1.00 2015-09-18: Field "Active Budget" and "Budget Expense Account filter" added
    // HBSTG CAREPOINT1.00 2015-09-19: Added field Invoice Tolerance %
    fields
    {
        field(16035400; "Income Driver Code"; Code[10])
        {
            Description = 'CAREPOINT';
            TableRelation = "Standard Purchase Code".Code;
        }
        field(16035401; "Income Account Filter"; Code[250])
        {
            Description = 'CAREPOINT';
            TableRelation = "G/L Account"."No." WHERE ("Account Type" = FILTER (Posting));
            ValidateTableRelation = false;

            trigger OnLookup()
            var
                GLAccountList: Page "G/L Account List";
            begin
                GLAccountList.LOOKUPMODE(TRUE);
                IF GLAccountList.RUNMODAL = ACTION::LookupOK THEN
                    "Income Account Filter" := GLAccountList.GetSelectionFilter;
            end;
        }
        field(16035402; "Current Budget"; Code[20])
        {
            Description = 'CAREPOINT';
            TableRelation = "G/L Budget Name".Name WHERE (Blocked = CONST (false));
        }
        field(16035403; "Cost Allocation Expense Acc"; Code[20])
        {
            Description = 'CAREPOINT';
            TableRelation = "G/L Account"."No." WHERE ("Account Type" = FILTER (Posting));
        }
        field(16035404; "Program Dimension"; Code[20])
        {
            Description = 'CAREPOINT';
            TableRelation = Dimension;
        }
        field(16035405; "Budget Exp. Account Filter"; Code[250])
        {
            Description = 'CAREPOINT';
            TableRelation = "G/L Account"."No." WHERE ("Account Type" = FILTER (Posting));
            ValidateTableRelation = false;
        }
        field(16035406; "Invoice Tolerance %"; Decimal)
        {
            Description = 'CAREPOINT';
        }
        field(16035407; "Journal Import Format"; Code[20])
        {
            Description = 'CAREPOINT';
            TableRelation = "Data Exch. Def" WHERE (Type = CONST ("Payroll Import"));
        }
    }
}

