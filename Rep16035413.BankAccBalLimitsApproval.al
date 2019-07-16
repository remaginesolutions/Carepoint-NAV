report 16035413 "Bank Acc. Bal. Limits Approval"
{
    // version CAREPOINT1.00

    // CAREPOINT1.00 2017-01-01: Object created
    DefaultLayout = RDLC;
    RDLCLayout = './Bank Acc. Bal. Limits Approval.rdlc';

    Caption = 'Bank Account - List';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem(DataItem4558; "Bank Account")
        {
            RequestFilterFields = "No.", "Search Name", "Bank Acc. Posting Group", "Currency Code";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            column(PrintAmountsInLCY; PrintAmountsInLCY)
            {
            }
            column(Bank_Account__TABLECAPTION__________BankAccFilter; TABLECAPTION + ': ' + BankAccFilter)
            {
            }
            column(BankAccFilter; BankAccFilter)
            {
            }
            column(Bank_Account__No__; "No.")
            {
            }
            column(Bank_Account__Bank_Acc__Posting_Group_; "Bank Acc. Posting Group")
            {
            }
            column(Bank_Account__Our_Contact_Code_; "Our Contact Code")
            {
            }
            column(Bank_Account__Currency_Code_; "Currency Code")
            {
            }
            column(Bank_Account__Min__Balance_; "Min. Balance")
            {
                DecimalPlaces = 0 : 0;
            }
            column(BankAccBalance; BankAccBalance)
            {
                AutoFormatExpression = "Currency Code";
                AutoFormatType = 1;
            }
            column(BankAccAddr_1_; BankAccAddr[1])
            {
            }
            column(BankAccAddr_2_; BankAccAddr[2])
            {
            }
            column(BankAccAddr_3_; BankAccAddr[3])
            {
            }
            column(BankAccAddr_4_; BankAccAddr[4])
            {
            }
            column(BankAccAddr_5_; BankAccAddr[5])
            {
            }
            column(Bank_Account_Contact; Contact)
            {
            }
            column(Bank_Account__Phone_No__; "Phone No.")
            {
            }
            column(BankAccAddr_6_; BankAccAddr[6])
            {
            }
            column(BankAccAddr_7_; BankAccAddr[7])
            {
            }
            column(Bank_Account__Last_Check_No__; "Last Check No.")
            {
            }
            column(Bank_Account__Balance_Last_Statement_; "Balance Last Statement")
            {
            }
            column(Bank_Account__Bank_Account_No__; "Bank Account No.")
            {
            }
            column(Bank_Account__Balance__LCY__; "Balance (LCY)")
            {
            }
            column(Bank_Account___ListCaption; Bank_Account___ListCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(The_balance_is_in_LCY_Caption; The_balance_is_in_LCY_CaptionLbl)
            {
            }
            column(Bank_Account__No__Caption; FIELDCAPTION("No."))
            {
            }
            column(Bank_Account__Bank_Acc__Posting_Group_Caption; Bank_Account__Bank_Acc__Posting_Group_CaptionLbl)
            {
            }
            column(Bank_Account__Our_Contact_Code_Caption; FIELDCAPTION("Our Contact Code"))
            {
            }
            column(Bank_Account__Currency_Code_Caption; Bank_Account__Currency_Code_CaptionLbl)
            {
            }
            column(Bank_Account__Min__Balance_Caption; Bank_Account__Min__Balance_CaptionLbl)
            {
            }
            column(BankAccBalanceCaption; BankAccBalanceCaptionLbl)
            {
            }
            column(Bank_Account__Last_Check_No__Caption; FIELDCAPTION("Last Check No."))
            {
            }
            column(Bank_Account__Balance_Last_Statement_Caption; FIELDCAPTION("Balance Last Statement"))
            {
            }
            column(Bank_Account__Bank_Account_No__Caption; FIELDCAPTION("Bank Account No."))
            {
            }
            column(Bank_Account_ContactCaption; FIELDCAPTION(Contact))
            {
            }
            column(Bank_Account__Phone_No__Caption; FIELDCAPTION("Phone No."))
            {
            }
            column(Total__LCY_Caption; Total__LCY_CaptionLbl)
            {
            }

            trigger OnAfterGetRecord()
            begin
                CALCFIELDS(Balance, "Balance (LCY)");
                IF PrintAmountsInLCY THEN
                    BankAccBalance := "Balance (LCY)"
                ELSE
                    BankAccBalance := Balance;
                FormatAddr.FormatAddr(
                  BankAccAddr, Name, "Name 2", '', Address, "Address 2",
                  City, "Post Code", County, "Country/Region Code");
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CREATETOTALS("Balance (LCY)");
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
                    field(PrintAmountsInLCY; PrintAmountsInLCY)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Balance in LCY';
                        ToolTip = 'Specifies if the reported balance is shown in the local currency.';
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
        BankAccFilter := DataItem4558.GETFILTERS;
    end;

    var
        FormatAddr: Codeunit "Format Address";
        PrintAmountsInLCY: Boolean;
        BankAccFilter: Text;
        BankAccBalance: Decimal;
        BankAccAddr: array[8] of Text[50];
        Bank_Account___ListCaptionLbl: Label 'Bank Account - List';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        The_balance_is_in_LCY_CaptionLbl: Label 'The balance is in LCY.';
        Bank_Account__Bank_Acc__Posting_Group_CaptionLbl: Label 'Bank Acc. Posting Group';
        Bank_Account__Currency_Code_CaptionLbl: Label 'Currency Code';
        Bank_Account__Min__Balance_CaptionLbl: Label 'Min. Balance';
        BankAccBalanceCaptionLbl: Label 'Balance';
        Total__LCY_CaptionLbl: Label 'Total (LCY)';
}

