page 16035400 "Budget Expenditure Factbox"
{
    // version CAREPOINT1.00

    // HBSVK 2015-12-03: Object permissions changed - added Read for Table 17 "G/L Entry"
    // HBSML 2016-06-07: Modify the captions of the fields

    Caption = 'Budget Expenditure';
    PageType = CardPart;
    Permissions = TableData 17 = r;
    SourceTable = "Dimension Value";

    layout
    {
        area(content)
        {
            field(Code; Code)
            {
                Caption = 'Program Code';
                ApplicationArea = All;
            }
            field(Name; Name)
            {
                Caption = 'Program Name';
                ApplicationArea = All;
            }
            field("Active Budget"; "Active Budget")
            {
                Visible = false;
                ApplicationArea = All;
            }
            field("Budget Expenditure Accounts"; "Budget Expenditure Accounts")
            {
                Visible = false;
                ApplicationArea = All;
            }
            field("Expenditure Budget FY"; "Expenditure Budget FY")
            {
                Caption = 'Annual Budgeted Exp.';
                ApplicationArea = All;
            }
            field(YTDExpenditureBudgetAmt; YTDExpenditureBudgetAmt)
            {
                Caption = 'YTD Budgeted Exp.';
                ApplicationArea = All;

                trigger OnDrillDown()
                begin
                    GLBudgetEntry.RESET;
                    GLBudgetEntry.SETRANGE("Budget Name", "Active Budget");
                    GLBudgetEntry.SETRANGE("Global Dimension 1 Code", Code);
                    GLBudgetEntry.SETFILTER("G/L Account No.", "Budget Expenditure Accounts");
                    GLBudgetEntry.SETRANGE(Date, 0D, WORKDATE);
                    IF GLBudgetEntry.FINDSET THEN
                        PAGE.RUNMODAL(0, GLBudgetEntry);
                end;
            }
            field(YTDActualsAmt; YTDActualsAmt)
            {
                ApplicationArea = All;
                Caption = 'YTD Actual Exp.';

                trigger OnDrillDown()
                begin
                    GLEntry.RESET;
                    GLEntry.SETRANGE("Global Dimension 1 Code", Code);
                    GLEntry.SETFILTER("G/L Account No.", "Budget Expenditure Accounts");
                    GLEntry.SETRANGE("Posting Date", FiscalStartDate, WORKDATE);
                    IF GLEntry.FINDSET THEN BEGIN
                        PAGE.RUNMODAL(0, GLEntry);
                    END
                end;
            }
            field("Committed Cost PO's"; "Committed Cost PO's")
            {
                ApplicationArea = All;
            }
            field("Value Of Open PO's"; "Value Of Open PO's")
            {
                ApplicationArea = All;
                Caption = 'Oustanding Committed PO''s';
            }
            field("Committed Cost PI's"; "Committed Cost PI's")
            {
                ApplicationArea = All;
            }
            field("Value Of Open PI's"; "Value Of Open PI's")
            {
                Caption = 'Oustanding Committed PI''s';
                ApplicationArea = All;
            }
            field(YTDTotalAccrued; YTDTotalAccrued)
            {
                Caption = 'Total Accrued/Committed';
                ApplicationArea = All;
            }
            field(YTDRemainingBudget; YTDRemainingBudget)
            {
                Caption = 'Remaining Budget';
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        UpdateFactBoxinfo();
    end;

    trigger OnOpenPage()
    begin
        UpdateFactBoxinfo();
    end;

    var
        YTDTotalAccrued: Decimal;
        YTDRemainingBudget: Decimal;
        YTDExpenditureBudgetAmt: Decimal;
        YTDActualsAmt: Decimal;
        GLEntry: Record "G/L Entry";
        GLBudgetEntry: Record "G/L Budget Entry";
        FiscalStartDate: Date;
        AccountingPeriodMgt: Codeunit "Accounting Period Mgt.";

    local procedure CalculateYTDExpBudgetAmt(): Decimal
    var
        BudgeAmt: Decimal;
    begin
        BudgeAmt := 0;
        GLBudgetEntry.RESET;
        GLBudgetEntry.SETRANGE("Budget Name", "Active Budget");
        GLBudgetEntry.SETFILTER("G/L Account No.", "Budget Expenditure Accounts");
        GLBudgetEntry.SETRANGE("Global Dimension 1 Code", Code);
        GLBudgetEntry.SETRANGE(Date, 0D, WORKDATE);
        IF GLBudgetEntry.FINDSET THEN BEGIN
            REPEAT
                BudgeAmt += GLBudgetEntry.Amount
            UNTIL GLBudgetEntry.NEXT = 0;
        END;

        EXIT(BudgeAmt)
    end;

    local procedure CalculateYTDActualsAmt(): Decimal
    var
        ActAmt: Decimal;
        AccSchedManagement: Codeunit "AccSchedManagement";
    begin
        ActAmt := 0;
        FiscalStartDate := AccountingPeriodMgt.FindFiscalYear(WORKDATE);
        GLEntry.RESET;
        GLEntry.SETRANGE("Global Dimension 1 Code", Code);
        GLEntry.SETFILTER("G/L Account No.", "Budget Expenditure Accounts");
        GLEntry.SETRANGE("Posting Date", FiscalStartDate, WORKDATE);
        IF GLEntry.FINDSET THEN BEGIN
            REPEAT
                ActAmt += GLEntry.Amount
            UNTIL GLEntry.NEXT = 0;
        END;

        EXIT(ActAmt)
    end;

    local procedure UpdateFactBoxinfo()
    begin
        YTDExpenditureBudgetAmt := CalculateYTDExpBudgetAmt();
        YTDActualsAmt := CalculateYTDActualsAmt();
        YTDTotalAccrued := YTDActualsAmt + "Value Of Open PO's" + "Value Of Open PI's";
        YTDRemainingBudget := "Expenditure Budget FY" - YTDTotalAccrued;
    end;
}

