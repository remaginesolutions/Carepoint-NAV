report 16035405 "AU/NZ Statement Modified"
{
    // version CAREPOINT1.00

    // CAREPOINT1.00 ML 06/05/2014 - Create customer statement as per templete sent by NCML
    // CAREPOINT1.00 ML 03/06/2014 - Modify customer statement as per templete sent by NCML
    DefaultLayout = RDLC;
    RDLCLayout = './AUNZ Statement Modified.rdlc';

    Caption = 'AU/NZ Statement';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem(DataItem6836; "Customer")
        {
            DataItemTableView = SORTING ("No.");
            RequestFilterFields = "No.", "Print Statements", "Date Filter";
            column(Customer_No_; "No.")
            {
            }
            column(Customer_Global_Dimension_1_Filter; "Global Dimension 1 Filter")
            {
            }
            column(Customer_Global_Dimension_2_Filter; "Global Dimension 2 Filter")
            {
            }
            column(ML_Picture; CompanyPic.Picture)
            {
            }
            column(Company_BSB_No; CompanyInfo."Bank Branch No.")
            {
            }
            column(Company_Bank_Name; CompanyInfo."Bank Name")
            {
            }
            column(Company_Bank_Acc_No; CompanyInfo."Bank Account No.")
            {
            }
            dataitem(HeaderFooter; "Integer")
            {
                DataItemTableView = SORTING (Number)
                                    WHERE (Number = CONST (1));
                column(CustomerAddress_1_; CustomerAddress[1])
                {
                }
                column(CustomerAddress_2_; CustomerAddress[2])
                {
                }
                column(CustomerAddress_3_; CustomerAddress[3])
                {
                }
                column(CustomerAddress_4_; CustomerAddress[4])
                {
                }
                column(CustomerAddress_5_; CustomerAddress[5])
                {
                }
                column(CustomerAddress_6_; CustomerAddress[6])
                {
                }
                column(CustomerAddress_7_; CustomerAddress[7])
                {
                }
                column(CustomerAddress_8_; CustomerAddress[8])
                {
                }
                column(FORMAT_ToDate_; FORMAT(ToDate, 0, '<Day> <Month text,3> <Year4>'))
                {
                }
                column(DataItem6836__No__; DataItem6836."No.")
                {
                }
                column(CurrReport_PAGENO; CurrReport.PAGENO)
                {
                }
                column(CurrencyLabel; CurrencyLabel)
                {
                }
                column(CompanyAddress_4_; CompanyAddress[4])
                {
                }
                column(CompanyAddress_3_; CompanyAddress[3])
                {
                }
                column(CompanyAddress_2_; CompanyAddress[2])
                {
                }
                column(CompanyAddress_1_; CompanyAddress[1])
                {
                }
                column(CompanyAddress_5_; CompanyAddress[5])
                {
                }
                column(PhoneNo; PhoneNo)
                {
                }
                column(FaxNo; FaxNo)
                {
                }
                column(VATRegNo; VATRegNo)
                {
                }
                column(GiroNo; GiroNo)
                {
                }
                column(Bank; Bank)
                {
                }
                column(AccountNo; AccountNo)
                {
                }
                column(CompanyInformation__Bank_Account_No__; CompanyInformation."Bank Account No.")
                {
                }
                column(CompanyInformation__Bank_Name_; CompanyInformation."Bank Name")
                {
                }
                column(CompanyInformation__Giro_No__; CompanyInformation."Giro No.")
                {
                }
                column(CompanyInformation__VAT_Registration_No__; CompanyInformation."VAT Registration No.")
                {
                }
                column(CompanyInformation__Fax_No__; CompanyInformation."Fax No.")
                {
                }
                column(CompanyInformation__Phone_No__; CompanyInformation."Phone No.")
                {
                }
                column(PrintLCY; PrintLCY)
                {
                }
                column(StatementStyle; StatementStyle)
                {
                }
                column(AgingMethod; AgingMethod)
                {
                }
                column(DebitBalance; DebitBalance)
                {
                }
                column(CreditBalance; -CreditBalance)
                {
                }
                column(StatementBalance; StatementBalance)
                {
                }
                column(HeaderFooter_Number; Number)
                {
                }
                column(STATEMENTCaption; STATEMENTCaptionLbl)
                {
                }
                column(Statement_Date_Caption; Statement_Date_CaptionLbl)
                {
                }
                column(Account_Number_Caption; Account_Number_CaptionLbl)
                {
                }
                column(Currency_Caption; Currency_CaptionLbl)
                {
                }
                column(Page_Caption; Page_CaptionLbl)
                {
                }
                column(BalanceCaption; BalanceCaptionLbl)
                {
                }
                column(CreditsCaption; CreditsCaptionLbl)
                {
                }
                column(DebitsCaption; DebitsCaptionLbl)
                {
                }
                column(Due_DateCaption; Due_DateCaptionLbl)
                {
                }
                column(No_Caption; No_CaptionLbl)
                {
                }
                column(DocumentCaption; DocumentCaptionLbl)
                {
                }
                column(DateCaption; DateCaptionLbl)
                {
                }
                column(Statement_BalanceCaption; Statement_BalanceCaptionLbl)
                {
                }
                column(Company_ABN; CompanyInfo.ABN)
                {
                }
                column(Comp_Phone; CompanyInfo."Phone No.")
                {
                }
                column(Comp_Name; CompanyInfo.Name)
                {
                }
                column(Comp_Addr1; CompanyInfo.Address)
                {
                }
                column(Comp_Addr2; CompanyInfo."Address 2")
                {
                }
                column(Comp_City; CompanyInfo.City)
                {
                }
                column(Comp_State; CompanyInfo.County)
                {
                }
                column(Comp_Postcode; CompanyInfo."Post Code")
                {
                }
                column(Comp_Email; CompanyInfo."E-Mail")
                {
                }
                column(Comp_PhoneNo; CompanyInfo."Phone No.")
                {
                }
                column(Comp_Fax; CompanyInfo."Fax No.")
                {
                }
                column(ShipTo_Addr1; CompanyInfo."Ship-to Address")
                {
                }
                column(ShipTo_City; CompanyInfo."Ship-to City")
                {
                }
                column(ShipTo_State; CompanyInfo."Ship-to County")
                {
                }
                column(ShipTo_Postcode; CompanyInfo."Ship-to Post Code")
                {
                }
                column(Date_Range_From; FromDate)
                {
                }
                column(Company_Country_Name; CountryName.Name)
                {
                }
                column(Customer_ABN_No; DataItem6836.ABN)
                {
                }
                dataitem(DataItem8503; "Cust. Ledger Entry")
                {
                    CalcFields = "Remaining Amt. (LCY)", "Remaining Amount";
                    DataItemLink = "Customer No." = FIELD ("No."),
                                   "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                   "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter");
                    DataItemLinkReference = DataItem6836;
                    DataItemTableView = SORTING ("Customer No.", Open)
                                        WHERE ("Remaining Amount" = FILTER (<> 0));

                    trigger OnPreDataItem()
                    begin
                        IF (AgingMethod = AgingMethod::None) AND (StatementStyle = StatementStyle::Balance) THEN
                            CurrReport.BREAK;    // Optimization
                        // Find ledger entries which are open and posted before the statement date.
                        LedgEntryLast := 0;
                        IF StatementStyle = StatementStyle::"Open Item" THEN
                            SETRANGE("Date Filter", 0D, ToDate);
                        SETRANGE("Posting Date", 0D, ToDate);
                    end;
                }
                dataitem("Balance Forward"; "Integer")
                {
                    DataItemTableView = SORTING (Number)
                                        WHERE (Number = CONST (1));
                    column(BalanceToPrintLCY; BalanceToPrintLCY)
                    {
                    }
                    column(FORMAT_FromDate___1_; FORMAT(FromDate - 1))
                    {
                    }
                    column(Balance_Forward_Number; Number)
                    {
                    }
                    column(Balance_ForwardCaption; Balance_ForwardCaptionLbl)
                    {
                    }
                    column(Bal_FwdCaption; Bal_FwdCaptionLbl)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        IF StatementStyle <> StatementStyle::Balance THEN
                            CurrReport.BREAK;
                    end;
                }
                dataitem(CustLedgerEntry3; "Cust. Ledger Entry")
                {
                    CalcFields = Amount, "Amount (LCY)", "Remaining Amount", "Remaining Amt. (LCY)";
                    DataItemLink = "Customer No." = FIELD ("No.");
                    DataItemLinkReference = DataItem6836;
                    DataItemTableView = SORTING ("Customer No.", "Posting Date")
                                        WHERE ("Remaining Amount" = FILTER (<> 0));
                    column(BalanceToPrint; BalanceToPrint)
                    {
                    }
                    column(FORMAT__Due_Date__; FORMAT("Due Date", 0, '<Day> <Month text,3> <Year4>'))
                    {
                    }
                    column(CustLedgerEntry3__Document_No__; "Document No.")
                    {
                    }
                    column(CustLedgerEntry3__Document_Type_; "Document Type")
                    {
                    }
                    column(FORMAT__Posting_Date__; FORMAT("Posting Date", 0, '<Day> <Month text,3> <Year4>'))
                    {
                    }
                    column(OpenDrBal; OpenDrBal)
                    {
                    }
                    column(OpenCrBal; ABS(OpenCrBal))
                    {
                    }
                    column(BalanceToPrintLCY_Control1500085; BalanceToPrintLCY)
                    {
                    }
                    column(CustLedgerEntry3__Due_Date__Control1500088; FORMAT("Due Date", 0, '<Day> <Month text,3> <Year4>'))
                    {
                    }
                    column(CustLedgerEntry3__Document_No___Control1500089; "Document No.")
                    {
                    }
                    column(CustLedgerEntry3__Document_Type__Control1500090; "Document Type")
                    {
                    }
                    column(FORMAT__Posting_Date___Control1500091; FORMAT("Posting Date", 0, '<Day> <Month text,3> <Year4>'))
                    {
                    }
                    column(OpenDrBalLCY; OpenDrBalLCY)
                    {
                    }
                    column(OpenCrBalLCY; OpenCrBalLCY)
                    {
                    }
                    column(CustLedgerEntry3_Entry_No_; "Entry No.")
                    {
                    }
                    column(CustLedgerEntry3_Customer_No_; "Customer No.")
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        OpenCrBal := 0;
                        OpenDrBal := 0;
                        OpenCrBalLCY := 0;
                        OpenDrBalLCY := 0;
                        IF PrintLCY THEN BEGIN
                            BalanceToPrintLCY := BalanceToPrintLCY + "Remaining Amt. (LCY)";
                            IF "Remaining Amt. (LCY)" >= 0 THEN BEGIN
                                DebitBalance := DebitBalance + "Remaining Amt. (LCY)";
                                OpenDrBalLCY := "Remaining Amt. (LCY)";
                            END
                            ELSE BEGIN
                                CreditBalance := CreditBalance + "Remaining Amt. (LCY)";
                                OpenCrBalLCY := "Remaining Amt. (LCY)";
                            END
                        END ELSE BEGIN
                            BalanceToPrint := BalanceToPrint + "Remaining Amount";
                            IF "Remaining Amount" >= 0 THEN BEGIN
                                DebitBalance := DebitBalance + "Remaining Amount";
                                OpenDrBal := "Remaining Amount";
                            END ELSE BEGIN
                                CreditBalance := CreditBalance + "Remaining Amount";
                                OpenCrBal := "Remaining Amount";
                            END
                        END;
                    end;

                    trigger OnPreDataItem()
                    begin
                        IF StatementStyle = StatementStyle::Balance THEN
                            CurrReport.BREAK;
                        SETRANGE("Posting Date", 0D, ToDate);
                        SETRANGE("Date Filter", 0D, ToDate);
                    end;
                }
                dataitem("AgingCust. Ledger Entry"; "Cust. Ledger Entry")
                {
                    CalcFields = "Remaining Amount", "Remaining Amt. (LCY)";
                    DataItemLink = "Customer No." = FIELD ("No.");
                    DataItemLinkReference = DataItem6836;
                    DataItemTableView = SORTING ("Customer No.", "Posting Date")
                                        WHERE ("Remaining Amount" = FILTER (<> 0));

                    trigger OnAfterGetRecord()
                    begin
                        CASE AgingMethod OF
                            AgingMethod::"Due Date":
                                BEGIN
                                    IF ("Due Date" >= Periodstartdate[1]) AND ("Due Date" <= PeriodEndingDate[1]) THEN BEGIN
                                        TempCustLedgerEntry1.INIT;
                                        TempCustLedgerEntry1 := "AgingCust. Ledger Entry";
                                        TempCustLedgerEntry1.INSERT;
                                    END;
                                    IF ("Due Date" >= Periodstartdate[2]) AND ("Due Date" <= PeriodEndingDate[2]) THEN BEGIN
                                        TempCustLedgerEntry2.INIT;
                                        TempCustLedgerEntry2 := "AgingCust. Ledger Entry";
                                        TempCustLedgerEntry2.INSERT;
                                    END;
                                    IF ("Due Date" >= Periodstartdate[3]) AND ("Due Date" <= PeriodEndingDate[3]) THEN BEGIN
                                        TempCustLedgerEntry3.INIT;
                                        TempCustLedgerEntry3 := "AgingCust. Ledger Entry";
                                        TempCustLedgerEntry3.INSERT;
                                    END;
                                    IF ("Due Date" >= Periodstartdate[4]) AND ("Due Date" <= PeriodEndingDate[4]) THEN BEGIN
                                        TempCustLedgerEntry4.INIT;
                                        TempCustLedgerEntry4 := "AgingCust. Ledger Entry";
                                        TempCustLedgerEntry4.INSERT;
                                    END;
                                END;
                            AgingMethod::"Trans Date", AgingMethod::None:
                                BEGIN
                                    IF ("Posting Date" >= Periodstartdate[1]) AND ("Posting Date" <= PeriodEndingDate[1]) THEN BEGIN
                                        TempCustLedgerEntry1.INIT;
                                        TempCustLedgerEntry1 := "AgingCust. Ledger Entry";
                                        TempCustLedgerEntry1.INSERT;
                                    END;
                                    IF ("Posting Date" >= Periodstartdate[2]) AND ("Posting Date" <= PeriodEndingDate[2]) THEN BEGIN
                                        TempCustLedgerEntry2.INIT;
                                        TempCustLedgerEntry2 := "AgingCust. Ledger Entry";
                                        TempCustLedgerEntry2.INSERT;
                                    END;
                                    IF ("Posting Date" >= Periodstartdate[3]) AND ("Posting Date" <= PeriodEndingDate[3]) THEN BEGIN
                                        TempCustLedgerEntry3.INIT;
                                        TempCustLedgerEntry3 := "AgingCust. Ledger Entry";
                                        TempCustLedgerEntry3.INSERT;
                                    END;
                                    IF ("Posting Date" >= Periodstartdate[4]) AND ("Posting Date" <= PeriodEndingDate[4]) THEN BEGIN
                                        TempCustLedgerEntry4.INIT;
                                        TempCustLedgerEntry4 := "AgingCust. Ledger Entry";
                                        TempCustLedgerEntry4.INSERT;
                                    END;
                                END;
                            AgingMethod::"Doc Date":
                                BEGIN
                                    IF ("Document Date" >= Periodstartdate[1]) AND ("Document Date" <= PeriodEndingDate[1]) THEN BEGIN
                                        TempCustLedgerEntry1.INIT;
                                        TempCustLedgerEntry1 := "AgingCust. Ledger Entry";
                                        TempCustLedgerEntry1.INSERT;
                                    END;
                                    IF ("Document Date" >= Periodstartdate[2]) AND ("Document Date" <= PeriodEndingDate[2]) THEN BEGIN
                                        TempCustLedgerEntry2.INIT;
                                        TempCustLedgerEntry2 := "AgingCust. Ledger Entry";
                                        TempCustLedgerEntry2.INSERT;
                                    END;
                                    IF ("Document Date" >= Periodstartdate[3]) AND ("Document Date" <= PeriodEndingDate[3]) THEN BEGIN
                                        TempCustLedgerEntry3.INIT;
                                        TempCustLedgerEntry3 := "AgingCust. Ledger Entry";
                                        TempCustLedgerEntry3.INSERT;
                                    END;
                                    IF ("Document Date" >= Periodstartdate[4]) AND ("Document Date" <= PeriodEndingDate[4]) THEN BEGIN
                                        TempCustLedgerEntry4.INIT;
                                        TempCustLedgerEntry4 := "AgingCust. Ledger Entry";
                                        TempCustLedgerEntry4.INSERT;
                                    END;
                                END;
                        END;
                    end;

                    trigger OnPreDataItem()
                    begin
                        SETRANGE("Posting Date", 0D, ToDate);
                        SETRANGE("Date Filter", 0D, ToDate);
                    end;
                }
                dataitem(CustLedgerEntry4; "Cust. Ledger Entry")
                {
                    CalcFields = Amount, "Amount (LCY)";
                    DataItemLink = "Customer No." = FIELD ("No.");
                    DataItemLinkReference = DataItem6836;
                    DataItemTableView = SORTING ("Customer No.", "Posting Date");
                    column(BalanceToPrint_Control1500052; BalanceToPrint)
                    {
                    }
                    column(Cust__Ledg__Entry__Credit_Amount_; "Credit Amount")
                    {
                    }
                    column(Cust__Ledg__Entry__Debit_Amount_; "Debit Amount")
                    {
                    }
                    column(FORMAT_DueDate_; FORMAT(DueDate, 0, '<Day> <Month text,3> <Year4>'))
                    {
                    }
                    column(Cust__Ledg__Entry__Document_No__; "Document No.")
                    {
                    }
                    column(Cust__Ledg__Entry__Document_Type_; "Document Type")
                    {
                    }
                    column(FORMAT__Posting_Date___Control1500058; FORMAT("Posting Date", 0, '<Day> <Month text,3> <Year4>'))
                    {
                    }
                    column(BalanceToPrintLCY_Control1500059; BalanceToPrintLCY)
                    {
                    }
                    column(Cust__Ledg__Entry__Credit_Amount__LCY__; "Credit Amount (LCY)")
                    {
                    }
                    column(Cust__Ledg__Entry__Debit_Amount__LCY__; "Debit Amount (LCY)")
                    {
                    }
                    column(FORMAT_DueDate__Control1500062; FORMAT(DueDate, 0, '<Day> <Month text,3> <Year4>'))
                    {
                    }
                    column(Cust__Ledg__Entry__Document_No___Control1500063; "Document No.")
                    {
                    }
                    column(Cust__Ledg__Entry__Document_Type__Control1500064; "Document Type")
                    {
                    }
                    column(FORMAT__Posting_Date___Control1500065; FORMAT("Posting Date", 0, '<Day> <Month text,3> <Year4>'))
                    {
                    }
                    column(StatementComplete; StatementComplete)
                    {
                    }
                    column(Cust__Ledg__Entry_Entry_No_; "Entry No.")
                    {
                    }
                    column(Cust__Ledg__Entry_Customer_No_; "Customer No.")
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        IF PrintLCY THEN BEGIN
                            BalanceToPrintLCY := BalanceToPrintLCY + "Amount (LCY)";
                            IF "Amount (LCY)" >= 0 THEN
                                DebitBalance := DebitBalance + "Amount (LCY)"
                            ELSE
                                CreditBalance := CreditBalance + "Amount (LCY)";
                        END ELSE BEGIN
                            BalanceToPrint := BalanceToPrint + Amount;
                            IF Amount >= 0 THEN
                                DebitBalance := DebitBalance + Amount
                            ELSE
                                CreditBalance := CreditBalance + Amount;
                        END;
                    end;

                    trigger OnPreDataItem()
                    begin
                        IF StatementStyle <> StatementStyle::Balance THEN
                            CurrReport.BREAK;
                        SETRANGE("Posting Date", FromDate, ToDate);
                    end;
                }
                dataitem(EndOfCustomer; "Integer")
                {
                    DataItemTableView = SORTING (Number)
                                        WHERE (Number = CONST (1));
                    column(Just_For_Adding_One_Record_to_Dataset_; 'Just For Adding One Record to Dataset')
                    {
                    }
                    column(EndOfCustomer_Number; Number)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        StatementComplete := TRUE;
                        IF UpdateNumbers AND (NOT CurrReport.PREVIEW) THEN BEGIN
                            DataItem6836.MODIFY; // just update the Last Statement No
                            COMMIT;
                        END;

                        CalcOpenLedgEntry;
                        IF AgingMethod = AgingMethod::"Due Date" THEN
                            AgingDaysText := Text1500009
                        ELSE
                            AgingDaysText := Text1500010;

                        IF PrintLCY AND (StatementStyle = StatementStyle::Balance) THEN
                            StatementBalance := BalanceToPrintLCY
                        ELSE
                            IF (NOT PrintLCY) AND (StatementStyle = StatementStyle::Balance) THEN
                                StatementBalance := BalanceToPrint
                            ELSE
                                IF StatementStyle = StatementStyle::"Open Item" THEN
                                    StatementBalance := BalanceToPrint;
                    end;
                }
            }
            dataitem(PrintFooter; "Integer")
            {
                DataItemTableView = SORTING (Number)
                                    WHERE (Number = CONST (1));
                column(Testdec_Control1000000001; AgingAmount[4])
                {
                }
                column(AgingAmount_3__Control1000000000; AgingAmount[3])
                {
                }
                column(AgingAmount_2__Control1000000002; AgingAmount[2])
                {
                }
                column(AgingAmount_1__Control1000000003; AgingAmount[1])
                {
                }
                column(StatementBalance_Control1000000004; StatementBalance)
                {
                }
                column(CreditBalance_Control1000000005; -CreditBalance)
                {
                }
                column(DebitBalance_Control1000000006; DebitBalance)
                {
                }
                column(AgingDaysText_Control1000000010; AgingDaysText)
                {
                }
                column(AgingHead_4__Control1000000008; AgingHead[4])
                {
                }
                column(AgingHead_3__Control1000000011; AgingHead[3])
                {
                }
                column(AgingHead_2__Control1000000013; AgingHead[2])
                {
                }
                column(AgingHead_1__Control1000000014; AgingHead[1])
                {
                }
                column(test2_test2_Number; Number)
                {
                }
                column(StatementComplete_Control1000000016; StatementComplete)
                {
                }
                column(AgingMethod_Control1000000017; AgingMethod)
                {
                }
                column(Statement_BalanceCaption_Control1000000007; Statement_BalanceCaption_Control1000000007Lbl)
                {
                }
                column(Statement_Aging_Caption_Control1000000009; Statement_Aging_Caption_Control1000000009Lbl)
                {
                }
                column(Aged_Amounts_Caption_Control1000000012; Aged_Amounts_Caption_Control1000000012Lbl)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                DebitBalance := 0;
                CreditBalance := 0;
                CLEAR(AmountDue);
                Print := FALSE;
                IF AllHavingBalance THEN BEGIN
                    SETRANGE("Date Filter", 0D, ToDate);
                    CALCFIELDS("Net Change");
                    Print := "Net Change" <> 0;
                END;
                IF (NOT Print) AND AllHavingEntries THEN BEGIN
                    DataItem8503.RESET;
                    IF StatementStyle = StatementStyle::Balance THEN BEGIN
                        DataItem8503.SETCURRENTKEY("Customer No.", "Posting Date");
                        DataItem8503.SETRANGE("Posting Date", FromDate, ToDate);
                    END ELSE BEGIN
                        DataItem8503.SETCURRENTKEY("Customer No.", "Posting Date");
                        DataItem8503.SETRANGE("Posting Date", FromDate, ToDate);
                        DataItem8503.SETRANGE(Open, TRUE);
                    END;
                    DataItem8503.SETRANGE("Customer No.", "No.");
                    Print := DataItem8503.FIND('-');
                END;

                IF NOT Print THEN
                    CurrReport.SKIP;
                IF StatementStyle = StatementStyle::Balance THEN BEGIN
                    SETRANGE("Date Filter", 0D, FromDate - 1);
                    CALCFIELDS("Net Change", "Net Change (LCY)");
                    BalanceToPrint := "Net Change";
                    SETRANGE("Date Filter");
                    IF PrintLCY THEN
                        BalanceToPrintLCY := "Net Change (LCY)"
                    ELSE
                        BalanceToPrintLCY := "Net Change";
                END ELSE BEGIN
                    BalanceToPrint := 0;
                    BalanceToPrintLCY := 0;
                END;

                /* Update Statement Number so it can be printed on the document. However,
                  defer actually updating the customer file until the statement is complete. */
                IF "Last Statement No." >= 9999 THEN
                    "Last Statement No." := 1
                ELSE
                    "Last Statement No." := "Last Statement No." + 1;
                CurrReport.PAGENO := 1;

                FormatAddress.Customer(CustomerAddress, DataItem6836);
                LedgEntryLast := 0;
                StatementComplete := FALSE;

            end;

            trigger OnPreDataItem()
            begin
                // IF STRPOS(OSVERSION,'NT') = 0 THEN
                // OSSystem := OSSystem::Windows
                // ELSE
                // OSSystem := OSSystem::NT;

                /* remove user-entered date filter; info now in FromDate & ToDate */
                SETRANGE("Date Filter");
                CalcAging;

                CompanyInfo.GET;
                FormatAddr.Company(CompanyAddr, CompanyInfo);

                //HBSML>>
                CountryName.GET(CompanyInfo."Country/Region Code")
                //HBSML<<

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
                    field(PrintAllWithEntries; AllHavingEntries)
                    {
                        Caption = 'Print All with Entries';
                    }
                    field(PrintAllWithBalance; AllHavingBalance)
                    {
                        Caption = 'Print All with Balance';
                    }
                    field(UpdateStatementNo; UpdateNumbers)
                    {
                        Caption = 'Update Statement No.';
                    }
                    field(StatementStyle; StatementStyle)
                    {
                        Caption = 'Statement Style';
                        OptionCaption = 'Open Item,Balance';
                    }
                    field(AgedBy; AgingMethod)
                    {
                        Caption = 'Aged By';
                        OptionCaption = 'None,Due Date,Trans Date,Doc Date';
                    }
                    field(LengthOfAgingPeriods; PeriodCalculation)
                    {
                        Caption = 'Length of Aging Periods';

                        trigger OnValidate()
                        begin
                            IF (AgingMethod <> AgingMethod::None) AND (PeriodCalculation = '') THEN
                                ERROR('You must enter a Length of Aging Periods if you select aging.');
                        end;
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        begin
            IF (NOT AllHavingEntries) AND (NOT AllHavingBalance) THEN
                AllHavingBalance := TRUE;
        end;
    }

    labels
    {
    }

    trigger OnInitReport()
    begin

        //Get company logo from Company Information
        CompanyPic.GET;
        CompanyPic.CALCFIELDS(CompanyPic.Picture);
    end;

    trigger OnPreReport()
    begin
        IF PrintLCY THEN
            CurrencyLabel := 'Local (LCY)'
        ELSE
            CurrencyLabel := 'Customer';

        IF (NOT AllHavingEntries) AND (NOT AllHavingBalance) THEN
            ERROR(Text1500001);
        IF UpdateNumbers AND CurrReport.PREVIEW THEN
            ERROR(Text1500002);
        FromDate := DataItem6836.GETRANGEMIN("Date Filter");
        ToDate := DataItem6836.GETRANGEMAX("Date Filter");

        IF (StatementStyle = StatementStyle::Balance) AND (FromDate = ToDate) THEN
            ERROR(Text1500003);

        IF (AgingMethod <> AgingMethod::None) AND (PeriodCalculation = '') THEN
            ERROR(Text1500004);

        IF PrintCompany THEN BEGIN
            CompanyInformation.GET('');
            FormatAddress.Company(CompanyAddress, CompanyInformation);
            PhoneNo := 'Phone No.';
            FaxNo := 'Fax No.';
            VATRegNo := 'VAT Reg. No.';
            GiroNo := 'GIRO No.';
            Bank := 'Bank';
            AccountNo := 'Account No.';
        END ELSE
            CLEAR(CompanyAddress);
    end;

    var
        OpenDrBal: Decimal;
        OpenDrBalLCY: Decimal;
        OpenCrBal: Decimal;
        OpenCrBalLCY: Decimal;
        Periodstartdate: array[5] of Date;
        StatementBalance: Decimal;
        PeriodLength2: DateFormula;
        FaxNo: Text[50];
        VATRegNo: Text[50];
        GiroNo: Text[50];
        Bank: Text[50];
        AccountNo: Text[50];
        CompanyInformation: Record "Company Information";
        FormatAddress: Codeunit "Format Address";
        StatementStyle: Option "Open Item",Balance;
        AllHavingEntries: Boolean;
        AllHavingBalance: Boolean;
        UpdateNumbers: Boolean;
        PhoneNo: Text[50];
        AgingMethod: Option "None","Due Date","Trans Date","Doc Date";
        PrintCompany: Boolean;
        PeriodCalculation: Code[10];
        Print: Boolean;
        FromDate: Date;
        ToDate: Date;
        CustomerAddress: array[8] of Text[50];
        CompanyAddress: array[8] of Text[50];
        BalanceToPrint: Decimal;
        BalanceToPrintLCY: Decimal;
        DebitBalance: Decimal;
        CreditBalance: Decimal;
        AgingHead: array[4] of Text[14];
        CurrencyLabel: Text[30];
        AmountDue: array[4] of Decimal;
        AgingDaysText: Text[16];
        PeriodEndingDate: array[5] of Date;
        StatementComplete: Boolean;
        PrintLCY: Boolean;
        i: Integer;
        LedgEntryLast: Integer;
        Text1500001: Label 'You must select either All with Entries or All with Balance.';
        Text1500002: Label 'You must print statements if you want to update statement numbers.';
        Text1500003: Label 'You must enter a range of dates (not just one date) in the Date Filter if you want to print Balance Forward Statements.';
        Text1500004: Label 'You must enter a Length of Aging Periods if you select aging.';
        Text1500005: Label 'days';
        Text1500006: Label 'Over';
        Text1500007: Label 'Upto';
        Text1500008: Label 'The Date Formula %1 cannot be used. Try to restate it. E.g. 1M+CM instead of CM+1M.';
        TempCustLedgerEntry1: Record "Cust. Ledger Entry" temporary;
        TempCustLedgerEntry2: Record "Cust. Ledger Entry" temporary;
        TempCustLedgerEntry3: Record "Cust. Ledger Entry" temporary;
        TempCustLedgerEntry4: Record "Cust. Ledger Entry" temporary;
        AgingAmount: array[4] of Decimal;
        CustLedEntry: Record "Cust. Ledger Entry";
        DueDate: Date;
        Text1500009: Label 'Days overdue:';
        Text1500010: Label 'Days old:';
        STATEMENTCaptionLbl: Label 'STATEMENT';
        Statement_Date_CaptionLbl: Label 'Statement Date:';
        Account_Number_CaptionLbl: Label 'Account Number:';
        Currency_CaptionLbl: Label 'Currency:';
        Page_CaptionLbl: Label 'Page:';
        BalanceCaptionLbl: Label 'Balance';
        CreditsCaptionLbl: Label 'Credits';
        DebitsCaptionLbl: Label 'Debits';
        Due_DateCaptionLbl: Label 'Due Date';
        No_CaptionLbl: Label 'No.';
        DocumentCaptionLbl: Label 'Document';
        DateCaptionLbl: Label 'Date';
        Statement_BalanceCaptionLbl: Label 'Statement Balance';
        Balance_ForwardCaptionLbl: Label 'Balance Forward';
        Bal_FwdCaptionLbl: Label 'Bal Fwd';
        Statement_BalanceCaption_Control1000000007Lbl: Label 'Statement Balance';
        Statement_Aging_Caption_Control1000000009Lbl: Label 'Statement Aging:';
        Aged_Amounts_Caption_Control1000000012Lbl: Label 'Aged Amounts:';
        CompanyPic: Record "Company Information";
        CompanyInfo: Record "Company Information";
        FormatAddr: Codeunit "Format Address";
        CompanyAddr: array[8] of Text[50];
        CountryName: Record "Country/Region";
        EmailLbl: Label 'Email:';
        CustomerLbl: Label 'CUSTOMER:';
        ABNLbl: Label 'ABN:';
        AppliedLbl: Label 'Paid/Applied';
        TotalDueLbl: Label 'TOTAL DUE';
        AgingBand2lbl: Label '30 DAYS';
        AgingBand3lbl: Label '60 DAYS';
        AgingBand4lbl: Label '90 + DAYS';
        StatementBalanceLbl: Label 'Statement Balance';
        AdditionalLine1Lbl: Label 'Please remit with copy';
        AdditionalLine2Lbl: Label 'of statement';
        AdditionalLine3Lbl: Label 'Thank you';

    procedure GetTermsString(var CustLedgerEntry: Record "Cust. Ledger Entry"): Text[250]
    var
        InvoiceHeader: Record "Sales Invoice Header";
        PaymentTerms: Record "Payment Terms";
    begin
        WITH CustLedgerEntry DO BEGIN
            IF ("Document No." = '') OR ("Document Type" <> "Document Type"::Invoice) THEN
                EXIT('');

            IF InvoiceHeader.READPERMISSION THEN
                IF InvoiceHeader.GET("Document No.") THEN
                    IF PaymentTerms.GET(InvoiceHeader."Payment Terms Code") THEN BEGIN
                        IF PaymentTerms.Description <> '' THEN
                            EXIT(PaymentTerms.Description);

                        EXIT(InvoiceHeader."Payment Terms Code");
                    END ELSE
                        EXIT(InvoiceHeader."Payment Terms Code");
        END;

        IF DataItem6836."Payment Terms Code" <> '' THEN
            IF PaymentTerms.GET(DataItem6836."Payment Terms Code") THEN BEGIN
                IF PaymentTerms.Description <> '' THEN
                    EXIT(PaymentTerms.Description);

                EXIT(DataItem6836."Payment Terms Code");
            END ELSE
                EXIT(DataItem6836."Payment Terms Code");

        EXIT('');
    end;

    procedure CalcAging()
    begin
        IF AgingMethod = AgingMethod::None THEN
            EXIT;
        AgingDaysText := '';
        EVALUATE(PeriodLength2, '-' + FORMAT(PeriodCalculation));
        IF AgingMethod = AgingMethod::"Due Date" THEN BEGIN
            PeriodEndingDate[1] := 99991231D;
            Periodstartdate[1] := ToDate + 1;
        END ELSE BEGIN
            PeriodEndingDate[1] := ToDate;
            Periodstartdate[1] := CALCDATE(PeriodLength2, ToDate + 1);
        END;
        FOR i := 2 TO 4 DO BEGIN
            PeriodEndingDate[i] := Periodstartdate[i - 1] - 1;
            Periodstartdate[i] := CALCDATE(PeriodLength2, PeriodEndingDate[i] + 1);
        END;
        Periodstartdate[i] := 0D;
        FOR i := 1 TO 4 DO
            IF PeriodEndingDate[i] < Periodstartdate[i] THEN
                ERROR(Text1500008, PeriodCalculation);
        IF AgingMethod = AgingMethod::"Due Date" THEN BEGIN
            i := 2;
            WHILE i < 4 DO BEGIN
                AgingHead[i] := STRSUBSTNO('%1 - %2 %3', ToDate - PeriodEndingDate[i] + 1, ToDate - Periodstartdate[i] + 1, Text1500005);
                i := i + 1;
            END;
            AgingHead[1] := 'Current';
            AgingHead[2] := STRSUBSTNO('%1 %2 %3', Text1500007, ToDate - Periodstartdate[2] + 1, Text1500005);
        END ELSE
            i := 1;

        WHILE i < 4 DO BEGIN
            AgingHead[1] := 'Current';
            AgingHead[i] := STRSUBSTNO('%1 - %2 %3', ToDate - PeriodEndingDate[i] + 1, ToDate - Periodstartdate[i] + 1, Text1500005);
            i := i + 1;
        END;
        AgingHead[i] := STRSUBSTNO('%1 %2 %3', Text1500006, ToDate - Periodstartdate[i - 1] + 1, Text1500005);
    end;

    procedure CalcOpenLedgEntry()
    begin
        CLEAR(AgingAmount);
        IF NOT PrintLCY THEN BEGIN
            TempCustLedgerEntry1.RESET;
            TempCustLedgerEntry1.SETRANGE("Customer No.", "AgingCust. Ledger Entry"."Customer No.");
            TempCustLedgerEntry1.SETRANGE("Date Filter", 0D, ToDate);
            TempCustLedgerEntry1.SETRANGE("Posting Date", 0D, ToDate);
            IF TempCustLedgerEntry1.FIND('-') THEN
                REPEAT
                    TempCustLedgerEntry1.CALCFIELDS("Remaining Amount");
                    AgingAmount[1] += TempCustLedgerEntry1."Remaining Amount";
                UNTIL TempCustLedgerEntry1.NEXT = 0;
        END ELSE BEGIN
            TempCustLedgerEntry1.RESET;
            TempCustLedgerEntry1.SETRANGE("Customer No.", "AgingCust. Ledger Entry"."Customer No.");
            TempCustLedgerEntry1.SETRANGE("Date Filter", 0D, ToDate);
            TempCustLedgerEntry1.SETRANGE("Posting Date", 0D, ToDate);
            IF TempCustLedgerEntry1.FIND('-') THEN
                REPEAT
                    TempCustLedgerEntry1.CALCFIELDS("Remaining Amt. (LCY)");
                    AgingAmount[1] += TempCustLedgerEntry1."Remaining Amt. (LCY)";
                UNTIL TempCustLedgerEntry1.NEXT = 0;
        END;
        IF NOT PrintLCY THEN BEGIN
            TempCustLedgerEntry2.RESET;
            TempCustLedgerEntry2.SETRANGE("Customer No.", "AgingCust. Ledger Entry"."Customer No.");
            TempCustLedgerEntry2.SETRANGE("Date Filter", 0D, ToDate);
            TempCustLedgerEntry2.SETRANGE("Posting Date", 0D, ToDate);
            IF TempCustLedgerEntry2.FIND('-') THEN
                REPEAT
                    TempCustLedgerEntry2.CALCFIELDS("Remaining Amount");
                    AgingAmount[2] += TempCustLedgerEntry2."Remaining Amount";
                UNTIL TempCustLedgerEntry2.NEXT = 0;
        END ELSE BEGIN
            TempCustLedgerEntry2.RESET;
            TempCustLedgerEntry2.SETRANGE("Customer No.", "AgingCust. Ledger Entry"."Customer No.");
            TempCustLedgerEntry2.SETRANGE("Date Filter", 0D, ToDate);
            TempCustLedgerEntry2.SETRANGE("Posting Date", 0D, ToDate);
            IF TempCustLedgerEntry2.FIND('-') THEN
                REPEAT
                    TempCustLedgerEntry2.CALCFIELDS("Remaining Amt. (LCY)");
                    AgingAmount[2] += TempCustLedgerEntry2."Remaining Amt. (LCY)";
                UNTIL TempCustLedgerEntry2.NEXT = 0;
        END;
        IF NOT PrintLCY THEN BEGIN
            TempCustLedgerEntry3.RESET;
            TempCustLedgerEntry3.SETRANGE("Customer No.", "AgingCust. Ledger Entry"."Customer No.");
            TempCustLedgerEntry3.SETRANGE("Date Filter", 0D, ToDate);
            TempCustLedgerEntry3.SETRANGE("Posting Date", 0D, ToDate);
            IF TempCustLedgerEntry3.FIND('-') THEN
                REPEAT
                    TempCustLedgerEntry3.CALCFIELDS("Remaining Amount");
                    AgingAmount[3] += TempCustLedgerEntry3."Remaining Amount";
                UNTIL TempCustLedgerEntry3.NEXT = 0;
        END ELSE BEGIN
            TempCustLedgerEntry3.RESET;
            TempCustLedgerEntry3.SETRANGE("Customer No.", "AgingCust. Ledger Entry"."Customer No.");
            TempCustLedgerEntry3.SETRANGE("Date Filter", 0D, ToDate);
            TempCustLedgerEntry3.SETRANGE("Posting Date", 0D, ToDate);
            IF TempCustLedgerEntry3.FIND('-') THEN
                REPEAT
                    TempCustLedgerEntry3.CALCFIELDS("Remaining Amount");
                    AgingAmount[3] += TempCustLedgerEntry3."Remaining Amount";
                UNTIL TempCustLedgerEntry3.NEXT = 0;
        END;
        IF NOT PrintLCY THEN BEGIN
            TempCustLedgerEntry4.RESET;
            TempCustLedgerEntry4.SETRANGE("Customer No.", "AgingCust. Ledger Entry"."Customer No.");
            TempCustLedgerEntry4.SETRANGE("Date Filter", 0D, ToDate);
            TempCustLedgerEntry4.SETRANGE("Posting Date", 0D, ToDate);
            IF TempCustLedgerEntry4.FIND('-') THEN
                REPEAT
                    TempCustLedgerEntry4.CALCFIELDS("Remaining Amount");
                    AgingAmount[4] += TempCustLedgerEntry4."Remaining Amount";
                UNTIL TempCustLedgerEntry4.NEXT = 0;
        END ELSE BEGIN
            TempCustLedgerEntry4.RESET;
            TempCustLedgerEntry4.SETRANGE("Customer No.", "AgingCust. Ledger Entry"."Customer No.");
            TempCustLedgerEntry4.SETRANGE("Date Filter", 0D, ToDate);
            TempCustLedgerEntry4.SETRANGE("Posting Date", 0D, ToDate);
            IF TempCustLedgerEntry4.FIND('-') THEN
                REPEAT
                    TempCustLedgerEntry4.CALCFIELDS("Remaining Amount");
                    AgingAmount[4] += TempCustLedgerEntry4."Remaining Amount";
                UNTIL TempCustLedgerEntry4.NEXT = 0;
        END;
    end;
}

