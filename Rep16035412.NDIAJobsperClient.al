report 16035412 "NDIA Jobs per Client"
{
    // version CAREPOINT1.00

    // CAREPOINT1.00 2017-01-01: Object created
    DefaultLayout = RDLC;
    RDLCLayout = './NDIA Jobs per Client.rdlc';

    Caption = 'NDIA Jobs per Client';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem(DataItem6836; "Customer")
        {
            DataItemTableView = SORTING ("No.")
                                WHERE ("NDIS Number" = FILTER (<> ''));
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Customer Posting Group";
            column(TodayFormatted; FORMAT(TODAY))
            {
            }
            column(CompanyName; COMPANYNAME)
            {
            }
            column(CustCustFilter; TABLECAPTION + ': ' + CustFilter)
            {
            }
            column(CustFilter; CustFilter)
            {
            }
            column(JobFilterCaptn_Cust; DataItem6836.TABLECAPTION + ': ' + JobFilter)
            {
            }
            column(JobFilter_Cust; JobFilter)
            {
            }
            column(No_Cust; "No.")
            {
            }
            column(Name_Cust; Name)
            {
            }
            column(Amt6; Amt[6])
            {
            }
            column(Amt4; Amt[4])
            {
            }
            column(Amt3; Amt[3])
            {
            }
            column(Amt5; Amt[5])
            {
            }
            column(Amt2; Amt[2])
            {
            }
            column(Amt1; Amt[1])
            {
            }
            column(JobsperCustCaption; JobsperCustCaptionLbl)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(AllAmtAreInLCYCaption; AllAmtAreInLCYCaptionLbl)
            {
            }
            column(JobNoCaption; JobNoCaptionLbl)
            {
            }
            column(EndingDateCaption; EndingDateCaptionLbl)
            {
            }
            column(ScheduleLineAmtCaption; ScheduleLineAmtCaptionLbl)
            {
            }
            column(UsageLineAmtCaption; UsageLineAmtCaptionLbl)
            {
            }
            column(CompletionCaption; CompletionCaptionLbl)
            {
            }
            column(ContractInvLineAmtCaption; ContractInvLineAmtCaptionLbl)
            {
            }
            column(ContractLineAmtCaption; ContractLineAmtCaptionLbl)
            {
            }
            column(InvoicingCaption; InvoicingCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            dataitem(DataItem8019; "Job")
            {
                DataItemLink = "Bill-to Customer No." = FIELD ("No.");
                DataItemTableView = SORTING ("Bill-to Customer No.");
                RequestFilterFields = "No.", "Posting Date Filter", "Planning Date Filter", Blocked;
                column(Endingdate_Job; FORMAT("Ending Date"))
                {
                }
                column(No_Job; "No.")
                {
                }
                column(Desc_Job; Description)
                {
                    IncludeCaption = true;
                }
                column(TableCaptnCustNo; Text000 + ' ' + DataItem6836.TABLECAPTION + ' ' + DataItem6836."No.")
                {
                }
                column(BilltoCustomerNo_Job; "Bill-to Customer No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    JobCalcStatistics.RepJobCustomer(DataItem8019, Amt);
                end;

                trigger OnPreDataItem()
                begin
                    //CurrReport.CREATETOTALS(Amt[1], Amt[2], Amt[3], Amt[4]);
                end;
            }

            trigger OnPreDataItem()
            begin
                //CurrReport.CREATETOTALS(Amt);
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
    }

    trigger OnPreReport()
    var
        CaptionManagement: Codeunit "CaptionManagement";
    begin
        CustFilter := CaptionManagement.GetRecordFiltersWithCaptions(DataItem6836);
        JobFilter := DataItem8019.GETFILTERS;
    end;

    var
        JobCalcStatistics: Codeunit "Job Calculate Statistics";
        CustFilter: Text;
        JobFilter: Text;
        Amt: array[8] of Decimal;
        Text000: Label 'Total for';
        JobsperCustCaptionLbl: Label 'Jobs per Customer';
        PageCaptionLbl: Label 'Page';
        AllAmtAreInLCYCaptionLbl: Label 'All amounts are in LCY';
        JobNoCaptionLbl: Label 'Job No.';
        EndingDateCaptionLbl: Label 'Ending Date';
        ScheduleLineAmtCaptionLbl: Label 'Budget Line Amount';
        UsageLineAmtCaptionLbl: Label 'Usage Line Amount';
        CompletionCaptionLbl: Label 'Completion %';
        ContractInvLineAmtCaptionLbl: Label 'Billable Invoice Line Amount';
        ContractLineAmtCaptionLbl: Label 'Billable Line Amount';
        InvoicingCaptionLbl: Label 'Invoicing %';
        TotalCaptionLbl: Label 'Total';
}

