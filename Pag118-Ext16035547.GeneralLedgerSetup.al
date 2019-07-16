pageextension 16035547 pageextension16035547 extends "General Ledger Setup"
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    // HUME CAREPOINT1.00 RK 220714 : added function call to Cost Allocation Income Accounts Setup
    // HBSTG CAREPOINT1.00 2015-09-19: Added field Invoice Tolerance %
    // HUME CAREPOINT1.00 210915 RK : added payrol template and batch
    layout
    {
        addafter("Max. VAT Difference Allowed")
        {
            field("Invoice Tolerance %"; "Invoice Tolerance %")
            {
                ApplicationArea = All;
            }
            field("Journal Import Format"; "Journal Import Format")
            {
                ApplicationArea = All;
            }

        }
        addafter("Local Functionalities")
        {
            group("Cost Allocation Setup")
            {
                Caption = 'Cost Allocation Setup';

                field("Current Budget"; "Current Budget")
                {
                }
                field("Cost Allocation Expense Acc"; "Cost Allocation Expense Acc")
                {
                    ApplicationArea = All;
                }
                field("Program Dimension"; "Program Dimension")
                {
                    ApplicationArea = All;
                }
                field("Budget Exp. Account Filter"; "Budget Exp. Account Filter")
                {
                    ApplicationArea = All;
                }
                field("Income Account Filter"; "Income Account Filter")
                {
                    ApplicationArea = All;
                }
                field("Income Driver Code"; "Income Driver Code")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        addafter("F&unctions")
        {
            group("Setup Cost Allocation")
            {
                Caption = 'Setup Cost Allocation';
                action("Cost Allocation Income Accounts Setup")
                {
                    Caption = 'Cost Allocation Income Accounts Setup';
                    Image = Allocations;
                    RunObject = Page 16035401;
                    RunPageView = WHERE (Type = FILTER ("Cost Allocation Income Account"));
                }
            }
        }
    }
}

