report 16035402 "Remittance Advice Non-Sum"
{
    // version CAREPOINT1.00

    // CAREPOINT1.00 ASAL 26thJuly2013
    // - This report is link to Payment Journal when print Remittance Advice NON summary
    // 
    // CAREPOINT1.00 ASAL 6th December 2013
    // - Modification to skip record to be display when Gen Journal Line record for the field "Applies to Doc No."= ''
    // - Sum same vendor record with "Applies to Doc No."= '' into Vendor Record with "Applies to Doc No." <> ''
    // 
    // HBSML 28/07/2014
    // -Get country name from the country code
    // HBSRP 2016-01-20: Code added for calculation of WHT amount based on "Foreign Vend" of Vendor
    DefaultLayout = RDLC;
    RDLCLayout = './Remittance Advice Non-Sum.rdlc';

    Caption = 'Remittance Advice Non Summary';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem(DataItem7024; "Gen. Journal Line")
        {
            DataItemTableView = SORTING ("Account No.");
            RequestFilterFields = "Journal Template Name", "Journal Batch Name";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            column(USERID; USERID)
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CompanyAddr_1_; CompanyAddr[1])
            {
            }
            column(CompanyAddr_2_; CompanyAddr[2])
            {
            }
            column(CompanyAddr_3_; CompanyAddr[3])
            {
            }
            column(CompanyAddr_4_; CompanyAddr[4])
            {
            }
            column(CompanyInfo_Picture; CompanyInfo.Picture)
            {
            }
            column(Gen__Journal_Line__TABLECAPTION__________GenJnlLineFilter; DataItem7024.TABLECAPTION + ': ' + GenJnlLineFilter)
            {
            }
            column(CustAddr_8_; VendAddr[8])
            {
            }
            column(CustAddr_7_; VendAddr[7])
            {
            }
            column(CustAddr_6_; VendAddr[6])
            {
            }
            column(CustAddr_5_; VendAddr[5])
            {
            }
            column(CustAddr_4_; VendAddr[4])
            {
            }
            column(CustAddr_3_; VendAddr[3])
            {
            }
            column(CustAddr_1_; VendAddr[1])
            {
            }
            column(CustAddr_2_; VendAddr[2])
            {
            }
            column(VendorName; VendorName)
            {
            }
            column(Vendor_Ledger_Entry__Vendor_No__; "Account No.")
            {
            }
            column(VendFaxNo; VendFaxNo)
            {
            }
            column(Posting_Date_Value; "Posting Date")
            {
            }
            column(Gen__Journal_Line__Document_Type_; "Document Type")
            {
            }
            column(Gen__Journal_Line__Document_No__; "Document No.")
            {
            }
            column(Gen__Journal_Line_Amount; Amount - WHTAmount)
            {
            }
            column(Apply_to_Doc_Type_Value; "Applies-to Doc. Type")
            {
            }
            column(External_Doc_No_Value; ExternalDocNo)
            {
            }
            column(Remaining_Amount_Value; ABS(RemainingAmount))
            {
            }
            column(Paid_Amount_Value; ABS(AmountToApply))
            {
            }
            column(Gen__Journal_Line_Amount_Control1000000023; Amount)
            {
            }
            column(Total_Paid_Amount_Value; TotalAmountToApply)
            {
            }
            column(Remittance_AdviceCaption; Remittance_AdviceCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Fax_No_Caption; Fax_No_CaptionLbl)
            {
            }
            column(Vendor_No_Caption; Vendor_No_CaptionLbl)
            {
            }
            column(Vendor_NameCaption; Vendor_NameCaptionLbl)
            {
            }
            column(Amount_PaidCaption; Amount_PaidCaptionLbl)
            {
            }
            column(Original_AmountCaption; Original_AmountCaptionLbl)
            {
            }
            column(Invoice_No_Caption; Invoice_No_CaptionLbl)
            {
            }
            column(Document_TypeCaption; Document_TypeCaptionLbl)
            {
            }
            column(DateCaption; DateLbl)
            {
            }
            column(Payment_Amount_Caption; Payment_Amount_CaptionLbl)
            {
            }
            column(Gen__Journal_Line_Journal_Template_Name; "Journal Template Name")
            {
            }
            column(Gen__Journal_Line_Journal_Batch_Name; "Journal Batch Name")
            {
            }
            column(Gen__Journal_Line_Line_No_; "Line No.")
            {
            }
            column(PhoneCaption; PhoneLbl)
            {
            }
            column(FaxCaption; FaxLbl)
            {
            }
            column(EmailCaption; EmailLbl)
            {
            }
            column(ABNCaption; ABNLbl)
            {
            }
            column(AccountCaption; AccountLbl)
            {
            }
            column(PageCaption; PageLbl)
            {
            }
            column(InvoiceDateCaption; InvoiceDateLbl)
            {
            }
            column(InvoiceNoCaption; InvoiceNoLbl)
            {
            }
            column(DetailsCaption; DetailsLbl)
            {
            }
            column(ReferenceCaption; ReferenceLbl)
            {
            }
            column(InvCreditAmtCaption; InvCreditAmtLbl)
            {
            }
            column(DiscountCaption; DiscountLbl)
            {
            }
            column(AmountPaidCaption; AmountPaidLbl)
            {
            }
            column(PhoneValue; CompanyInfo."Phone No.")
            {
            }
            column(FaxValue; CompanyInfo."Fax No.")
            {
            }
            column(EmailValue; CompanyInfo."E-Mail")
            {
            }
            column(ABNValue; CompanyInfo.ABN)
            {
            }
            column(AccountValue; VendRec."No.")
            {
            }
            column(DateValue; TODAY)
            {
            }
            column(InvoiceDateValue; VendorLedgerEntry."Posting Date")
            {
            }
            column(InvoiceNoValue; VendorLedgerEntry."Document No.")
            {
            }
            column(ReferenceValue; "Applies-to Doc. No.")
            {
            }
            column(LineDetailedValue; LineDetailed)
            {
            }
            column(DisplayRemainingAmtValue; DisplayRemainingAmt)
            {
            }
            column(DisplayAmountToApplyValue; DisplayAmountToApply)
            {
            }
            column(Company_Fax; CompanyInfo."Fax No.")
            {
            }
            column(Company_City; CompanyInfo.City)
            {
            }
            column(Company_State; CompanyInfo.County)
            {
            }
            column(Company_Postcode; CompanyInfo."Post Code")
            {
            }
            column(Shipto_Addr1; CompanyInfo."Ship-to Address")
            {
            }
            column(Shipto_City; CompanyInfo."Ship-to City")
            {
            }
            column(Shipto_State; CompanyInfo."Ship-to County")
            {
            }
            column(Shipto_Postcode; CompanyInfo."Ship-to Post Code")
            {
            }
            column(Company_ABN; CompanyInfo.ABN)
            {
            }
            column(Company_Email; CompanyInfo."E-Mail")
            {
            }
            column(Company_Phone; CompanyInfo."Phone No.")
            {
            }
            column(Discount_Amount; PurchInvLine."Line Discount Amount")
            {
            }
            column(Payment_Number; GenJournalLine."Document No.")
            {
            }
            column(Total_Amount_Value; TotalAmount)
            {
            }
            column(New_Remaining_Amount; NewRemainingAmount)
            {
            }
            column(Invoice_Date; FORMAT(InvoicePostingDate, 0, '<Day> <Month text,3> <Year4>'))
            {
            }
            column(Company_Country_Name; CountryName.Name)
            {
            }
            column(WHT_Amount; WHTAmount)
            {
            }

            trigger OnAfterGetRecord()
            begin
                LineDetailed := '';//Get First Line of Posted Purchase Document Line (Purchase Invoice or Purchase CR MEMO)to display as Detail in Report
                IF ("Account No." <> '') AND ("Account Type" = "Account Type"::Vendor) THEN BEGIN
                    VendorName := '';
                    VendFaxNo := '';
                    VendRec.RESET;
                    VendRec.GET("Account No.");
                    VendorName := VendRec.Name;
                    VendFaxNo := VendRec."Fax No.";
                    FormatAddr.Vendor(VendAddr, VendRec);
                END;

                IF ("Applies-to Doc. Type" <> "Applies-to Doc. Type"::" ") AND ("Applies-to Doc. No." <> '') THEN BEGIN
                    ExternalDocNo := '';
                    RemainingAmount := 0;
                    AmountToApply := 0;
                    DisplayRemainingAmt := 0;//Remaining Amount to be display in Report
                    DisplayAmountToApply := 0;//Amount to Apply to be display in Report


                    VendorLedgerEntry.RESET;
                    VendorLedgerEntry.SETFILTER("Document Type", '=%1', "Applies-to Doc. Type");
                    VendorLedgerEntry.SETRANGE("Document No.", "Applies-to Doc. No.");
                    IF VendorLedgerEntry.FIND('-') THEN BEGIN
                        ExternalDocNo := VendorLedgerEntry."External Document No.";
                        VendorLedgerEntry.CALCFIELDS("Remaining Amount");
                        //HBSML >>
                        NewRemainingAmount := VendorLedgerEntry."Remaining Amount";
                        InvoicePostingDate := VendorLedgerEntry."Posting Date";
                        //HBSML <<
                        //HBSTG >>
                        VendorLedgerEntry.CALCFIELDS(Amount);
                        TotalAmount := VendorLedgerEntry.Amount;
                        //HBSTG <<
                        RemainingAmount := VendorLedgerEntry."Remaining Amount";
                        AmountToApply := VendorLedgerEntry."Amount to Apply";

                        //Applies-to Doc. Type = Invoice//Posted Purchase Invoice
                        IF "Applies-to Doc. Type" = "Applies-to Doc. Type"::Invoice THEN BEGIN
                            PurchInvLine.SETFILTER("Document No.", '=%1', "Applies-to Doc. No.");
                            PurchInvLine.SETFILTER(Description, '<>%1', '');
                            IF PurchInvLine.FIND('-') THEN BEGIN
                                LineDetailed := PurchInvLine.Description;
                                IF RemainingAmount < 0 THEN
                                    DisplayRemainingAmt := ABS(RemainingAmount);
                                IF AmountToApply < 0 THEN
                                    DisplayAmountToApply := ABS(AmountToApply);
                            END;
                        END;
                        //Applies-to Doc. Type = Credit Memo//Posted Purchase Credit Memo
                        IF "Applies-to Doc. Type" = "Applies-to Doc. Type"::"Credit Memo" THEN BEGIN
                            PurchCrMemoLine.SETFILTER("Document No.", '=%1', "Applies-to Doc. No.");
                            PurchCrMemoLine.SETFILTER(Description, '<>%1', '');
                            IF PurchCrMemoLine.FIND('-') THEN BEGIN
                                LineDetailed := PurchCrMemoLine.Description;
                                IF RemainingAmount > 0 THEN
                                    DisplayRemainingAmt := -RemainingAmount;
                                IF AmountToApply > 0 THEN
                                    DisplayAmountToApply := -AmountToApply;

                            END;
                        END;
                        // CAREPOINT1.00 2015-10-14 Start:
                        WHTAmount := 0;
                        IF NOT "Skip WHT" THEN BEGIN
                            IF NOT VendRec."Foreign Vend" THEN BEGIN // CAREPOINT1.00 2016-01-21
                                WHTEntry.RESET;
                                WHTEntry.SETRANGE("Document No.", "Applies-to Doc. No.");
                                WHTEntry.SETRANGE("Document Type", "Applies-to Doc. Type");
                                IF WHTEntry.FINDFIRST THEN
                                    WHTAmount := WHTEntry."Remaining Unrealized Amount";
                            END;
                        END;
                        DisplayAmountToApply := DisplayAmountToApply - WHTAmount;
                        // CAREPOINT1.00 2015-10-14 End:

                    END;
                END ELSE
                    CurrReport.SKIP;

                GenJournalLine.RESET;
                GenJournalLine.SETRANGE("Journal Template Name", "Journal Template Name");
                GenJournalLine.SETRANGE("Journal Batch Name", "Journal Batch Name");
                GenJournalLine.SETFILTER("Account No.", '=%1', "Account No.");
                IF GenJournalLine.FIND('-') THEN BEGIN
                    TotalAmountToApply := 0;
                    REPEAT
                        VendorLedgerEntry.RESET;
                        VendorLedgerEntry.SETFILTER("Document Type", '=%1', GenJournalLine."Applies-to Doc. Type");
                        VendorLedgerEntry.SETRANGE("Document No.", GenJournalLine."Applies-to Doc. No.");
                        IF VendorLedgerEntry.FIND('-') THEN BEGIN

                            TempTotal := 0;
                            IF VendorLedgerEntry."Amount to Apply" < 0 THEN//Reverse Sign
                                TempTotal := ABS(VendorLedgerEntry."Amount to Apply");
                            IF VendorLedgerEntry."Amount to Apply" > 0 THEN//Reverse Sign
                                TempTotal := -(VendorLedgerEntry."Amount to Apply");

                            //TotalAmountToApply := TotalAmountToApply + ABS(VendorLedgerEntry."Amount to Apply");
                            TotalAmountToApply := TotalAmountToApply + TempTotal;
                        END;
                        // CAREPOINT1.00 2015-10-14 Start:
                        WHTAmountTotal := 0;
                        IF NOT GenJournalLine."Skip WHT" THEN BEGIN
                            IF NOT VendRec."Foreign Vend" THEN BEGIN // CAREPOINT1.00 2016-01-21
                                WHTEntry.RESET;
                                WHTEntry.SETRANGE(WHTEntry."Document No.", GenJournalLine."Applies-to Doc. No.");
                                WHTEntry.SETRANGE(WHTEntry."Document Type", GenJournalLine."Applies-to Doc. Type");
                                IF WHTEntry.FINDFIRST THEN
                                    WHTAmountTotal := WHTEntry."Remaining Unrealized Amount";
                            END;
                            TotalAmountToApply := TotalAmountToApply - WHTAmountTotal;
                        END;
                        // CAREPOINT1.00 2015-10-14 End:

                    UNTIL GenJournalLine.NEXT = 0;
                END;

                //>>CAREPOINT1.00 ASAL 6th December 2013
                //Get Payment Journal for Vendor that ("Applies-to Doc. Type"::" ") AND ("Applies-to Doc. No." = '')
                GenJournalLine2.RESET;
                GenJournalLine2.SETRANGE("Journal Template Name", "Journal Template Name");
                GenJournalLine2.SETRANGE("Journal Batch Name", "Journal Batch Name");
                GenJournalLine2.SETFILTER("Account No.", '=%1', "Account No.");
                GenJournalLine2.SETFILTER("Applies-to Doc. No.", '=%1', '');
                GenJournalLine2.SETFILTER("External Document No.", "External Document No.");
                IF GenJournalLine2.FIND('-') THEN BEGIN
                    REPEAT
                        DisplayAmountToApply := DisplayAmountToApply + GenJournalLine2.Amount;
                        //TotalAmountToApply := TotalAmountToApply + GenJournalLine2.Amount;
                    UNTIL GenJournalLine2.NEXT = 0;
                END;

                GenJournalLine3.RESET;
                GenJournalLine3.SETRANGE("Journal Template Name", "Journal Template Name");
                GenJournalLine3.SETRANGE("Journal Batch Name", "Journal Batch Name");
                GenJournalLine3.SETFILTER("Account No.", '=%1', "Account No.");
                GenJournalLine3.SETFILTER("Applies-to Doc. No.", '=%1', '');
                IF GenJournalLine3.FIND('-') THEN BEGIN
                    REPEAT
                        TotalAmountToApply := TotalAmountToApply + GenJournalLine3.Amount;
                    UNTIL GenJournalLine3.NEXT = 0;
                END;

                //<<CAREPOINT1.00 ASAL 6th December 2013
            end;

            trigger OnPostDataItem()
            begin
                TotalAmountToApply := 0;
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("Account No.");

                CompanyInfo.GET;
                CompanyInfo.CALCFIELDS(Picture);
                FormatAddr.Company(CompanyAddr, CompanyInfo);

                //HBSML>>
                CountryName.GET(CompanyInfo."Country/Region Code")
                //HBSML<<
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
    begin
        GenJnlLineFilter := DataItem7024.GETFILTERS;
    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TotalFor: Label 'Total for ';
        CompanyInfo: Record "Company Information";
        VendRec: Record "Vendor";
        VendorLedgerEntry: Record "Vendor Ledger Entry";
        GenJournalLine: Record "Gen. Journal Line";
        GenJournalLine2: Record "Gen. Journal Line";
        GenJournalLine3: Record "Gen. Journal Line";
        FormatAddr: Codeunit "Format Address";
        VendorName: Text[50];
        VendAddr: array[8] of Text[50];
        VendFaxNo: Text[30];
        CompanyAddr: array[8] of Text[50];
        GenJnlLineFilter: Text[250];
        ExternalDocNo: Code[35];
        RemainingAmount: Decimal;
        AmountToApply: Decimal;
        TotalAmountToApply: Decimal;
        Remittance_AdviceCaptionLbl: Label 'Remittance Advice';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Fax_No_CaptionLbl: Label 'Fax No.';
        Vendor_No_CaptionLbl: Label 'Vendor No.';
        Vendor_NameCaptionLbl: Label 'Vendor Name';
        Amount_PaidCaptionLbl: Label 'Amount Paid';
        Original_AmountCaptionLbl: Label 'Original Amount';
        Invoice_No_CaptionLbl: Label 'Invoice No.';
        Document_TypeCaptionLbl: Label 'Document Type';
        DateCaptionLbl: Label 'Date';
        Payment_Amount_CaptionLbl: Label 'TOTAL';
        PhoneLbl: Label 'Pnone:';
        FaxLbl: Label 'Fax:';
        EmailLbl: Label 'Email:';
        ABNLbl: Label 'ABN:';
        AccountLbl: Label 'Account Number:';
        DateLbl: Label 'Date';
        PageLbl: Label 'Page';
        InvoiceDateLbl: Label 'Inv Date';
        InvoiceNoLbl: Label 'Invoice No';
        DetailsLbl: Label 'Details';
        ReferenceLbl: Label 'Reference';
        InvCreditAmtLbl: Label 'Inv/Credit Amt';
        DiscountLbl: Label 'Discount';
        AmountPaidLbl: Label 'Amount Paid';
        LineDetailed: Text[50];
        PurchInvLine: Record "Purch. Inv. Line";
        PurchCrMemoLine: Record "Purch. Cr. Memo Line";
        DisplayRemainingAmt: Decimal;
        DisplayAmountToApply: Decimal;
        TempTotal: Decimal;
        TotalAmount: Decimal;
        NewRemainingAmount: Decimal;
        InvoicePostingDate: Date;
        CountryName: Record "Country/Region";
        WHTAmount: Decimal;
        WHTEntry: Record "WHT Entry";
        WHTAmountTotal: Decimal;
        Vend: Record "Vendor";
}

