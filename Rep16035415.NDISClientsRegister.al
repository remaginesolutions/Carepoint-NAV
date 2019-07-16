report 16035415 "NDIS Clients Register"
{
    // version CAREPOINT1.00

    // CAREPOINT1.00 2017-01-01: Object created
    DefaultLayout = RDLC;
    RDLCLayout = './NDIS Clients Register.rdlc';

    Caption = 'NDIS Clients Register';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem(DataItem9922; "G/L Register")
        {
            DataItemTableView = SORTING ("No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            column(PrintAmountsInLCY; PrintAmountsInLCY)
            {
            }
            column(G_L_Register__TABLECAPTION__________GLRegFilter; TABLECAPTION + ': ' + GLRegFilter)
            {
            }
            column(GLRegFilter; GLRegFilter)
            {
            }
            column(G_L_Register__No__; "No.")
            {
            }
            column(CustDebitAmountLCY; CustDebitAmountLCY)
            {
                AutoFormatType = 1;
            }
            column(CustCreditAmountLCY; CustCreditAmountLCY)
            {
                AutoFormatType = 1;
            }
            column(CustAmountLCY; CustAmountLCY)
            {
                AutoFormatType = 1;
            }
            column(Customer_RegisterCaption; Customer_RegisterCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(All_amounts_are_in_LCYCaption; All_amounts_are_in_LCYCaptionLbl)
            {
            }
            column(Cust__Ledger_Entry__Posting_Date_Caption; Cust__Ledger_Entry__Posting_Date_CaptionLbl)
            {
            }
            column(Cust__Ledger_Entry__Document_Type_Caption; Cust__Ledger_Entry__Document_Type_CaptionLbl)
            {
            }
            column(Cust__Ledger_Entry__Document_No__Caption; DataItem8503.FIELDCAPTION("Document No."))
            {
            }
            column(Cust__Ledger_Entry_DescriptionCaption; DataItem8503.FIELDCAPTION(Description))
            {
            }
            column(Cust__Ledger_Entry__Customer_No__Caption; DataItem8503.FIELDCAPTION("Customer No."))
            {
            }
            column(Cust_NameCaption; Cust_NameCaptionLbl)
            {
            }
            column(CustAmountCaption; CustAmountCaptionLbl)
            {
            }
            column(Cust__Ledger_Entry__Applies_to_Doc__No__Caption; Cust__Ledger_Entry__Applies_to_Doc__No__CaptionLbl)
            {
            }
            column(Cust__Ledger_Entry__Due_Date_Caption; Cust__Ledger_Entry__Due_Date_CaptionLbl)
            {
            }
            column(Cust__Ledger_Entry__Entry_No__Caption; DataItem8503.FIELDCAPTION("Entry No."))
            {
            }
            column(G_L_Register__No__Caption; G_L_Register__No__CaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(CustDebitAmountLCYCaption; CustDebitAmountLCYCaptionLbl)
            {
            }
            column(CustCreditAmountLCYCaption; CustCreditAmountLCYCaptionLbl)
            {
            }
            column(CustAmountLCYCaption; CustAmountLCYCaptionLbl)
            {
            }
            dataitem(DataItem8503; "Cust. Ledger Entry")
            {
                DataItemTableView = SORTING ("Entry No.");
                column(Cust__Ledger_Entry__Posting_Date_; FORMAT("Posting Date"))
                {
                }
                column(Cust__Ledger_Entry__Document_Type_; "Document Type")
                {
                }
                column(Cust__Ledger_Entry__Document_No__; "Document No.")
                {
                }
                column(Cust__Ledger_Entry_Description; Description)
                {
                }
                column(Cust__Ledger_Entry__Customer_No__; "Customer No.")
                {
                }
                column(Cust_Name; Cust.Name)
                {
                }
                column(CustAmount; CustAmount)
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 1;
                }
                column(Cust__Ledger_Entry__Currency_Code_; "Currency Code")
                {
                }
                column(Cust__Ledger_Entry__Applies_to_Doc__No__; "Applies-to Doc. No.")
                {
                }
                column(Cust__Ledger_Entry__Due_Date_; FORMAT("Due Date"))
                {
                }
                column(Cust__Ledger_Entry__Entry_No__; "Entry No.")
                {
                }
                column(CustDebitAmountLCY_Control65; CustDebitAmountLCY)
                {
                    AutoFormatType = 1;
                }
                column(CustCreditAmountLCY_Control68; CustCreditAmountLCY)
                {
                    AutoFormatType = 1;
                }
                column(CustAmountLCY_Control71; CustAmountLCY)
                {
                    AutoFormatType = 1;
                }
                column(CustDebitAmountLCY_Control65Caption; CustDebitAmountLCY_Control65CaptionLbl)
                {
                }
                column(CustCreditAmountLCY_Control68Caption; CustCreditAmountLCY_Control68CaptionLbl)
                {
                }
                column(CustAmountLCY_Control71Caption; CustAmountLCY_Control71CaptionLbl)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    IF NOT Cust.GET("Customer No.") THEN
                        Cust.INIT;

                    DtldCustLedgEntry.SETRANGE("Cust. Ledger Entry No.", "Entry No.");
                    DtldCustLedgEntry.CALCSUMS(Amount, "Amount (LCY)", "Debit Amount (LCY)", "Credit Amount (LCY)");

                    IF PrintAmountsInLCY THEN BEGIN
                        CustAmount := DtldCustLedgEntry."Amount (LCY)";
                        "Currency Code" := '';
                    END ELSE
                        CustAmount := DtldCustLedgEntry.Amount;

                    CustAmountLCY := DtldCustLedgEntry."Amount (LCY)";
                    CustDebitAmountLCY := DtldCustLedgEntry."Debit Amount (LCY)";
                    CustCreditAmountLCY := DtldCustLedgEntry."Credit Amount (LCY)";

                    IF ("Document Type" = "Document Type"::Payment) OR ("Document Type" = "Document Type"::Refund) THEN
                        "Due Date" := 0D;
                end;

                trigger OnPreDataItem()
                begin
                    SETRANGE("Entry No.", DataItem9922."From Entry No.", DataItem9922."To Entry No.");
                    CurrReport.CREATETOTALS(CustAmountLCY, CustDebitAmountLCY, CustCreditAmountLCY);
                end;
            }

            trigger OnPreDataItem()
            begin
                CurrReport.CREATETOTALS(CustAmountLCY, CustDebitAmountLCY, CustCreditAmountLCY);
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(ShowAmountsInLCY; PrintAmountsInLCY)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Amounts in LCY';
                        ToolTip = 'Specifies if the reported amounts are shown in the local currency.';
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
        GLRegFilter := DataItem9922.GETFILTERS;
        DtldCustLedgEntry.SETCURRENTKEY("Cust. Ledger Entry No.", "Entry Type");
        DtldCustLedgEntry.SETRANGE("Entry Type", DtldCustLedgEntry."Entry Type"::"Initial Entry");
    end;

    var
        Cust: Record "Customer";
        DtldCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
        GLRegFilter: Text;
        CustAmount: Decimal;
        CustAmountLCY: Decimal;
        CustDebitAmountLCY: Decimal;
        CustCreditAmountLCY: Decimal;
        PrintAmountsInLCY: Boolean;
        Customer_RegisterCaptionLbl: Label 'Customer Register';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        All_amounts_are_in_LCYCaptionLbl: Label 'All amounts are in LCY';
        Cust__Ledger_Entry__Posting_Date_CaptionLbl: Label 'Posting Date';
        Cust__Ledger_Entry__Document_Type_CaptionLbl: Label 'Document Type';
        Cust_NameCaptionLbl: Label 'Name';
        CustAmountCaptionLbl: Label 'Original Amount';
        Cust__Ledger_Entry__Applies_to_Doc__No__CaptionLbl: Label 'Applies-to Doc. No.';
        Cust__Ledger_Entry__Due_Date_CaptionLbl: Label 'Due Date';
        G_L_Register__No__CaptionLbl: Label 'Register No.';
        TotalCaptionLbl: Label 'Total';
        CustDebitAmountLCYCaptionLbl: Label 'Debit (LCY)';
        CustCreditAmountLCYCaptionLbl: Label 'Credit (LCY)';
        CustAmountLCYCaptionLbl: Label 'Total (LCY)';
        CustDebitAmountLCY_Control65CaptionLbl: Label 'Debit (LCY)';
        CustCreditAmountLCY_Control68CaptionLbl: Label 'Credit (LCY)';
        CustAmountLCY_Control71CaptionLbl: Label 'Total (LCY)';

    procedure InitializeRequest(ShowAmountInLCY: Boolean)
    begin
        PrintAmountsInLCY := ShowAmountInLCY;
    end;
}

