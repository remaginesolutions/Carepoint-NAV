report 16035421 "Carepoint Trial Balance"
{
    // version CAREPOINT1.00

    DefaultLayout = RDLC;
    RDLCLayout = './Carepoint Trial Balance.rdlc';
    ApplicationArea = "#Basic", "#Suite";
    Caption = 'Trial Balance';
    PreviewMode = PrintLayout;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(DataItem6710; "G/L Account")
        {
            DataItemTableView = SORTING ("No.");
            RequestFilterFields = "No.", "Account Type", "Date Filter", "Global Dimension 1 Filter", "Global Dimension 2 Filter", "G/L Entry Type Filter";
            column(STRSUBSTNO_Text000_PeriodText_; STRSUBSTNO(Text000, PeriodText))
            {
            }
            //column(CurrReport_PAGENO; CurrReport.PAGENO)
            //{
            //}
            column(COMPANYNAME; COMPANYPROPERTY.DISPLAYNAME)
            {
            }
            column(PeriodText; PeriodText)
            {
            }
            column(TotalCredit; TotalCredit)
            {
            }
            column(TotalDebit; TotalDebit)
            {
            }
            column(RoundingText; RoundingText)
            {
            }
            column(Rounding; Rounding)
            {
            }
            column(G_L_Account__TABLECAPTION__________GLFilter; TABLECAPTION + ': ' + GLFilter)
            {
            }
            column(GLFilter; GLFilter)
            {
            }
            column(SimulationEntries; SimulationEntriesLbl)
            {
            }
            column(GLEtyTypeFilter_GLAccount; DataItem6710.GETFILTER("G/L Entry Type Filter"))
            {
            }
            column(G_L_Account_No_; "No.")
            {
            }
            column(Trial_BalanceCaption; Trial_BalanceCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Net_ChangeCaption; Net_ChangeCaptionLbl)
            {
            }
            column(BalanceCaption; BalanceCaptionLbl)
            {
            }
            column(G_L_Account___No__Caption; FIELDCAPTION("No."))
            {
            }
            column(PADSTR_____G_L_Account__Indentation___2___G_L_Account__NameCaption; PADSTR_____G_L_Account__Indentation___2___G_L_Account__NameCaptionLbl)
            {
            }
            column(G_L_Account___Net_Change_Caption; G_L_Account___Net_Change_CaptionLbl)
            {
            }
            column(G_L_Account___Net_Change__Control22Caption; G_L_Account___Net_Change__Control22CaptionLbl)
            {
            }
            column(G_L_Account___Balance_at_Date_Caption; G_L_Account___Balance_at_Date_CaptionLbl)
            {
            }
            column(G_L_Account___Balance_at_Date__Control24Caption; G_L_Account___Balance_at_Date__Control24CaptionLbl)
            {
            }
            column(PageGroupNo; PageGroupNo)
            {
            }
            column(TotalofPostedTransCaption; TotalofPostedTransCaptionLbl)
            {
            }
            column(AccountType_GLAcc; DataItem6710."Account Type")
            {
            }
            column(TotalCaption; TotalCaption)
            {
            }
            column(UseAmtsInAddCurr; UseAmtsInAddCurr)
            {
            }
            column(AllAmountsAreIn; AllAmountsAreInLbl)
            {
            }
            column(GLSetupAddRepCurrency; GLSetup."Additional Reporting Currency")
            {
            }
            column(GlSetupLCYCode; GLSetup."LCY Code")
            {
            }
            dataitem(DataItem5444; "Integer")
            {
                DataItemTableView = SORTING (Number)
                                    WHERE (Number = CONST (1));
                column(G_L_Account___No__; DataItem6710."No.")
                {
                }
                column(PADSTR_____G_L_Account__Indentation___2___G_L_Account__Name; PADSTR('', DataItem6710.Indentation * 2) + DataItem6710.Name)
                {
                }
                column(G_L_Account___Net_Change_; NetChange)
                {
                }
                column(NetChangeSumDeb; NetChangeSumDeb)
                {
                }
                column(NetChangeSumCred; NetChangeSumCred)
                {
                }
                column(BalanceAtDateSumDeb; BalanceAtDateSumDeb)
                {
                }
                column(BalanceAtDateSumCred; BalanceAtDateSumCred)
                {
                }
                column(G_L_Account___Net_Change__Control22; -NetChange)
                {
                    AutoFormatType = 1;
                }
                column(G_L_Account___Balance_at_Date_; BalanceAtDate)
                {
                }
                column(G_L_Account___Balance_at_Date__Control24; -BalanceAtDate)
                {
                    AutoFormatType = 1;
                }
                column(G_L_Account___Account_Type_; FORMAT(DataItem6710."Account Type", 0, 2))
                {
                }
                column(No__of_Blank_Lines; DataItem6710."No. of Blank Lines")
                {
                }
                dataitem(BlankLineRepeater; "Integer")
                {
                    DataItemTableView = SORTING (Number);
                    column(BlankLineNo; BlankLineNo)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        IF BlankLineNo = 0 THEN
                            CurrReport.BREAK;

                        BlankLineNo -= 1;
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    BlankLineNo := DataItem6710."No. of Blank Lines" + 1;
                end;
            }

            trigger OnAfterGetRecord()
            var
                DebitAmount: Decimal;
                CreditAmount: Decimal;
            begin
                IF UseAmtsInAddCurr THEN BEGIN
                    CALCFIELDS(
                      "Additional-Currency Net Change",
                      "Add.-Currency Balance at Date",
                      "Add.-Currency Debit Amount",
                      "Add.-Currency Credit Amount");
                    NetChange := "Additional-Currency Net Change";
                    BalanceAtDate := "Add.-Currency Balance at Date";
                    DebitAmount := "Add.-Currency Debit Amount";
                    CreditAmount := "Add.-Currency Credit Amount";
                END ELSE BEGIN
                    CALCFIELDS("Net Change", "Balance at Date", "Debit Amount", "Credit Amount");
                    NetChange := "Net Change";
                    BalanceAtDate := "Balance at Date";
                    DebitAmount := "Debit Amount";
                    CreditAmount := "Credit Amount";
                END;
                NetChange := ROUND(NetChange, Rounding);
                BalanceAtDate := ROUND(BalanceAtDate, Rounding);
                DebitAmount := ROUND(DebitAmount, Rounding);
                CreditAmount := ROUND(CreditAmount, Rounding);
                AccountName := '';
                IF IndentAccountName THEN
                    AccountName := PADSTR('', DataItem6710.Indentation * 2) + DataItem6710.Name
                ELSE
                    AccountName := DataItem6710.Name;

                IF DataItem6710."Account Type" = DataItem6710."Account Type"::Posting THEN BEGIN
                    TotalDebit := TotalDebit + DebitAmount;
                    TotalCredit := TotalCredit + CreditAmount;
                    // HBSVK 2015-12-10 Start:
                    IF NetChange > 0 THEN
                        NetChangeSumDeb += NetChange
                    ELSE
                        NetChangeSumCred += ABS(NetChange);
                    IF BalanceAtDate > 0 THEN
                        BalanceAtDateSumDeb += BalanceAtDate
                    ELSE
                        BalanceAtDateSumCred += ABS(BalanceAtDate);
                    // HBSVK 2015-12-10 End:
                END;

                IF ChangeGroupNo THEN BEGIN
                    PageGroupNo += 1;
                    ChangeGroupNo := FALSE;
                END;

                ChangeGroupNo := "New Page";
            end;

            trigger OnPreDataItem()
            begin
                GLSetup.GET;

                IF NOT UseAmtsInAddCurr THEN
                    GLSetup.TESTFIELD("LCY Code");

                //IF Rounding <> Rounding::" " THEN
                //    RoundingText := ReportMgmnt.RoundDescription(Rounding);

                PageGroupNo := 0;
                ChangeGroupNo := FALSE;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(AmountsInWhole; Rounding)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Amounts in whole';
                        ToolTip = 'Specifies if the amounts in the report are shown in whole 1000s.';
                    }
                    field(IndentAccountName; IndentAccountName)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Indent Account Name';
                        ToolTip = 'Specifies that you want to indent the report.';
                    }
                    field(UseAmtsInAddCurr; UseAmtsInAddCurr)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Amounts in Add. Reporting Currency';
                        MultiLine = true;
                        ToolTip = 'Specifies if you want report amounts to be shown in the additional reporting currency.';
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        GLFilter := DataItem6710.GETFILTERS;
        PeriodText := DataItem6710.GETFILTER("Date Filter");
    end;

    var
        Text000: Label 'Period: %1';
        GLSetup: Record "General Ledger Setup";
        ReportMgmnt: Codeunit "ReportManagement";
        GLFilter: Text;
        PeriodText: Text[30];
        Trial_BalanceCaptionLbl: Label 'Trial Balance';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Net_ChangeCaptionLbl: Label 'Net Change';
        BalanceCaptionLbl: Label 'Balance';
        PADSTR_____G_L_Account__Indentation___2___G_L_Account__NameCaptionLbl: Label 'Name';
        G_L_Account___Net_Change_CaptionLbl: Label 'Debit';
        G_L_Account___Net_Change__Control22CaptionLbl: Label 'Credit';
        G_L_Account___Balance_at_Date_CaptionLbl: Label 'Debit';
        G_L_Account___Balance_at_Date__Control24CaptionLbl: Label 'Credit';
        PageGroupNo: Integer;
        ChangeGroupNo: Boolean;
        BlankLineNo: Integer;
        NetChangeSumDeb: Decimal;
        NetChangeSumCred: Decimal;
        BalanceAtDateSumDeb: Decimal;
        BalanceAtDateSumCred: Decimal;
        TotalCaption: Label 'Total';
        Rounding: Option " ",Tens,Hundreds,Thousands,"Hundred Thousands",Millions;
        RoundingText: Text[50];
        AccountName: Text[250];
        IndentAccountName: Boolean;
        UseAmtsInAddCurr: Boolean;
        TotalDebit: Decimal;
        TotalCredit: Decimal;
        NetChange: Decimal;
        BalanceAtDate: Decimal;
        SimulationEntriesLbl: Label 'This report includes simulation entries.';
        TotalofPostedTransCaptionLbl: Label 'Total of Posted Transactions';
        AllAmountsAreInLbl: Label 'All amounts are in';
}

