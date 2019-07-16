report 16035418 "NDIS Clients Overview"
{
    // version CAREPOINT1.00

    // CAREPOINT1.00 2017-01-01: Object created
    DefaultLayout = RDLC;
    RDLCLayout = './NDIS Clients Overview.rdlc';

    Caption = 'NDIS Clients Overview';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem(DataItem6836; "Customer")
        {
            DataItemTableView = SORTING ("Customer Posting Group")
                                WHERE ("NDIS Number" = FILTER (<> ''));
            RequestFilterFields = "No.", "Date Filter", "Customer Posting Group";
            column(CompanyName; COMPANYNAME)
            {
            }
            column(PeriodFilter; STRSUBSTNO(Text003, PeriodFilter))
            {
            }
            column(CustFieldCaptPostingGroup; STRSUBSTNO(Text005, FIELDCAPTION("Customer Posting Group")))
            {
            }
            column(CustTableCaptioncustFilter; TABLECAPTION + ': ' + CustFilter)
            {
            }
            column(CustFilter; CustFilter)
            {
            }
            column(EmptyString; '')
            {
            }
            column(PeriodStartDate; FORMAT(PeriodStartDate))
            {
            }
            column(PeriodFilter1; PeriodFilter)
            {
            }
            column(FiscalYearStartDate; FORMAT(FiscalYearStartDate))
            {
            }
            column(FiscalYearFilter; FiscalYearFilter)
            {
            }
            column(PeriodEndDate; FORMAT(PeriodEndDate))
            {
            }
            column(PostingGroup_Customer; "Customer Posting Group")
            {
            }
            column(YTDTotal; YTDTotal)
            {
                AutoFormatType = 1;
            }
            column(YTDCreditAmt; YTDCreditAmt)
            {
                AutoFormatType = 1;
            }
            column(YTDDebitAmt; YTDDebitAmt)
            {
                AutoFormatType = 1;
            }
            column(YTDBeginBalance; YTDBeginBalance)
            {
            }
            column(PeriodCreditAmt; PeriodCreditAmt)
            {
            }
            column(PeriodDebitAmt; PeriodDebitAmt)
            {
            }
            column(PeriodBeginBalance; PeriodBeginBalance)
            {
            }
            column(Name_Customer; Name)
            {
                IncludeCaption = true;
            }
            column(No_Customer; "No.")
            {
                IncludeCaption = true;
            }
            column(TotalPostGroup_Customer; Text004 + FORMAT(' ') + "Customer Posting Group")
            {
            }
            column(CustTrialBalanceCaption; CustTrialBalanceCaptionLbl)
            {
            }
            column(CurrReportPageNoCaption; CurrReportPageNoCaptionLbl)
            {
            }
            column(AmtsinLCYCaption; AmtsinLCYCaptionLbl)
            {
            }
            column(inclcustentriesinperiodCaption; inclcustentriesinperiodCaptionLbl)
            {
            }
            column(YTDTotalCaption; YTDTotalCaptionLbl)
            {
            }
            column(PeriodCaption; PeriodCaptionLbl)
            {
            }
            column(FiscalYearToDateCaption; FiscalYearToDateCaptionLbl)
            {
            }
            column(NetChangeCaption; NetChangeCaptionLbl)
            {
            }
            column(TotalinLCYCaption; TotalinLCYCaptionLbl)
            {
            }

            trigger OnAfterGetRecord()
            begin
                CalcAmounts(
                  PeriodStartDate, PeriodEndDate,
                  PeriodBeginBalance, PeriodDebitAmt, PeriodCreditAmt, YTDTotal);

                CalcAmounts(
                  FiscalYearStartDate, PeriodEndDate,
                  YTDBeginBalance, YTDDebitAmt, YTDCreditAmt, YTDTotal);
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CREATETOTALS(
                  PeriodBeginBalance, PeriodDebitAmt, PeriodCreditAmt, YTDBeginBalance,
                  YTDDebitAmt, YTDCreditAmt, YTDTotal);
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
        PeriodBeginBalanceCaption = 'Beginning Balance';
        PeriodDebitAmtCaption = 'Debit';
        PeriodCreditAmtCaption = 'Credit';
    }

    trigger OnPreReport()
    begin
        WITH DataItem6836 DO BEGIN
            PeriodFilter := GETFILTER("Date Filter");
            PeriodStartDate := GETRANGEMIN("Date Filter");
            PeriodEndDate := GETRANGEMAX("Date Filter");
            SETRANGE("Date Filter");
            CustFilter := GETFILTERS;
            SETRANGE("Date Filter", PeriodStartDate, PeriodEndDate);
            AccountingPeriod.SETRANGE("Starting Date", 0D, PeriodEndDate);
            AccountingPeriod.SETRANGE("New Fiscal Year", TRUE);
            IF AccountingPeriod.FINDLAST THEN
                FiscalYearStartDate := AccountingPeriod."Starting Date"
            ELSE
                ERROR(Text000, AccountingPeriod.FIELDCAPTION("Starting Date"), AccountingPeriod.TABLECAPTION);
            FiscalYearFilter := FORMAT(FiscalYearStartDate) + '..' + FORMAT(PeriodEndDate);
        END;
    end;

    var
        Text000: Label 'It was not possible to find a %1 in %2.';
        AccountingPeriod: Record "Accounting Period";
        PeriodBeginBalance: Decimal;
        PeriodDebitAmt: Decimal;
        PeriodCreditAmt: Decimal;
        YTDBeginBalance: Decimal;
        YTDDebitAmt: Decimal;
        YTDCreditAmt: Decimal;
        YTDTotal: Decimal;
        PeriodFilter: Text;
        FiscalYearFilter: Text;
        CustFilter: Text;
        PeriodStartDate: Date;
        PeriodEndDate: Date;
        FiscalYearStartDate: Date;
        Text003: Label 'Period: %1';
        Text004: Label 'Total for';
        Text005: Label 'Group Totals: %1';
        CustTrialBalanceCaptionLbl: Label 'Customer - Trial Balance';
        CurrReportPageNoCaptionLbl: Label 'Page';
        AmtsinLCYCaptionLbl: Label 'Amounts in LCY';
        inclcustentriesinperiodCaptionLbl: Label 'Only includes customers with entries in the period';
        YTDTotalCaptionLbl: Label 'Ending Balance';
        PeriodCaptionLbl: Label 'Period';
        FiscalYearToDateCaptionLbl: Label 'Fiscal Year-To-Date';
        NetChangeCaptionLbl: Label 'Net Change';
        TotalinLCYCaptionLbl: Label 'Total in LCY';

    local procedure CalcAmounts(DateFrom: Date; DateTo: Date; var BeginBalance: Decimal; var DebitAmt: Decimal; var CreditAmt: Decimal; var TotalBalance: Decimal)
    var
        CustomerCopy: Record "Customer";
    begin
        CustomerCopy.COPY(DataItem6836);

        CustomerCopy.SETRANGE("Date Filter", 0D, DateFrom - 1);
        CustomerCopy.CALCFIELDS("Net Change (LCY)");
        BeginBalance := CustomerCopy."Net Change (LCY)";

        CustomerCopy.SETRANGE("Date Filter", DateFrom, DateTo);
        CustomerCopy.CALCFIELDS("Debit Amount (LCY)", "Credit Amount (LCY)");
        DebitAmt := CustomerCopy."Debit Amount (LCY)";
        CreditAmt := CustomerCopy."Credit Amount (LCY)";

        TotalBalance := BeginBalance + DebitAmt - CreditAmt;
    end;
}

