report 16035403 "Remittance Advice Summary"
{
    // version CAREPOINT1.00

    // #CAREPOINT1.00 ASAL 15thJULY2010
    // - Amount in Design Section Value is from field name "Amount to Apply" from
    //   Vendor Ledger Entry
    // - Block Existing Code which Amount is from "Remianing Amount: from
    //   Vendor Ledger Entry
    // - Data Item of Vendor Ledger Entry for the property of TotalFields = Remaining Amount,Amount to Apply
    // 
    // CAREPOINT1.00 DBS 28/07/11 : Modified RTC Layout
    // CAREPOINT1.00 DBS 17/08/11 : Modified RTC Layout
    // HBSRP 2016-01-20: Code added for calculation of WHT amount based on "Foreign Vend" of Vendor
    DefaultLayout = RDLC;
    RDLCLayout = './Remittance Advice Summary.rdlc';

    Caption = 'Remittance Advice Summary';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem(DataItem3502; "Gen. Journal Batch")
        {
            DataItemTableView = SORTING ("Journal Template Name", Name);
            column(Gen__Journal_Batch_Journal_Template_Name; "Journal Template Name")
            {
            }
            column(Gen__Journal_Batch_Name; Name)
            {
            }
            column(CompanyInfo_Picture; CompanyInfo.Picture)
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
            column(Company_ABN; CompanyInfo.ABN)
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
            column(Company_Email; CompanyInfo."E-Mail")
            {
            }
            column(Company_Phone; CompanyInfo."Phone No.")
            {
            }
            column(Company_Country_Name; CountryName.Name)
            {
            }
            dataitem(DataItem5444; "Integer")
            {
                DataItemTableView = SORTING (Number)
                                    WHERE (Number = CONST (1));
                PrintOnlyIfDetail = true;
                column(FORMAT_TODAY_0_4_; TODAY)
                {
                }
                column(COMPANYNAME; COMPANYNAME)
                {
                }
                column(CurrReport_PAGENO; CurrReport.PAGENO)
                {
                }
                column(USERID; USERID)
                {
                }
                column(GenJnlLineFilter; GenJnlLineFilter)
                {
                }
                column(Gen__Journal_Line__TABLECAPTION__________GenJnlLineFilter; DataItem7024.TABLECAPTION + ': ' + GenJnlLineFilter)
                {
                }
                column(GenJnlLineFilter_Control54; GenJnlLineFilter)
                {
                }
                column(General_Journal___TestCaption; General_Journal___TestCaptionLbl)
                {
                }
                column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
                {
                }
                column(Integer_Number; Number)
                {
                }
                dataitem(DataItem7024; "Gen. Journal Line")
                {
                    DataItemLink = "Journal Template Name" = FIELD ("Journal Template Name"),
                                   "Journal Batch Name" = FIELD (Name);
                    DataItemLinkReference = DataItem3502;
                    DataItemTableView = SORTING ("Journal Template Name", "Journal Batch Name", "Line No.")
                                        WHERE ("Account Type" = FILTER (Vendor));
                    RequestFilterFields = "Posting Date", "Journal Template Name", "Journal Batch Name";
                    column(GenJnlLinePostingDate; DataItem7024."Posting Date")
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
                    column(Gen__Journal_Line_Account_No_; "Account No.")
                    {
                    }
                    column(Gen__Journal_Line_Currency_Code; "Currency Code")
                    {
                    }
                    column(Payment_Number; DataItem7024."Document No.")
                    {
                    }
                    column(General_Journal_Line_Amount; DataItem7024.Amount)
                    {
                    }
                    dataitem(DataItem4114; "Vendor Ledger Entry")
                    {
                        DataItemLink = "Vendor No." = FIELD ("Account No."),
                                       "Currency Code" = FIELD ("Currency Code");
                        DataItemTableView = SORTING ("Entry No.")
                                            WHERE ("Applies-to ID" = FILTER (<> ''),
                                                  Open = FILTER (True));
                        column(Vendor_Ledger_Entry__Vendor_No__; "Vendor No.")
                        {
                        }
                        column(VendorName; VendorName)
                        {
                        }
                        column(CustAddr_1_; VendAddr[1])
                        {
                        }
                        column(CustAddr_2_; VendAddr[2])
                        {
                        }
                        column(CustAddr_3_; VendAddr[3])
                        {
                        }
                        column(CustAddr_4_; VendAddr[4])
                        {
                        }
                        column(CustAddr_5_; VendAddr[5])
                        {
                        }
                        column(CustAddr_6_; VendAddr[6])
                        {
                        }
                        column(CustAddr_7_; VendAddr[7])
                        {
                        }
                        column(CustAddr_8_; VendAddr[8])
                        {
                        }
                        column(VendFaxNo; VendFaxNo)
                        {
                        }
                        column(Vendor_Ledger_Entry__Posting_Date_; "Posting Date")
                        {
                        }
                        column(Vendor_Ledger_Entry__Document_Type_; "Document Type")
                        {
                        }
                        column(Vendor_Ledger_Entry__External_Document_No__; "External Document No.")
                        {
                        }
                        column(ABS__Remaining_Amount__; ABS("Remaining Amount"))
                        {
                        }
                        column(RemainingAmount; RemainingAmount)
                        {
                        }
                        column(ABS__Remaining_Amount___Control1000000007; ABS("Remaining Amount"))
                        {
                        }
                        column(ABS__Amount_to_Apply__; ABS("Amount to Apply"))
                        {
                        }
                        column(DateCaption; DateCaptionLbl)
                        {
                        }
                        column(Document_TypeCaption; Document_TypeCaptionLbl)
                        {
                        }
                        column(Invoice_No_Caption; Invoice_No_CaptionLbl)
                        {
                        }
                        column(Amount_PaidCaption; Amount_PaidCaptionLbl)
                        {
                        }
                        column(Vendor_No_Caption; Vendor_No_CaptionLbl)
                        {
                        }
                        column(Vendor_NameCaption; Vendor_NameCaptionLbl)
                        {
                        }
                        column(Fax_No_Caption; Fax_No_CaptionLbl)
                        {
                        }
                        column(Original_AmountCaption; Original_AmountCaptionLbl)
                        {
                        }
                        column(TotalCaption; TotalCaptionLbl)
                        {
                        }
                        column(Vendor_Ledger_Entry_Entry_No_; "Entry No.")
                        {
                        }
                        column(Vendor_Ledger_Entry_Currency_Code; "Currency Code")
                        {
                        }
                        column(Invoice_Date; FORMAT(DataItem4114."Posting Date", 0, '<Day> <Month text,3> <Year4>'))
                        {
                        }
                        column(External_Doc_No; DataItem4114."External Document No.")
                        {
                        }
                        column(Invoice_Number; DataItem4114."Document No.")
                        {
                        }
                        column(Amount_To_Apply; DataItem4114."Amount to Apply")
                        {
                        }
                        column(Remaining_Amount; DataItem4114."Remaining Amount")
                        {
                        }
                        column(Invoice_Amount; DataItem4114.Amount)
                        {
                        }
                        column(gvWHTAmt; gvWHTAmt)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            IF "Vendor No." <> '' THEN BEGIN
                                VendorName := '';
                                VendFaxNo := '';
                                VendRec.RESET;
                                VendRec.GET("Vendor No.");
                                VendorName := VendRec.Name;
                                VendFaxNo := VendRec."Fax No.";
                                FormatAddr.Vendor(VendAddr, VendRec);
                            END;

                            CALCFIELDS("Remaining Amount");
                            IF "Remaining Amount" = 0 THEN
                                RemainingAmount := 0;

                            // CAREPOINT1.00 2015-10-14 Start:
                            IF NOT DataItem7024."Skip WHT" THEN BEGIN
                                IF NOT VendRec."Foreign Vend" THEN BEGIN // CAREPOINT1.00 2016-01-21
                                    WHTEntry.RESET;
                                    WHTEntry.SETRANGE("Document No.", "Document No.");
                                    WHTEntry.SETRANGE("Document Type", "Document Type");
                                    IF WHTEntry.FINDFIRST THEN
                                        gvWHTAmt := WHTEntry."Remaining Unrealized Amount";
                                END;
                            END;
                            // CAREPOINT1.00 2015-10-14 End:
                            //>>#CAREPOINT1.00 ASAL 15thJULY2010
                            //>>Block Existing Code which Amount is from "Remianing Amount: from
                            //>>Vendor Ledger Entry
                            /*
                            IF  (("Remaining Amount" < 0) OR ("Remaining Amount" > 0)) AND ("Remaining Amount" <> 0)THEN
                                RemainingAmount := -("Remaining Amount");
                            */
                            //<<#CAREPOINT1.00 ASAL 15thJULY2010

                            //>>#CAREPOINT1.00 ASAL 15thJULY2010
                            //>>Amount in Design Section Value is from field name "Amount to Apply" from
                            //>>Vendor Ledger Entry
                            IF (("Amount to Apply" < 0) OR ("Amount to Apply" > 0)) AND ("Amount to Apply" <> 0) THEN
                                RemainingAmount := -("Amount to Apply");
                            //<<#CAREPOINT1.00 ASAL 15thJULY2010

                        end;
                    }
                    dataitem(DimensionLoop; "Integer")
                    {
                        DataItemTableView = SORTING (Number)
                                            WHERE (Number = FILTER (1 ..));
                        column(DimText; DimText)
                        {
                        }
                        column(DimensionLoop_Number; DimensionLoop.Number)
                        {
                        }
                        column(DimText_Control55; DimText)
                        {
                        }
                        column(DimensionsCaption; DimensionsCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            IF Number = 1 THEN BEGIN
                                //IF NOT JnlLineDim.FIND('-') THEN
                                //  CurrReport.BREAK;
                            END ELSE
                                IF NOT Continue THEN
                                    CurrReport.BREAK;

                            CLEAR(DimText);
                            Continue := FALSE;

                            /*
                            REPEAT
                              OldDimText := DimText;
                              IF DimText = '' THEN
                                DimText := STRSUBSTNO('%1 - %2',JnlLineDim."Dimension Code",JnlLineDim."Dimension Value Code")
                              ELSE
                                DimText :=
                                  STRSUBSTNO(
                                    '%1; %2 - %3',DimText,JnlLineDim."Dimension Code",JnlLineDim."Dimension Value Code");
                              IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                DimText := OldDimText;
                                Continue := TRUE;
                                EXIT;
                              END;
                            UNTIL (JnlLineDim.NEXT = 0);
                            */

                        end;

                        trigger OnPreDataItem()
                        begin
                            IF NOT ShowDim THEN
                                CurrReport.BREAK;
                            //JnlLineDim.SETRANGE("Table ID",DATABASE::DataItem7024);
                            //JnlLineDim.SETRANGE("Journal Template Name",DataItem7024."Journal Template Name");
                            //JnlLineDim.SETRANGE("Journal Batch Name",DataItem7024."Journal Batch Name");
                            //JnlLineDim.SETRANGE("Journal Line No.",DataItem7024."Line No.");
                        end;
                    }
                    dataitem(ErrorLoop; "Integer")
                    {
                        DataItemTableView = SORTING (Number);

                        trigger OnPostDataItem()
                        begin
                            ErrorCounter := 0;
                        end;

                        trigger OnPreDataItem()
                        begin
                            IF ISSERVICETIER THEN BEGIN
                                AmountLCY := 0;
                                BalanceLCY := 0;
                            END;

                            SETRANGE(Number, 1, ErrorCounter);
                        end;
                    }

                    trigger OnAfterGetRecord()
                    var
                        PaymentTerms: Record "Payment Terms";
                        DimMgt: Codeunit "DimensionManagement";
                        TableID: array[10] of Integer;
                        No: array[10] of Code[20];
                        VendorRec2: Record "Vendor";
                        GenJnlLine: Record "Gen. Journal Line";
                    begin
                        IF VendorRec2.GET(DataItem7024."Account No.") THEN

                            IF "Currency Code" = '' THEN
                                "Amount (LCY)" := Amount;

                        UpdateLineBalance;

                        AccName := '';
                        BalAccName := '';
                        GenJnlLine := DataItem7024;
                        IF NOT EmptyLine THEN BEGIN
                            MakeRecurringTexts(DataItem7024);

                            AmountError := FALSE;

                            IF ("Account No." = '') AND ("Bal. Account No." = '') THEN
                                AddError(STRSUBSTNO(Text001, FIELDCAPTION("Account No."), FIELDCAPTION("Bal. Account No.")))
                            ELSE
                                IF ("Account Type" <> "Account Type"::"Fixed Asset") AND
                                   ("Bal. Account Type" <> "Bal. Account Type"::"Fixed Asset")
                                THEN
                                    TestFixedAssetFields(DataItem7024);
                            CheckICDocument;
                            IF "Account No." <> '' THEN
                                CASE "Account Type" OF
                                    "Account Type"::"G/L Account":
                                        BEGIN
                                            IF ("Gen. Bus. Posting Group" <> '') OR ("Gen. Prod. Posting Group" <> '') OR
                                               ("VAT Bus. Posting Group" <> '') OR ("VAT Prod. Posting Group" <> '')
                                            THEN BEGIN
                                                IF "Gen. Posting Type" = 0 THEN
                                                    AddError(STRSUBSTNO(Text002, FIELDCAPTION("Gen. Posting Type")));
                                            END;
                                            IF ("Gen. Posting Type" <> "Gen. Posting Type"::" ") AND
                                               ("VAT Posting" = "VAT Posting"::"Automatic VAT Entry")
                                            THEN BEGIN
                                                IF "VAT Amount" + "VAT Base Amount" <> Amount THEN
                                                    AddError(
                                                      STRSUBSTNO(
                                                        Text003, FIELDCAPTION("VAT Amount"), FIELDCAPTION("VAT Base Amount"),
                                                        FIELDCAPTION(Amount)));
                                                IF "Currency Code" <> '' THEN
                                                    IF "VAT Amount (LCY)" + "VAT Base Amount (LCY)" <> "Amount (LCY)" THEN
                                                        AddError(
                                                          STRSUBSTNO(
                                                            Text003, FIELDCAPTION("VAT Amount (LCY)"),
                                                            FIELDCAPTION("VAT Base Amount (LCY)"), FIELDCAPTION("Amount (LCY)")));
                                            END;
                                            TestJobFields(DataItem7024);
                                        END;
                                    "Account Type"::Customer, "Account Type"::Vendor:
                                        BEGIN
                                            IF "Gen. Posting Type" <> 0 THEN BEGIN
                                                AddError(
                                                  STRSUBSTNO(
                                                    Text004,
                                                    FIELDCAPTION("Gen. Posting Type"), FIELDCAPTION("Account Type"), "Account Type"));
                                            END;
                                            IF ("Gen. Bus. Posting Group" <> '') OR ("Gen. Prod. Posting Group" <> '') OR
                                               ("VAT Bus. Posting Group" <> '') OR ("VAT Prod. Posting Group" <> '')
                                            THEN
                                                AddError(
                                                  STRSUBSTNO(
                                                    Text005,
                                                    FIELDCAPTION("Gen. Bus. Posting Group"), FIELDCAPTION("Gen. Prod. Posting Group"),
                                                    FIELDCAPTION("VAT Bus. Posting Group"), FIELDCAPTION("VAT Prod. Posting Group"),
                                                    FIELDCAPTION("Account Type"), "Account Type"));

                                            IF "Document Type" <> 0 THEN BEGIN
                                                IF "Account Type" = "Account Type"::Customer THEN
                                                    CASE "Document Type" OF
                                                        "Document Type"::"Credit Memo":
                                                            WarningIfPositiveAmt(DataItem7024);
                                                        "Document Type"::Payment:
                                                            IF ("Applies-to Doc. Type" = "Applies-to Doc. Type"::"Credit Memo") AND
                                                               ("Applies-to Doc. No." <> '')
                                                            THEN
                                                                WarningIfNegativeAmt(DataItem7024)
                                                            ELSE
                                                                WarningIfPositiveAmt(DataItem7024);
                                                        "Document Type"::Refund:
                                                            WarningIfNegativeAmt(DataItem7024);
                                                        ELSE
                                                            WarningIfNegativeAmt(DataItem7024);
                                                    END
                                                ELSE
                                                    CASE "Document Type" OF
                                                        "Document Type"::"Credit Memo":
                                                            WarningIfNegativeAmt(DataItem7024);
                                                        "Document Type"::Payment:
                                                            IF ("Applies-to Doc. Type" = "Applies-to Doc. Type"::"Credit Memo") AND
                                                               ("Applies-to Doc. No." <> '')
                                                            THEN
                                                                WarningIfPositiveAmt(DataItem7024)
                                                            ELSE
                                                                WarningIfNegativeAmt(DataItem7024);
                                                        "Document Type"::Refund:
                                                            WarningIfPositiveAmt(DataItem7024);
                                                        ELSE
                                                            WarningIfPositiveAmt(DataItem7024);
                                                    END
                                            END;

                                            IF Amount * "Sales/Purch. (LCY)" < 0 THEN
                                                AddError(
                                                  STRSUBSTNO(
                                                    Text008,
                                                    FIELDCAPTION("Sales/Purch. (LCY)"), FIELDCAPTION(Amount)));
                                            IF "Job No." <> '' THEN
                                                AddError(STRSUBSTNO(Text009, FIELDCAPTION("Job No.")));
                                        END;
                                    "Account Type"::"Bank Account":
                                        BEGIN
                                            IF "Gen. Posting Type" <> 0 THEN BEGIN
                                                AddError(
                                                  STRSUBSTNO(
                                                    Text004,
                                                    FIELDCAPTION("Gen. Posting Type"), FIELDCAPTION("Account Type"), "Account Type"));
                                            END;
                                            IF ("Gen. Bus. Posting Group" <> '') OR ("Gen. Prod. Posting Group" <> '') OR
                                               ("VAT Bus. Posting Group" <> '') OR ("VAT Prod. Posting Group" <> '')
                                            THEN
                                                AddError(
                                                  STRSUBSTNO(
                                                    Text005,
                                                    FIELDCAPTION("Gen. Bus. Posting Group"), FIELDCAPTION("Gen. Prod. Posting Group"),
                                                    FIELDCAPTION("VAT Bus. Posting Group"), FIELDCAPTION("VAT Prod. Posting Group"),
                                                    FIELDCAPTION("Account Type"), "Account Type"));

                                            IF "Job No." <> '' THEN
                                                AddError(STRSUBSTNO(Text009, FIELDCAPTION("Job No.")));
                                            IF (Amount < 0) AND ("Bank Payment Type" = "Bank Payment Type"::"Computer Check") THEN
                                                IF NOT "Check Printed" THEN
                                                    AddError(STRSUBSTNO(Text010, FIELDCAPTION("Check Printed")));
                                        END;
                                    "Account Type"::"Fixed Asset":
                                        TestFixedAsset(DataItem7024);
                                END;

                            IF "Bal. Account No." <> '' THEN
                                CASE "Bal. Account Type" OF
                                    "Bal. Account Type"::"G/L Account":
                                        BEGIN
                                            IF ("Bal. Gen. Bus. Posting Group" <> '') OR ("Bal. Gen. Prod. Posting Group" <> '') OR
                                               ("Bal. VAT Bus. Posting Group" <> '') OR ("Bal. VAT Prod. Posting Group" <> '')
                                            THEN BEGIN
                                                IF "Bal. Gen. Posting Type" = 0 THEN
                                                    AddError(STRSUBSTNO(Text002, FIELDCAPTION("Bal. Gen. Posting Type")));
                                            END;
                                            IF ("Bal. Gen. Posting Type" <> "Bal. Gen. Posting Type"::" ") AND
                                               ("VAT Posting" = "VAT Posting"::"Automatic VAT Entry")
                                            THEN BEGIN
                                                IF "Bal. VAT Amount" + "Bal. VAT Base Amount" <> -Amount THEN
                                                    AddError(
                                                      STRSUBSTNO(
                                                        Text011, FIELDCAPTION("Bal. VAT Amount"), FIELDCAPTION("Bal. VAT Base Amount"),
                                                        FIELDCAPTION(Amount)));
                                                IF "Currency Code" <> '' THEN
                                                    IF "Bal. VAT Amount (LCY)" + "Bal. VAT Base Amount (LCY)" <> -"Amount (LCY)" THEN
                                                        AddError(
                                                          STRSUBSTNO(
                                                            Text011, FIELDCAPTION("Bal. VAT Amount (LCY)"),
                                                            FIELDCAPTION("Bal. VAT Base Amount (LCY)"), FIELDCAPTION("Amount (LCY)")));
                                            END;
                                        END;
                                    "Bal. Account Type"::Customer, "Bal. Account Type"::Vendor:
                                        BEGIN
                                            IF "Bal. Gen. Posting Type" <> 0 THEN BEGIN
                                                AddError(
                                                  STRSUBSTNO(
                                                    Text004,
                                                    FIELDCAPTION("Bal. Gen. Posting Type"), FIELDCAPTION("Bal. Account Type"), "Bal. Account Type"));
                                            END;
                                            IF ("Bal. Gen. Bus. Posting Group" <> '') OR ("Bal. Gen. Prod. Posting Group" <> '') OR
                                               ("Bal. VAT Bus. Posting Group" <> '') OR ("Bal. VAT Prod. Posting Group" <> '')
                                            THEN
                                                AddError(
                                                  STRSUBSTNO(
                                                    Text005,
                                                    FIELDCAPTION("Bal. Gen. Bus. Posting Group"), FIELDCAPTION("Bal. Gen. Prod. Posting Group"),
                                                    FIELDCAPTION("Bal. VAT Bus. Posting Group"), FIELDCAPTION("Bal. VAT Prod. Posting Group"),
                                                    FIELDCAPTION("Bal. Account Type"), "Bal. Account Type"));

                                            IF "Document Type" <> 0 THEN BEGIN
                                                IF ("Bal. Account Type" = "Bal. Account Type"::Customer) =
                                                   ("Document Type" IN ["Document Type"::Payment, "Document Type"::"Credit Memo"])
                                                THEN
                                                    WarningIfNegativeAmt(DataItem7024)
                                                ELSE
                                                    WarningIfPositiveAmt(DataItem7024)
                                            END;
                                            IF Amount * "Sales/Purch. (LCY)" > 0 THEN
                                                AddError(
                                                  STRSUBSTNO(
                                                    Text012,
                                                    FIELDCAPTION("Sales/Purch. (LCY)"), FIELDCAPTION(Amount)));
                                            IF "Job No." <> '' THEN
                                                AddError(STRSUBSTNO(Text009, FIELDCAPTION("Job No.")));
                                        END;
                                    "Bal. Account Type"::"Bank Account":
                                        BEGIN
                                            IF "Bal. Gen. Posting Type" <> 0 THEN BEGIN
                                                AddError(
                                                  STRSUBSTNO(
                                                    Text004,
                                                    FIELDCAPTION("Bal. Gen. Posting Type"), FIELDCAPTION("Bal. Account Type"), "Bal. Account Type"));
                                            END;
                                            IF ("Bal. Gen. Bus. Posting Group" <> '') OR ("Bal. Gen. Prod. Posting Group" <> '') OR
                                               ("Bal. VAT Bus. Posting Group" <> '') OR ("Bal. VAT Prod. Posting Group" <> '')
                                            THEN
                                                AddError(
                                                  STRSUBSTNO(
                                                    Text005,
                                                    FIELDCAPTION("Bal. Gen. Bus. Posting Group"), FIELDCAPTION("Bal. Gen. Prod. Posting Group"),
                                                    FIELDCAPTION("Bal. VAT Bus. Posting Group"), FIELDCAPTION("Bal. VAT Prod. Posting Group"),
                                                    FIELDCAPTION("Bal. Account Type"), "Bal. Account Type"));

                                            IF "Job No." <> '' THEN
                                                AddError(STRSUBSTNO(Text009, FIELDCAPTION("Job No.")));
                                            IF (Amount > 0) AND ("Bank Payment Type" = "Bank Payment Type"::"Computer Check") THEN
                                                IF NOT "Check Printed" THEN
                                                    AddError(STRSUBSTNO(Text010, FIELDCAPTION("Check Printed")));
                                        END;
                                    "Bal. Account Type"::"Fixed Asset":
                                        TestFixedAsset(DataItem7024);
                                END;

                            IF ("Account No." <> '') AND
                               NOT "System-Created Entry" AND
                               ("Gen. Posting Type" = "Gen. Posting Type"::" ") AND
                               (Amount = 0) AND
                               NOT GenJnlTemplate.Recurring AND
                               NOT "Allow Zero-Amount Posting" AND
                               ("Account Type" <> "Account Type"::"Fixed Asset")
                            THEN
                                WarningIfZeroAmt(DataItem7024);

                            CheckRecurringLine(DataItem7024);
                            CheckAllocations(DataItem7024);

                            IF "Posting Date" = 0D THEN
                                AddError(STRSUBSTNO(Text002, FIELDCAPTION("Posting Date")))
                            ELSE BEGIN
                                IF "Posting Date" <> NORMALDATE("Posting Date") THEN
                                    IF ("Account Type" <> "Account Type"::"G/L Account") OR
                                       ("Bal. Account Type" <> "Bal. Account Type"::"G/L Account")
                                    THEN
                                        AddError(
                                          STRSUBSTNO(
                                            Text013, FIELDCAPTION("Posting Date")));

                                IF (AllowPostingFrom = 0D) AND (AllowPostingTo = 0D) THEN BEGIN
                                    IF USERID <> '' THEN
                                        IF UserSetup.GET(USERID) THEN BEGIN
                                            AllowPostingFrom := UserSetup."Allow Posting From";
                                            AllowPostingTo := UserSetup."Allow Posting To";
                                        END;
                                    IF (AllowPostingFrom = 0D) AND (AllowPostingTo = 0D) THEN BEGIN
                                        AllowPostingFrom := GLSetup."Allow Posting From";
                                        AllowPostingTo := GLSetup."Allow Posting To";
                                    END;
                                    IF AllowPostingTo = 0D THEN
                                        AllowPostingTo := 99991231D;
                                END;
                                IF ("Posting Date" < AllowPostingFrom) OR ("Posting Date" > AllowPostingTo) THEN
                                    AddError(
                                      STRSUBSTNO(
                                        Text014, FORMAT("Posting Date")));

                                IF DataItem3502."No. Series" <> '' THEN BEGIN
                                    IF NoSeries."Date Order" AND ("Posting Date" < LastEntrdDate) THEN
                                        AddError(Text015);
                                    LastEntrdDate := "Posting Date";
                                END;
                            END;

                            IF ("Document Date" <> 0D) THEN
                                IF ("Document Date" <> NORMALDATE("Document Date")) AND
                                   (("Account Type" <> "Account Type"::"G/L Account") OR
                                    ("Bal. Account Type" <> "Bal. Account Type"::"G/L Account"))
                                THEN
                                    AddError(
                                      STRSUBSTNO(
                                        Text013, FIELDCAPTION("Document Date")));

                            IF "Document No." = '' THEN
                                AddError(STRSUBSTNO(Text002, FIELDCAPTION("Document No.")))
                            ELSE
                                IF DataItem3502."No. Series" <> '' THEN BEGIN
                                    IF (LastEntrdDocNo <> '') AND
                                       ("Document No." <> LastEntrdDocNo) AND
                                       ("Document No." <> INCSTR(LastEntrdDocNo))
                                    THEN
                                        AddError(Text016);
                                    LastEntrdDocNo := "Document No.";
                                END;

                            IF ("Account Type" IN ["Account Type"::Customer, "Account Type"::Vendor, "Account Type"::"Fixed Asset"]) AND
                               ("Bal. Account Type" IN ["Bal. Account Type"::Customer, "Bal. Account Type"::Vendor, "Bal. Account Type"::"Fixed Asset"])
                            THEN
                                AddError(
                                  STRSUBSTNO(
                                    Text017,
                                    FIELDCAPTION("Account Type"), FIELDCAPTION("Bal. Account Type")));

                            IF Amount * "Amount (LCY)" < 0 THEN
                                AddError(
                                  STRSUBSTNO(
                                    Text008, FIELDCAPTION("Amount (LCY)"), FIELDCAPTION(Amount)));

                            IF ("Account Type" = "Account Type"::"G/L Account") AND
                               ("Bal. Account Type" = "Bal. Account Type"::"G/L Account")
                            THEN
                                IF "Applies-to Doc. No." <> '' THEN
                                    AddError(STRSUBSTNO(Text009, FIELDCAPTION("Applies-to Doc. No.")));

                            IF (("Account Type" = "Account Type"::"G/L Account") AND
                                ("Bal. Account Type" = "Bal. Account Type"::"G/L Account")) OR
                               ("Document Type" <> "Document Type"::Invoice)
                            THEN BEGIN
                                IF PaymentTerms.GET("Payment Terms Code") THEN BEGIN
                                    IF ("Document Type" = "Document Type"::"Credit Memo") AND
                                      (NOT PaymentTerms."Calc. Pmt. Disc. on Cr. Memos")
                                    THEN BEGIN
                                        IF "Pmt. Discount Date" <> 0D THEN
                                            AddError(STRSUBSTNO(Text009, FIELDCAPTION("Pmt. Discount Date")));
                                        IF "Payment Discount %" <> 0 THEN
                                            AddError(STRSUBSTNO(Text018, FIELDCAPTION("Payment Discount %")));
                                    END;
                                END ELSE BEGIN
                                    IF "Pmt. Discount Date" <> 0D THEN
                                        AddError(STRSUBSTNO(Text009, FIELDCAPTION("Pmt. Discount Date")));
                                    IF "Payment Discount %" <> 0 THEN
                                        AddError(STRSUBSTNO(Text018, FIELDCAPTION("Payment Discount %")));
                                END;
                            END;

                            IF (("Account Type" = "Account Type"::"G/L Account") AND
                                ("Bal. Account Type" = "Bal. Account Type"::"G/L Account")) OR
                               ("Applies-to Doc. No." <> '')
                            THEN
                                IF "Applies-to ID" <> '' THEN
                                    AddError(STRSUBSTNO(Text009, FIELDCAPTION("Applies-to ID")));

                            IF ("Account Type" <> "Account Type"::"Bank Account") AND
                               ("Bal. Account Type" <> "Bal. Account Type"::"Bank Account")
                            THEN
                                IF GenJnlLine2."Bank Payment Type" > 0 THEN
                                    AddError(STRSUBSTNO(Text009, FIELDCAPTION("Bank Payment Type")));

                            IF ("Account No." <> '') AND ("Bal. Account No." <> '') THEN BEGIN
                                PurchPostingType := FALSE;
                                SalesPostingType := FALSE;
                            END;
                            IF "Account No." <> '' THEN
                                CASE "Account Type" OF
                                    "Account Type"::"G/L Account":
                                        CheckGLAcc(DataItem7024, AccName);
                                    "Account Type"::Customer:
                                        CheckCust(DataItem7024, AccName);
                                    "Account Type"::Vendor:
                                        CheckVend(DataItem7024, AccName);
                                    "Account Type"::"Bank Account":
                                        CheckBankAcc(DataItem7024, AccName);
                                    "Account Type"::"Fixed Asset":
                                        CheckFixedAsset(DataItem7024, AccName);
                                    "Account Type"::"IC Partner":
                                        CheckICPartner(DataItem7024, AccName);
                                END;
                            IF "Bal. Account No." <> '' THEN BEGIN
                                ExchAccGLJnlLine.RUN(DataItem7024);
                                CASE "Account Type" OF
                                    "Account Type"::"G/L Account":
                                        CheckGLAcc(DataItem7024, BalAccName);
                                    "Account Type"::Customer:
                                        CheckCust(DataItem7024, BalAccName);
                                    "Account Type"::Vendor:
                                        CheckVend(DataItem7024, BalAccName);
                                    "Account Type"::"Bank Account":
                                        CheckBankAcc(DataItem7024, BalAccName);
                                    "Account Type"::"Fixed Asset":
                                        CheckFixedAsset(DataItem7024, BalAccName);
                                    "Account Type"::"IC Partner":
                                        CheckICPartner(DataItem7024, AccName);
                                END;
                                ExchAccGLJnlLine.RUN(DataItem7024);
                            END;
                            //HBSML>>
                            /*
                            JnlLineDim.SETRANGE("Table ID",DATABASE::DataItem7024);
                            JnlLineDim.SETRANGE("Journal Template Name","Journal Template Name");
                            JnlLineDim.SETRANGE("Journal Batch Name","Journal Batch Name");
                            JnlLineDim.SETRANGE("Journal Line No.","Line No.");
                            IF NOT DimMgt.CheckJnlLineDimComb(JnlLineDim) THEN
                              AddError(DimMgt.GetDimCombErr);

                            TableID[1] := DimMgt.TypeToTableID1("Account Type");
                            No[1] := "Account No.";
                            TableID[2] := DimMgt.TypeToTableID1("Bal. Account Type");
                            No[2] := "Bal. Account No.";
                            TableID[3] := DATABASE::Job;
                            No[3] := "Job No.";
                            TableID[4] := DATABASE::"Salesperson/Purchaser";
                            No[4] := "Salespers./Purch. Code";
                            TableID[5] := DATABASE::Campaign;
                            No[5] := "Campaign No.";
                            IF NOT DimMgt.CheckJnlLineDimValuePosting(JnlLineDim,TableID,No) THEN
                              AddError(DimMgt.GetDimValuePostingErr);
                          */
                            //HBSML<<

                        END;
                        WHTAmount := 0;

                        IF "Account Type" = "Account Type"::Customer THEN BEGIN
                            MYGenJnlLine.COPY(DataItem7024);
                            IF (NOT "Skip WHT") THEN BEGIN
                                IF WHTPostingSetup.GET(
                                    MYGenJnlLine."WHT Business Posting Group",
                                    MYGenJnlLine."WHT Product Posting Group")
                                THEN BEGIN
                                    //IF (WHTPostingSetup."Realized WHT Type" = WHTPostingSetup."Realized WHT Type"::Payment) THEN
                                    //    WHTAmount := WHTManagement.ApplyCustCalcWHT(MYGenJnlLine);
                                    //IF (WHTPostingSetup."Realized WHT Type" = WHTPostingSetup."Realized WHT Type"::Earliest) THEN
                                    //   WHTAmount := ABS(WHTManagement.CalcCustExtraWHTForEarliest(MYGenJnlLine));
                                    IF (WHTPostingSetup."Realized WHT Type" = WHTPostingSetup."Realized WHT Type"::Invoice) THEN BEGIN
                                        IF (MYGenJnlLine."WHT Absorb Base" <> 0) THEN
                                            WHTAmount := MYGenJnlLine."WHT Absorb Base" * WHTPostingSetup."WHT %" / 100
                                        ELSE
                                            WHTAmount := MYGenJnlLine.Amount * WHTPostingSetup."WHT %" / 100;
                                    END;
                                END;
                                TotalWHTAmount := TotalWHTAmount + WHTAmount;
                            END;
                        END ELSE
                            IF "Account Type" = "Account Type"::Vendor THEN BEGIN
                                MYGenJnlLine.COPY(DataItem7024);
                                IF (NOT "Skip WHT") THEN BEGIN
                                    IF WHTPostingSetup.GET(
                                      MYGenJnlLine."WHT Business Posting Group",
                                      MYGenJnlLine."WHT Product Posting Group")
                                    THEN BEGIN
                                        IF (WHTPostingSetup."Realized WHT Type" = WHTPostingSetup."Realized WHT Type"::Payment) THEN
                                            WHTAmount := WHTManagement.WHTAmountJournal(MYGenJnlLine, FALSE);
                                        IF (WHTPostingSetup."Realized WHT Type" = WHTPostingSetup."Realized WHT Type"::Earliest) THEN
                                            WHTAmount := ABS(WHTManagement.CalcVendExtraWHTForEarliest(MYGenJnlLine));
                                        IF (WHTPostingSetup."Realized WHT Type" = WHTPostingSetup."Realized WHT Type"::Invoice) THEN BEGIN
                                            IF (MYGenJnlLine."WHT Absorb Base" <> 0) THEN
                                                WHTAmount := ABS(MYGenJnlLine."WHT Absorb Base" * WHTPostingSetup."WHT %" / 100)
                                            ELSE
                                                WHTAmount := ABS(MYGenJnlLine.Amount * WHTPostingSetup."WHT %" / 100);
                                        END;
                                    END;
                                    TotalWHTAmount := TotalWHTAmount + WHTAmount;
                                END;
                            END;
                        CheckBalance;
                        IF ISSERVICETIER THEN BEGIN
                            AmountLCY := DataItem7024."Amount (LCY)";
                            BalanceLCY := DataItem7024."Balance (LCY)";
                        END;
                        gvWHTAmt := 0;

                    end;

                    trigger OnPreDataItem()
                    begin
                        IF ISSERVICETIER THEN BEGIN
                            DataItem7024.COPYFILTER("Journal Template Name", DataItem3502."Journal Template Name");
                            DataItem7024.COPYFILTER(DataItem7024."Journal Batch Name", DataItem3502.Name);
                            GenJnlLineFilter := DataItem7024.GETFILTERS;
                        END;
                        GenJnlTemplate.GET(DataItem3502."Journal Template Name");
                        IF GenJnlTemplate.Recurring THEN BEGIN
                            IF GETFILTER("Posting Date") <> '' THEN
                                AddError(
                                  STRSUBSTNO(
                                    Text000,
                                    FIELDCAPTION("Posting Date")));
                            SETRANGE("Posting Date", 0D, WORKDATE);
                            IF GETFILTER("Expiration Date") <> '' THEN
                                AddError(
                                  STRSUBSTNO(
                                    Text000,
                                    FIELDCAPTION("Expiration Date")));
                            SETFILTER("Expiration Date", '%1 | %2..', 0D, WORKDATE);
                        END;

                        IF DataItem3502."No. Series" <> '' THEN BEGIN
                            NoSeries.GET(DataItem3502."No. Series");
                            LastEntrdDocNo := '';
                            LastEntrdDate := 0D;
                        END;

                        CurrentCustomerVendors := 0;
                        VATEntryCreated := FALSE;

                        GenJnlLine2.RESET;
                        GenJnlLine2.COPYFILTERS(DataItem7024);

                        GLAccNetChange.DELETEALL;
                        CurrReport.CREATETOTALS("Amount (LCY)", "Balance (LCY)");
                    end;
                }
                dataitem(ReconcileLoop; "Integer")
                {
                    DataItemTableView = SORTING (Number);

                    trigger OnAfterGetRecord()
                    begin
                        IF Number = 1 THEN
                            GLAccNetChange.FIND('-')
                        ELSE
                            GLAccNetChange.NEXT;
                    end;

                    trigger OnPostDataItem()
                    begin
                        GLAccNetChange.DELETEALL;
                    end;

                    trigger OnPreDataItem()
                    begin
                        SETRANGE(Number, 1, GLAccNetChange.COUNT);
                    end;
                }
            }

            trigger OnAfterGetRecord()
            begin
                CurrReport.PAGENO := 1;
            end;

            trigger OnPreDataItem()
            begin
                GLSetup.GET;
                SalesSetup.GET;
                PurchSetup.GET;
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
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(ShowDim; ShowDim)
                    {
                        Caption = 'Show Dimensions';
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
        IF ISSERVICETIER THEN BEGIN
            DataItem7024.COPYFILTER("Journal Template Name", DataItem3502."Journal Template Name");
            DataItem7024.COPYFILTER(DataItem7024."Journal Batch Name", DataItem3502.Name);
        END;
        GenJnlLineFilter := DataItem7024.GETFILTERS;
    end;

    var
        Text000: Label '%1 cannot be filtered when you post recurring journals.';
        Text001: Label '%1 or %2 must be specified.';
        Text002: Label '%1 must be specified.';
        Text003: Label '%1 + %2 must be %3.';
        Text004: Label '%1 must be " " when %2 is %3.';
        Text005: Label '%1, %2, %3 or %4 must not be completed when %5 is %6.';
        Text006: Label '%1 must be negative.';
        Text007: Label '%1 must be positive.';
        Text008: Label '%1 must have the same sign as %2.';
        Text009: Label '%1 cannot be specified.';
        Text010: Label '%1 must be Yes.';
        Text011: Label '%1 + %2 must be -%3.';
        Text012: Label '%1 must have a different sign than %2.';
        Text013: Label '%1 must only be a closing date for G/L entries.';
        Text014: Label '%1 is not within your allowed range of posting dates.';
        Text015: Label 'The lines are not listed according to Posting Date because they were not entered in that order.';
        Text016: Label 'There is a gap in the number series.';
        Text017: Label '%1 or %2 must be G/L Account or Bank Account.';
        Text018: Label '%1 must be 0.';
        Text019: Label '%1 cannot be specified when using recurring journals.';
        Text020: Label '%1 must not be %2 when %3 = %4.';
        Text021: Label 'Allocations can only be used with recurring journals.';
        Text022: Label 'Please specify %1 in the %2 allocation lines.';
        Text023: Label '<Month Text>';
        Text024: Label '%1 %2 posted on %3, must be separated by an empty line';
        Text025: Label '%1 %2 is out of balance by %3.';
        Text026: Label 'The reversing entries for %1 %2 are out of balance by %3.';
        Text027: Label 'As of %1, the lines are out of balance by %2.';
        Text028: Label 'As of %1, the reversing entries are out of balance by %2.';
        Text029: Label 'The total of the lines is out of balance by %1.';
        Text030: Label 'The total of the reversing entries is out of balance by %1.';
        Text031: Label '%1 %2 does not exist.';
        Text032: Label '%1 must be %2 for %3 %4.';
        Text036: Label '%1 %2 %3 does not exist.';
        Text037: Label '%1 must be %2.';
        Text038: Label 'The currency %1 cannot be found. Please check the currency table.';
        Text039: Label 'Sales %1 %2 already exists.';
        Text040: Label 'Purchase %1 %2 already exists.';
        Text041: Label '%1 must be entered.';
        Text042: Label '%1 must not be filled when %2 is different in %3 and %4.';
        Text043: Label '%1 %2 must not have %3 = %4.';
        Text044: Label '%1 must not be specified in fixed asset journal lines.';
        Text045: Label '%1 must be specified in fixed asset journal lines.';
        Text046: Label '%1 must be different than %2.';
        Text047: Label '%1 and %2 must not both be %3.';
        Text048: Label '%1  must not be specified when %2 = %3.';
        Text049: Label '%1 must not be specified when %2 = %3.';
        Text050: Label 'must not be specified together with %1 = %2.';
        Text051: Label '%1 must be identical to %2.';
        Text052: Label '%1 cannot be a closing date.';
        Text053: Label '%1 is not within your range of allowed posting dates.';
        Text054: Label 'Insurance integration is not activated for %1 %2.';
        Text055: Label 'must not be specified when %1 is specified.';
        Text056: Label 'When G/L integration is not activated, %1 must not be posted in the general journal.';
        Text057: Label 'When G/L integration is not activated, %1 must not be specified in the general journal.';
        Text058: Label '%1 must not be specified.';
        Text059: Label 'The combination of Customer and Gen. Posting Type Purchase is not allowed.';
        Text060: Label 'The combination of Vendor and Gen. Posting Type Sales is not allowed.';
        Text061: Label 'The Balance and Reversing Balance recurring methods can be used only with Allocations.';
        Text062: Label '%1 must not be 0.';
        GLSetup: Record "General Ledger Setup";
        SalesSetup: Record "Sales & Receivables Setup";
        PurchSetup: Record "Purchases & Payables Setup";
        UserSetup: Record "User Setup";
        AccountingPeriod: Record "Accounting Period";
        GLAcc: Record "G/L Account";
        Currency: Record "Currency";
        Cust: Record "Customer";
        Vend: Record "Vendor";
        BankAccPostingGr: Record "Bank Account Posting Group";
        BankAcc: Record "Bank Account";
        GenJnlTemplate: Record "Gen. Journal Template";
        GenJnlLine2: Record "Gen. Journal Line";
        TempGenJnlLine: Record "Gen. Journal Line" temporary;
        TempGenJnlLine2: Record "Gen. Journal Line" temporary;
        GenJnlAlloc: Record "Gen. Jnl. Allocation";
        OldCustLedgEntry: Record "Cust. Ledger Entry";
        OldVendLedgEntry: Record "Vendor Ledger Entry";
        VATPostingSetup: Record "VAT Posting Setup";
        NoSeries: Record "No. Series";
        FA: Record "Fixed Asset";
        ICPartner: Record "IC Partner";
        DeprBook: Record "Depreciation Book";
        FADeprBook: Record "FA Depreciation Book";
        FASetup: Record "FA Setup";
        GLAccNetChange: Record "G/L Account Net Change" temporary;
        FormatAddr: Codeunit "Format Address";
        ExchAccGLJnlLine: Codeunit "Exchange Acc. G/L Journal Line";
        GenJnlLineFilter: Text[250];
        AllowPostingFrom: Date;
        AllowPostingTo: Date;
        AllowFAPostingFrom: Date;
        AllowFAPostingTo: Date;
        LastDate: Date;
        LastDocType: Option Document,Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder;
        LastDocNo: Code[20];
        LastEntrdDocNo: Code[20];
        LastEntrdDate: Date;
        BalanceLCY: Decimal;
        AmountLCY: Decimal;
        DocBalance: Decimal;
        DocBalanceReverse: Decimal;
        DateBalance: Decimal;
        DateBalanceReverse: Decimal;
        TotalBalance: Decimal;
        TotalBalanceReverse: Decimal;
        AccName: Text[50];
        LastLineNo: Integer;
        GLDocNo: Code[20];
        Day: Integer;
        Week: Integer;
        Month: Integer;
        MonthText: Text[30];
        AmountError: Boolean;
        ErrorCounter: Integer;
        ErrorText: array[50] of Text[250];
        TempErrorText: Text[250];
        BalAccName: Text[50];
        CurrentCustomerVendors: Integer;
        VATEntryCreated: Boolean;
        CustPosting: Boolean;
        VendPosting: Boolean;
        SalesPostingType: Boolean;
        PurchPostingType: Boolean;
        DimText: Text[120];
        OldDimText: Text[75];
        ShowDim: Boolean;
        Continue: Boolean;
        Text063: Label 'Document,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
        Text064: Label '%1 %2 is already used in line %3 (%4 %5).';
        Text065: Label '%1 must not be blocked with type %2 when %3 is %4';
        CurrentICPartner: Code[20];
        Text066: Label 'You cannot enter G/L Account or Bank Account in both %1 and %2.';
        Text067: Label '%1 %2 is linked to %3 %4.';
        Text069: Label '%1 must not be specified when %2 is %3.';
        Text070: Label '%1 must not be specified when the document is not an intercompany transaction.';
        Text071: Label '%1 %2 does not exist.';
        Text072: Label '%1 must not be %2 for %3 %4.';
        Text073: Label '%1 %2 already exists.';
        MYGenJnlLine: Record "Gen. Journal Line";
        WHTManagement: Codeunit "WHTManagement";
        WHTAmount: Decimal;
        TotalWHTAmount: Decimal;
        WHTPostingSetup: Record "WHT Posting Setup";
        RemainingAmount: Decimal;
        VendorName: Text[50];
        VendRec: Record "Vendor";
        VendAddr: array[8] of Text[50];
        VendFaxNo: Text[30];
        CompanyInfo: Record "Company Information";
        CompanyAddr: array[8] of Text[50];
        General_Journal___TestCaptionLbl: Label 'Remittance Advice';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        DateCaptionLbl: Label 'Date';
        Document_TypeCaptionLbl: Label 'Document Type';
        Invoice_No_CaptionLbl: Label 'Invoice No.';
        Amount_PaidCaptionLbl: Label 'Amount Paid';
        Vendor_No_CaptionLbl: Label 'Vendor No.';
        Vendor_NameCaptionLbl: Label 'Vendor Name';
        Fax_No_CaptionLbl: Label 'Fax No.';
        Original_AmountCaptionLbl: Label 'Original Amount';
        TotalCaptionLbl: Label 'PAYMENT AMOUNT';
        DimensionsCaptionLbl: Label 'Dimensions';
        CountryName: Record "Country/Region";
        gvWHTAmt: Decimal;
        WHTEntry: Record "WHT Entry";

    local procedure CheckRecurringLine(GenJnlLine2: Record "Gen. Journal Line")
    begin
        WITH GenJnlLine2 DO BEGIN
            IF GenJnlTemplate.Recurring THEN BEGIN
                IF "Recurring Method" = 0 THEN
                    AddError(STRSUBSTNO(Text002, FIELDCAPTION("Recurring Method")));
                IF FORMAT("Recurring Frequency") = '' THEN
                    AddError(STRSUBSTNO(Text002, FIELDCAPTION("Recurring Frequency")));
                IF "Bal. Account No." <> '' THEN
                    AddError(
                      STRSUBSTNO(
                        Text019,
                        FIELDCAPTION("Bal. Account No.")));
                CASE "Recurring Method" OF
                    "Recurring Method"::"V  Variable", "Recurring Method"::"RV Reversing Variable",
                  "Recurring Method"::"F  Fixed", "Recurring Method"::"RF Reversing Fixed":
                        WarningIfZeroAmt(DataItem7024);
                    "Recurring Method"::"B  Balance", "Recurring Method"::"RB Reversing Balance":
                        WarningIfNonZeroAmt(DataItem7024);
                END;
                IF ("Recurring Method" > "Recurring Method"::"V  Variable") THEN BEGIN
                    IF "Account Type" = "Account Type"::"Fixed Asset" THEN
                        AddError(
                          STRSUBSTNO(
                            Text020,
                            FIELDCAPTION("Recurring Method"), "Recurring Method",
                            FIELDCAPTION("Account Type"), "Account Type"));
                    IF "Bal. Account Type" = "Bal. Account Type"::"Fixed Asset" THEN
                        AddError(
                          STRSUBSTNO(
                            Text020,
                            FIELDCAPTION("Recurring Method"), "Recurring Method",
                            FIELDCAPTION("Bal. Account Type"), "Bal. Account Type"));
                END;
            END ELSE BEGIN
                IF "Recurring Method" <> 0 THEN
                    AddError(STRSUBSTNO(Text009, FIELDCAPTION("Recurring Method")));
                IF FORMAT("Recurring Frequency") <> '' THEN
                    AddError(STRSUBSTNO(Text009, FIELDCAPTION("Recurring Frequency")));
            END;
        END;
    end;

    local procedure CheckAllocations(GenJnlLine2: Record "Gen. Journal Line")
    begin
        WITH GenJnlLine2 DO BEGIN
            IF "Recurring Method" IN
               ["Recurring Method"::"B  Balance",
                "Recurring Method"::"RB Reversing Balance"]
            THEN BEGIN
                GenJnlAlloc.RESET;
                GenJnlAlloc.SETRANGE("Journal Template Name", "Journal Template Name");
                GenJnlAlloc.SETRANGE("Journal Batch Name", "Journal Batch Name");
                GenJnlAlloc.SETRANGE("Journal Line No.", "Line No.");
                IF NOT GenJnlAlloc.FIND('-') THEN
                    AddError(Text061);
            END;

            GenJnlAlloc.RESET;
            GenJnlAlloc.SETRANGE("Journal Template Name", "Journal Template Name");
            GenJnlAlloc.SETRANGE("Journal Batch Name", "Journal Batch Name");
            GenJnlAlloc.SETRANGE("Journal Line No.", "Line No.");
            GenJnlAlloc.SETFILTER(Amount, '<>0');
            IF GenJnlAlloc.FIND('-') THEN BEGIN
                IF NOT GenJnlTemplate.Recurring THEN
                    AddError(Text021)
                ELSE BEGIN
                    GenJnlAlloc.SETRANGE("Account No.", '');
                    IF GenJnlAlloc.FIND('-') THEN
                        AddError(
                          STRSUBSTNO(
                            Text022,
                            GenJnlAlloc.FIELDCAPTION("Account No."), GenJnlAlloc.COUNT));
                END;
            END;
        END;
    end;

    local procedure MakeRecurringTexts(var GenJnlLine2: Record "Gen. Journal Line")
    begin
        WITH GenJnlLine2 DO BEGIN
            GLDocNo := "Document No.";
            IF ("Posting Date" <> 0D) AND ("Account No." <> '') AND ("Recurring Method" <> 0) THEN BEGIN
                Day := DATE2DMY("Posting Date", 1);
                Week := DATE2DWY("Posting Date", 2);
                Month := DATE2DMY("Posting Date", 2);
                MonthText := FORMAT("Posting Date", 0, Text023);
                AccountingPeriod.SETRANGE("Starting Date", 0D, "Posting Date");
                IF NOT AccountingPeriod.FIND('+') THEN
                    AccountingPeriod.Name := '';
                "Document No." :=
                  DELCHR(
                    PADSTR(
                      STRSUBSTNO("Document No.", Day, Week, Month, MonthText, AccountingPeriod.Name),
                      MAXSTRLEN("Document No.")),
                    '>');
                Description :=
                  DELCHR(
                    PADSTR(
                      STRSUBSTNO(Description, Day, Week, Month, MonthText, AccountingPeriod.Name),
                      MAXSTRLEN(Description)),
                    '>');
            END;
        END;
    end;

    local procedure CheckBalance()
    var
        GenJnlLine: Record "Gen. Journal Line";
        NextGenJnlLine: Record "Gen. Journal Line";
    begin
        GenJnlLine := DataItem7024;
        LastLineNo := DataItem7024."Line No.";
        IF DataItem7024.NEXT = 0 THEN;
        NextGenJnlLine := DataItem7024;
        MakeRecurringTexts(NextGenJnlLine);
        DataItem7024 := GenJnlLine;
        WITH GenJnlLine DO
            IF NOT EmptyLine THEN BEGIN
                DocBalance := DocBalance + "Balance (LCY)";
                DateBalance := DateBalance + "Balance (LCY)";
                TotalBalance := TotalBalance + "Balance (LCY)";
                IF "Recurring Method" >= "Recurring Method"::"RF Reversing Fixed" THEN BEGIN
                    DocBalanceReverse := DocBalanceReverse + "Balance (LCY)";
                    DateBalanceReverse := DateBalanceReverse + "Balance (LCY)";
                    TotalBalanceReverse := TotalBalanceReverse + "Balance (LCY)";
                END;
                LastDocType := "Document Type";
                LastDocNo := "Document No.";
                LastDate := "Posting Date";
                IF TotalBalance = 0 THEN BEGIN
                    CurrentCustomerVendors := 0;
                    VATEntryCreated := FALSE;
                END;
                IF GenJnlTemplate."Force Doc. Balance" THEN BEGIN
                    VATEntryCreated :=
                      VATEntryCreated OR
                      (("Account Type" = "Account Type"::"G/L Account") AND ("Account No." <> '') AND
                       ("Gen. Posting Type" IN ["Gen. Posting Type"::Purchase, "Gen. Posting Type"::Sale])) OR
                      (("Bal. Account Type" = "Bal. Account Type"::"G/L Account") AND ("Bal. Account No." <> '') AND
                       ("Bal. Gen. Posting Type" IN ["Bal. Gen. Posting Type"::Purchase, "Bal. Gen. Posting Type"::Sale]));
                    IF (("Account Type" IN ["Account Type"::Customer, "Account Type"::Vendor]) AND
                        ("Account No." <> '')) OR
                       (("Bal. Account Type" IN ["Bal. Account Type"::Customer, "Bal. Account Type"::Vendor]) AND
                        ("Bal. Account No." <> ''))
                       THEN
                        CurrentCustomerVendors := CurrentCustomerVendors + 1;
                    IF (CurrentCustomerVendors > 1) AND VATEntryCreated THEN
                        AddError(
                          STRSUBSTNO(
                            Text024,
                            "Document Type", "Document No.", "Posting Date"));
                END;
            END;

        WITH NextGenJnlLine DO BEGIN
            IF (LastDate <> 0D) AND (LastDocNo <> '') AND
               (("Posting Date" <> LastDate) OR
                ("Document Type" <> LastDocType) OR
                ("Document No." <> LastDocNo) OR
                ("Line No." = LastLineNo))
            THEN BEGIN
                IF GenJnlTemplate."Force Doc. Balance" THEN BEGIN
                    CASE TRUE OF
                        DocBalance <> 0:
                            AddError(
                              STRSUBSTNO(
                                Text025,
                                SELECTSTR(LastDocType + 1, Text063), LastDocNo, DocBalance));
                        DocBalanceReverse <> 0:
                            AddError(
                              STRSUBSTNO(
                                Text026,
                                SELECTSTR(LastDocType + 1, Text063), LastDocNo, DocBalanceReverse));
                    END;
                    DocBalance := 0;
                    DocBalanceReverse := 0;
                END;
                IF ("Posting Date" <> LastDate) OR
                   ("Document Type" <> LastDocType) OR ("Document No." <> LastDocNo)
                THEN BEGIN
                    CurrentCustomerVendors := 0;
                    VATEntryCreated := FALSE;
                    CustPosting := FALSE;
                    VendPosting := FALSE;
                    SalesPostingType := FALSE;
                    PurchPostingType := FALSE;
                END;
            END;

            IF (LastDate <> 0D) AND (("Posting Date" <> LastDate) OR ("Line No." = LastLineNo)) THEN BEGIN
                CASE TRUE OF
                    DateBalance <> 0:
                        AddError(
                          STRSUBSTNO(
                            Text027,
                            LastDate, DateBalance));
                    DateBalanceReverse <> 0:
                        AddError(
                          STRSUBSTNO(
                            Text028,
                            LastDate, DateBalanceReverse));
                END;
                DocBalance := 0;
                DocBalanceReverse := 0;
                DateBalance := 0;
                DateBalanceReverse := 0;
            END;

            IF "Line No." = LastLineNo THEN BEGIN
                CASE TRUE OF
                    TotalBalance <> 0:
                        AddError(
                          STRSUBSTNO(
                            Text029,
                            TotalBalance));
                    TotalBalanceReverse <> 0:
                        AddError(
                          STRSUBSTNO(
                            Text030,
                            TotalBalanceReverse));
                END;
                DocBalance := 0;
                DocBalanceReverse := 0;
                DateBalance := 0;
                DateBalanceReverse := 0;
                TotalBalance := 0;
                TotalBalanceReverse := 0;
                LastDate := 0D;
                LastDocType := 0;
                LastDocNo := '';
            END;
        END;
    end;

    local procedure AddError(Text: Text[250])
    begin
        ErrorCounter := ErrorCounter + 1;
        ErrorText[ErrorCounter] := Text;
    end;

    local procedure ReconcileGLAccNo(GLAccNo: Code[20]; ReconcileAmount: Decimal)
    begin
        IF NOT GLAccNetChange.GET(GLAccNo) THEN BEGIN
            GLAcc.GET(GLAccNo);
            GLAcc.CALCFIELDS("Balance at Date");
            GLAccNetChange.INIT;
            GLAccNetChange."No." := GLAcc."No.";
            GLAccNetChange.Name := GLAcc.Name;
            GLAccNetChange."Balance after Posting" := GLAcc."Balance at Date";
            GLAccNetChange.INSERT;
        END;
        GLAccNetChange."Net Change in Jnl." := GLAccNetChange."Net Change in Jnl." + ReconcileAmount;
        GLAccNetChange."Balance after Posting" := GLAccNetChange."Balance after Posting" + ReconcileAmount;
        GLAccNetChange.MODIFY;
    end;

    local procedure CheckGLAcc(var GenJnlLine: Record "Gen. Journal Line"; var AccName: Text[30])
    begin
        WITH GenJnlLine DO BEGIN
            IF NOT GLAcc.GET("Account No.") THEN
                AddError(
                  STRSUBSTNO(
                    Text031,
                    GLAcc.TABLECAPTION, "Account No."))
            ELSE BEGIN
                AccName := GLAcc.Name;

                IF GLAcc.Blocked THEN
                    AddError(
                      STRSUBSTNO(
                        Text032,
                        GLAcc.FIELDCAPTION(Blocked), FALSE, GLAcc.TABLECAPTION, "Account No."));
                IF GLAcc."Account Type" <> GLAcc."Account Type"::Posting THEN BEGIN
                    GLAcc."Account Type" := GLAcc."Account Type"::Posting;
                    AddError(
                      STRSUBSTNO(
                        Text032,
                        GLAcc.FIELDCAPTION("Account Type"), GLAcc."Account Type", GLAcc.TABLECAPTION, "Account No."));
                END;
                IF NOT "System-Created Entry" THEN
                    IF "Posting Date" = NORMALDATE("Posting Date") THEN
                        IF NOT GLAcc."Direct Posting" THEN
                            AddError(
                              STRSUBSTNO(
                                Text032,
                                GLAcc.FIELDCAPTION("Direct Posting"), TRUE, GLAcc.TABLECAPTION, "Account No."));

                IF "Gen. Posting Type" > 0 THEN BEGIN
                    CASE "Gen. Posting Type" OF
                        "Gen. Posting Type"::Sale:
                            SalesPostingType := TRUE;
                        "Gen. Posting Type"::Purchase:
                            PurchPostingType := TRUE;
                    END;
                    TestPostingType;

                    IF NOT VATPostingSetup.GET("VAT Bus. Posting Group", "VAT Prod. Posting Group") THEN
                        AddError(
                          STRSUBSTNO(
                            Text036,
                            VATPostingSetup.TABLECAPTION, "VAT Bus. Posting Group", "VAT Prod. Posting Group"))
                    ELSE
                        IF "VAT Calculation Type" <> VATPostingSetup."VAT Calculation Type" THEN
                            AddError(
                              STRSUBSTNO(
                                Text037,
                                FIELDCAPTION("VAT Calculation Type"), VATPostingSetup."VAT Calculation Type"))
                END;

                IF GLAcc."Reconciliation Account" THEN
                    ReconcileGLAccNo("Account No.", ROUND("Amount (LCY)" / (1 + "VAT %" / 100)));
            END;
        END;
    end;

    local procedure CheckCust(var GenJnlLine: Record "Gen. Journal Line"; var AccName: Text[50])
    begin
        WITH GenJnlLine DO BEGIN
            IF NOT Cust.GET("Account No.") THEN
                AddError(
                  STRSUBSTNO(
                    Text031,
                    Cust.TABLECAPTION, "Account No."))
            ELSE BEGIN
                AccName := Cust.Name;
                IF ((Cust.Blocked = Cust.Blocked::All) OR
                    ((Cust.Blocked IN [Cust.Blocked::Invoice, Cust.Blocked::Ship]) AND
                    ("Document Type" IN ["Document Type"::Invoice, "Document Type"::" "]))
                   )
                THEN
                    AddError(
                      STRSUBSTNO(
                        Text065,
                        "Account Type", Cust.Blocked, FIELDCAPTION("Document Type"), "Document Type"));
                IF "Currency Code" <> '' THEN
                    IF NOT Currency.GET("Currency Code") THEN
                        AddError(
                          STRSUBSTNO(
                            Text038,
                            "Currency Code"));
                IF (Cust."IC Partner Code" <> '') AND (GenJnlTemplate.Type = GenJnlTemplate.Type::Intercompany) THEN
                    IF ICPartner.GET(Cust."IC Partner Code") THEN BEGIN
                        IF ICPartner.Blocked THEN
                            AddError(
                              STRSUBSTNO(
                                '%1 %2',
                                STRSUBSTNO(
                                  Text067,
                                  Cust.TABLECAPTION, "Account No.", ICPartner.TABLECAPTION, "IC Partner Code"),
                                STRSUBSTNO(
                                  Text032,
                                  ICPartner.FIELDCAPTION(Blocked), FALSE, ICPartner.TABLECAPTION, Cust."IC Partner Code")));
                    END ELSE
                        AddError(
                          STRSUBSTNO(
                            '%1 %2',
                            STRSUBSTNO(
                              Text067,
                                Cust.TABLECAPTION, "Account No.", ICPartner.TABLECAPTION, Cust."IC Partner Code"),
                            STRSUBSTNO(
                              Text031,
                              ICPartner.TABLECAPTION, Cust."IC Partner Code")));
                CustPosting := TRUE;
                TestPostingType;

                IF "Recurring Method" = 0 THEN
                    IF "Document Type" IN
                       ["Document Type"::Invoice, "Document Type"::"Credit Memo",
                        "Document Type"::"Finance Charge Memo", "Document Type"::Reminder]
                    THEN BEGIN
                        OldCustLedgEntry.RESET;
                        OldCustLedgEntry.SETCURRENTKEY("Document No.");
                        OldCustLedgEntry.SETRANGE("Document Type", "Document Type");
                        OldCustLedgEntry.SETRANGE("Document No.", "Document No.");
                        IF OldCustLedgEntry.FIND('-') THEN
                            AddError(
                              STRSUBSTNO(
                                Text039, "Document Type", "Document No."));

                        IF SalesSetup."Ext. Doc. No. Mandatory" OR
                           ("External Document No." <> '')
                        THEN BEGIN
                            IF "External Document No." = '' THEN
                                AddError(
                                  STRSUBSTNO(
                                    Text041, FIELDCAPTION("External Document No.")));

                            OldCustLedgEntry.RESET;
                            OldCustLedgEntry.SETCURRENTKEY("External Document No.");
                            OldCustLedgEntry.SETRANGE("Document Type", "Document Type");
                            OldCustLedgEntry.SETRANGE("Customer No.", "Account No.");
                            OldCustLedgEntry.SETRANGE("External Document No.", "External Document No.");
                            IF OldCustLedgEntry.FIND('-') THEN
                                AddError(
                                  STRSUBSTNO(
                                    Text039,
                                    "Document Type", "External Document No."));
                            CheckAgainstPrevLines(DataItem7024);
                        END;
                    END;
            END;
        END;
    end;

    local procedure CheckVend(var GenJnlLine: Record "Gen. Journal Line"; var AccName: Text[50])
    begin
        WITH GenJnlLine DO BEGIN
            IF NOT Vend.GET("Account No.") THEN
                AddError(
                  STRSUBSTNO(
                    Text031,
                    Vend.TABLECAPTION, "Account No."))
            ELSE BEGIN
                AccName := Vend.Name;

                IF ((Vend.Blocked = Vend.Blocked::All) OR
                    ((Vend.Blocked = Vend.Blocked::Payment) AND ("Document Type" = "Document Type"::Payment))
                   )
                THEN BEGIN
                    AddError(
                      STRSUBSTNO(
                        Text065,
                        "Account Type", Vend.Blocked, FIELDCAPTION("Document Type"), "Document Type"));
                END;
                IF "Currency Code" <> '' THEN
                    IF NOT Currency.GET("Currency Code") THEN
                        AddError(
                          STRSUBSTNO(
                            Text038,
                            "Currency Code"));

                IF (Vend."IC Partner Code" <> '') AND (GenJnlTemplate.Type = GenJnlTemplate.Type::Intercompany) THEN
                    IF ICPartner.GET(Cust."IC Partner Code") THEN BEGIN
                        IF ICPartner.Blocked THEN
                            AddError(
                              STRSUBSTNO(
                                '%1 %2',
                                STRSUBSTNO(
                                  Text067,
                                  Vend.TABLECAPTION, "Account No.", ICPartner.TABLECAPTION, Vend."IC Partner Code"),
                                STRSUBSTNO(
                                  Text032,
                                  ICPartner.FIELDCAPTION(Blocked), FALSE, ICPartner.TABLECAPTION, Vend."IC Partner Code")));
                    END ELSE
                        AddError(
                          STRSUBSTNO(
                            '%1 %2',
                            STRSUBSTNO(
                              Text067,
                              Vend.TABLECAPTION, "Account No.", ICPartner.TABLECAPTION, "IC Partner Code"),
                            STRSUBSTNO(
                              Text031,
                              ICPartner.TABLECAPTION, Vend."IC Partner Code")));
                VendPosting := TRUE;
                TestPostingType;

                IF "Recurring Method" = 0 THEN
                    IF "Document Type" IN
                       ["Document Type"::Invoice, "Document Type"::"Credit Memo",
                        "Document Type"::"Finance Charge Memo", "Document Type"::Reminder]
                    THEN BEGIN
                        OldVendLedgEntry.RESET;
                        OldVendLedgEntry.SETCURRENTKEY("Document No.");
                        OldVendLedgEntry.SETRANGE("Document Type", "Document Type");
                        OldVendLedgEntry.SETRANGE("Document No.", "Document No.");
                        IF OldVendLedgEntry.FIND('-') THEN
                            AddError(
                              STRSUBSTNO(
                                Text040,
                                "Document Type", "Document No."));

                        IF PurchSetup."Ext. Doc. No. Mandatory" OR
                          ("External Document No." <> '')
                        THEN BEGIN
                            IF "External Document No." = '' THEN
                                AddError(
                                  STRSUBSTNO(
                                    Text041, FIELDCAPTION("External Document No.")));

                            OldVendLedgEntry.RESET;
                            OldVendLedgEntry.SETCURRENTKEY("External Document No.");
                            OldVendLedgEntry.SETRANGE("Document Type", "Document Type");
                            OldVendLedgEntry.SETRANGE("Vendor No.", "Account No.");
                            OldVendLedgEntry.SETRANGE("External Document No.", "External Document No.");
                            IF OldVendLedgEntry.FIND('-') THEN
                                AddError(
                                  STRSUBSTNO(
                                    Text040,
                                    "Document Type", "External Document No."));
                            CheckAgainstPrevLines(DataItem7024);
                        END;
                    END;
            END;
        END;
    end;

    local procedure CheckBankAcc(var GenJnlLine: Record "Gen. Journal Line"; var AccName: Text[50])
    begin
        WITH GenJnlLine DO BEGIN
            IF NOT BankAcc.GET("Account No.") THEN
                AddError(
                  STRSUBSTNO(
                    Text031,
                    BankAcc.TABLECAPTION, "Account No."))
            ELSE BEGIN
                AccName := BankAcc.Name;

                IF BankAcc.Blocked THEN
                    AddError(
                      STRSUBSTNO(
                        Text032,
                        BankAcc.FIELDCAPTION(Blocked), FALSE, BankAcc.TABLECAPTION, "Account No."));
                IF ("Currency Code" <> BankAcc."Currency Code") AND (BankAcc."Currency Code" <> '') THEN
                    AddError(
                      STRSUBSTNO(
                        Text037,
                        FIELDCAPTION("Currency Code"), BankAcc."Currency Code"));

                IF "Currency Code" <> '' THEN
                    IF NOT Currency.GET("Currency Code") THEN
                        AddError(
                          STRSUBSTNO(
                            Text038,
                            "Currency Code"));

                IF "Bank Payment Type" <> 0 THEN
                    IF ("Bank Payment Type" = "Bank Payment Type"::"Computer Check") AND (Amount < 0) THEN
                        IF BankAcc."Currency Code" <> "Currency Code" THEN
                            AddError(
                              STRSUBSTNO(
                                Text042,
                                FIELDCAPTION("Bank Payment Type"), FIELDCAPTION("Currency Code"),
                                TABLECAPTION, BankAcc.TABLECAPTION));

                IF BankAccPostingGr.GET(BankAcc."Bank Acc. Posting Group") THEN
                    IF BankAccPostingGr."G/L Bank Account No." <> '' THEN
                        ReconcileGLAccNo(
                          BankAccPostingGr."G/L Bank Account No.",
                          ROUND("Amount (LCY)" / (1 + "VAT %" / 100)));
            END;
        END;
    end;

    local procedure CheckFixedAsset(var GenJnlLine: Record "Gen. Journal Line"; var AccName: Text[30])
    begin
        WITH GenJnlLine DO BEGIN
            IF NOT FA.GET("Account No.") THEN
                AddError(
                  STRSUBSTNO(
                    Text031,
                    FA.TABLECAPTION, "Account No."))
            ELSE BEGIN
                AccName := FA.Description;
                IF FA.Blocked THEN
                    AddError(
                      STRSUBSTNO(
                        Text032,
                        FA.FIELDCAPTION(Blocked), FALSE, FA.TABLECAPTION, "Account No."));
                IF FA.Inactive THEN
                    AddError(
                      STRSUBSTNO(
                        Text032,
                        FA.FIELDCAPTION(Inactive), FALSE, FA.TABLECAPTION, "Account No."));
                IF FA."Budgeted Asset" THEN
                    AddError(
                      STRSUBSTNO(
                        Text043,
                        FA.TABLECAPTION, "Account No.", FA.FIELDCAPTION("Budgeted Asset"), TRUE));
                IF DeprBook.GET("Depreciation Book Code") THEN
                    CheckFAIntegration(GenJnlLine)
                ELSE
                    AddError(
                      STRSUBSTNO(
                        Text031,
                        DeprBook.TABLECAPTION, "Depreciation Book Code"));
                IF NOT FADeprBook.GET(FA."No.", "Depreciation Book Code") THEN
                    AddError(
                      STRSUBSTNO(
                        Text036,
                        FADeprBook.TABLECAPTION, FA."No.", "Depreciation Book Code"));
            END;
        END;
    end;

    procedure CheckICPartner(var GenJnlLine: Record "Gen. Journal Line"; var AccName: Text[50])
    begin
        WITH GenJnlLine DO BEGIN
            IF NOT ICPartner.GET("Account No.") THEN
                AddError(
                  STRSUBSTNO(
                    Text031,
                    ICPartner.TABLECAPTION, "Account No."))
            ELSE BEGIN
                AccName := ICPartner.Name;
                IF ICPartner.Blocked THEN
                    AddError(
                      STRSUBSTNO(
                        Text032,
                        ICPartner.FIELDCAPTION(Blocked), FALSE, ICPartner.TABLECAPTION, "Account No."));
            END;
        END;
    end;

    local procedure TestFixedAsset(var GenJnlLine: Record "Gen. Journal Line")
    begin
        WITH GenJnlLine DO BEGIN
            IF "Job No." <> '' THEN
                AddError(
                  STRSUBSTNO(
                    Text044, FIELDCAPTION("Job No.")));
            IF "FA Posting Type" = "FA Posting Type"::" " THEN
                AddError(
                  STRSUBSTNO(
                    Text045, FIELDCAPTION("FA Posting Type")));
            IF "Depreciation Book Code" = '' THEN
                AddError(
                  STRSUBSTNO(
                    Text045, FIELDCAPTION("Depreciation Book Code")));
            IF "Depreciation Book Code" = "Duplicate in Depreciation Book" THEN
                AddError(
                  STRSUBSTNO(
                    Text046,
                    FIELDCAPTION("Depreciation Book Code"), FIELDCAPTION("Duplicate in Depreciation Book")));
            CheckFADocNo(GenJnlLine);
            IF "Account Type" = "Bal. Account Type" THEN
                AddError(
                  STRSUBSTNO(
                    Text047,
                    FIELDCAPTION("Account Type"), FIELDCAPTION("Bal. Account Type"), "Account Type"));
            IF "Account Type" = "Account Type"::"Fixed Asset" THEN BEGIN
                IF "FA Posting Type" IN
                  ["FA Posting Type"::"Acquisition Cost", "FA Posting Type"::Disposal, "FA Posting Type"::Maintenance]
                THEN BEGIN
                    IF ("Gen. Bus. Posting Group" <> '') OR ("Gen. Prod. Posting Group" <> '') THEN
                        IF "Gen. Posting Type" = "Gen. Posting Type"::" " THEN
                            AddError(STRSUBSTNO(Text002, FIELDCAPTION("Gen. Posting Type")));
                END ELSE BEGIN
                    IF "Gen. Posting Type" <> "Gen. Posting Type"::" " THEN
                        AddError(
                          STRSUBSTNO(
                            Text048,
                            FIELDCAPTION("Gen. Posting Type"), FIELDCAPTION("FA Posting Type"), "FA Posting Type"));
                    IF "Gen. Bus. Posting Group" <> '' THEN
                        AddError(
                          STRSUBSTNO(
                            Text049,
                            FIELDCAPTION("Gen. Bus. Posting Group"), FIELDCAPTION("FA Posting Type"), "FA Posting Type"));
                    IF "Gen. Prod. Posting Group" <> '' THEN
                        AddError(
                          STRSUBSTNO(
                            Text049,
                            FIELDCAPTION("Gen. Prod. Posting Group"), FIELDCAPTION("FA Posting Type"), "FA Posting Type"));
                END;
            END;
            IF "Bal. Account Type" = "Bal. Account Type"::"Fixed Asset" THEN BEGIN
                IF "FA Posting Type" IN
                  ["FA Posting Type"::"Acquisition Cost", "FA Posting Type"::Disposal, "FA Posting Type"::Maintenance]
                THEN BEGIN
                    IF ("Bal. Gen. Bus. Posting Group" <> '') OR ("Bal. Gen. Prod. Posting Group" <> '') THEN
                        IF "Bal. Gen. Posting Type" = "Bal. Gen. Posting Type"::" " THEN
                            AddError(STRSUBSTNO(Text002, FIELDCAPTION("Bal. Gen. Posting Type")));
                END ELSE BEGIN
                    IF "Bal. Gen. Posting Type" <> "Bal. Gen. Posting Type"::" " THEN
                        AddError(
                          STRSUBSTNO(
                          Text049,
                          FIELDCAPTION("Bal. Gen. Posting Type"), FIELDCAPTION("FA Posting Type"), "FA Posting Type"));
                    IF "Bal. Gen. Bus. Posting Group" <> '' THEN
                        AddError(
                          STRSUBSTNO(
                            Text049,
                            FIELDCAPTION("Bal. Gen. Bus. Posting Group"), FIELDCAPTION("FA Posting Type"), "FA Posting Type"));
                    IF "Bal. Gen. Prod. Posting Group" <> '' THEN
                        AddError(
                          STRSUBSTNO(
                            Text049,
                            FIELDCAPTION("Bal. Gen. Prod. Posting Group"), FIELDCAPTION("FA Posting Type"), "FA Posting Type"));
                END;
            END;
            TempErrorText :=
              '%1 ' +
              STRSUBSTNO(
                Text050,
                FIELDCAPTION("FA Posting Type"), "FA Posting Type");
            IF "FA Posting Type" <> "FA Posting Type"::"Acquisition Cost" THEN BEGIN
                IF "Depr. Acquisition Cost" THEN
                    AddError(STRSUBSTNO(TempErrorText, FIELDCAPTION("Depr. Acquisition Cost")));
                IF "Salvage Value" <> 0 THEN
                    AddError(STRSUBSTNO(TempErrorText, FIELDCAPTION("Salvage Value")));
                IF "FA Posting Type" <> "FA Posting Type"::Maintenance THEN
                    IF Quantity <> 0 THEN
                        AddError(STRSUBSTNO(TempErrorText, FIELDCAPTION(Quantity)));
                IF "Insurance No." <> '' THEN
                    AddError(STRSUBSTNO(TempErrorText, FIELDCAPTION("Insurance No.")));
            END;
            IF ("FA Posting Type" = "FA Posting Type"::Maintenance) AND "Depr. until FA Posting Date" THEN
                AddError(STRSUBSTNO(TempErrorText, FIELDCAPTION("Depr. until FA Posting Date")));
            IF ("FA Posting Type" <> "FA Posting Type"::Maintenance) AND ("Maintenance Code" <> '') THEN
                AddError(STRSUBSTNO(TempErrorText, FIELDCAPTION("Maintenance Code")));

            IF ("FA Posting Type" <> "FA Posting Type"::Depreciation) AND
               ("FA Posting Type" <> "FA Posting Type"::"Custom 1") AND
               ("No. of Depreciation Days" <> 0)
            THEN
                AddError(STRSUBSTNO(TempErrorText, FIELDCAPTION("No. of Depreciation Days")));

            IF ("FA Posting Type" = "FA Posting Type"::Disposal) AND "FA Reclassification Entry" THEN
                AddError(STRSUBSTNO(TempErrorText, FIELDCAPTION("FA Reclassification Entry")));

            IF ("FA Posting Type" = "FA Posting Type"::Disposal) AND ("Budgeted FA No." <> '') THEN
                AddError(STRSUBSTNO(TempErrorText, FIELDCAPTION("Budgeted FA No.")));

            IF "FA Posting Date" = 0D THEN
                "FA Posting Date" := "Posting Date";
            IF DeprBook.GET("Depreciation Book Code") THEN
                IF DeprBook."Use Same FA+G/L Posting Dates" AND ("Posting Date" <> "FA Posting Date") THEN
                    AddError(
                      STRSUBSTNO(
                        Text051,
                        FIELDCAPTION("Posting Date"), FIELDCAPTION("FA Posting Date")));
            IF "FA Posting Date" <> 0D THEN BEGIN
                IF "FA Posting Date" <> NORMALDATE("FA Posting Date") THEN
                    AddError(
                      STRSUBSTNO(
                        Text052,
                        FIELDCAPTION("FA Posting Date")));
                IF NOT ("FA Posting Date" IN [00020101D .. 99981231D]) THEN
                    AddError(
                      STRSUBSTNO(
                        Text053,
                        FIELDCAPTION("FA Posting Date")));
                IF (AllowFAPostingFrom = 0D) AND (AllowFAPostingTo = 0D) THEN BEGIN
                    IF USERID <> '' THEN
                        IF UserSetup.GET(USERID) THEN BEGIN
                            AllowFAPostingFrom := UserSetup."Allow FA Posting From";
                            AllowFAPostingTo := UserSetup."Allow FA Posting To";
                        END;
                    IF (AllowFAPostingFrom = 0D) AND (AllowFAPostingTo = 0D) THEN BEGIN
                        FASetup.GET;
                        AllowFAPostingFrom := FASetup."Allow FA Posting From";
                        AllowFAPostingTo := FASetup."Allow FA Posting To";
                    END;
                    IF AllowFAPostingTo = 0D THEN
                        AllowFAPostingTo := 21000101D;
                END;
                IF ("FA Posting Date" < AllowFAPostingFrom) OR
                   ("FA Posting Date" > AllowFAPostingTo)
                THEN
                    AddError(
                      STRSUBSTNO(
                        Text053,
                        FIELDCAPTION("FA Posting Date")));
            END;
            FASetup.GET;
            IF ("FA Posting Type" = "FA Posting Type"::"Acquisition Cost") AND
               ("Insurance No." <> '') AND ("Depreciation Book Code" <> FASetup."Insurance Depr. Book")
            THEN
                AddError(
                  STRSUBSTNO(
                    Text054,
                    FIELDCAPTION("Depreciation Book Code"), "Depreciation Book Code"));

            IF "FA Error Entry No." > 0 THEN BEGIN
                TempErrorText :=
                  '%1 ' +
                  STRSUBSTNO(
                  Text055,
                   FIELDCAPTION("FA Error Entry No."));
                IF "Depr. until FA Posting Date" THEN
                    AddError(STRSUBSTNO(TempErrorText, FIELDCAPTION("Depr. until FA Posting Date")));
                IF "Depr. Acquisition Cost" THEN
                    AddError(STRSUBSTNO(TempErrorText, FIELDCAPTION("Depr. Acquisition Cost")));
                IF "Duplicate in Depreciation Book" <> '' THEN
                    AddError(STRSUBSTNO(TempErrorText, FIELDCAPTION("Duplicate in Depreciation Book")));
                IF "Use Duplication List" THEN
                    AddError(STRSUBSTNO(TempErrorText, FIELDCAPTION("Use Duplication List")));
                IF "Salvage Value" <> 0 THEN
                    AddError(STRSUBSTNO(TempErrorText, FIELDCAPTION("Salvage Value")));
                IF "Insurance No." <> '' THEN
                    AddError(STRSUBSTNO(TempErrorText, FIELDCAPTION("Insurance No.")));
                IF "Budgeted FA No." <> '' THEN
                    AddError(STRSUBSTNO(TempErrorText, FIELDCAPTION("Budgeted FA No.")));
                IF "Recurring Method" > 0 THEN
                    AddError(STRSUBSTNO(TempErrorText, FIELDCAPTION("Recurring Method")));
                IF "FA Posting Type" = "FA Posting Type"::Maintenance THEN
                    AddError(STRSUBSTNO(TempErrorText, "FA Posting Type"));
            END;
        END;
    end;

    local procedure CheckFAIntegration(var GenJnlLine: Record "Gen. Journal Line")
    var
        GLIntegration: Boolean;
    begin
        WITH GenJnlLine DO BEGIN
            IF "FA Posting Type" = "FA Posting Type"::" " THEN
                EXIT;
            CASE "FA Posting Type" OF
                "FA Posting Type"::"Acquisition Cost":
                    GLIntegration := DeprBook."G/L Integration - Acq. Cost";
                "FA Posting Type"::Depreciation:
                    GLIntegration := DeprBook."G/L Integration - Depreciation";
                "FA Posting Type"::"Write-Down":
                    GLIntegration := DeprBook."G/L Integration - Write-Down";
                "FA Posting Type"::Appreciation:
                    GLIntegration := DeprBook."G/L Integration - Appreciation";
                "FA Posting Type"::"Custom 1":
                    GLIntegration := DeprBook."G/L Integration - Custom 1";
                "FA Posting Type"::"Custom 2":
                    GLIntegration := DeprBook."G/L Integration - Custom 2";
                "FA Posting Type"::Disposal:
                    GLIntegration := DeprBook."G/L Integration - Disposal";
                "FA Posting Type"::Maintenance:
                    GLIntegration := DeprBook."G/L Integration - Maintenance";
            END;
            IF NOT GLIntegration THEN
                AddError(
                  STRSUBSTNO(
                    Text056,
                    "FA Posting Type"));

            IF NOT DeprBook."G/L Integration - Depreciation" THEN BEGIN
                IF "Depr. until FA Posting Date" THEN
                    AddError(
                      STRSUBSTNO(
                        Text057,
                        FIELDCAPTION("Depr. until FA Posting Date")));
                IF "Depr. Acquisition Cost" THEN
                    AddError(
                      STRSUBSTNO(
                        Text057,
                        FIELDCAPTION("Depr. Acquisition Cost")));
            END;
        END;
    end;

    local procedure TestFixedAssetFields(var GenJnlLine: Record "Gen. Journal Line")
    begin
        WITH GenJnlLine DO BEGIN
            IF "FA Posting Type" <> "FA Posting Type"::" " THEN
                AddError(STRSUBSTNO(Text058, FIELDCAPTION("FA Posting Type")));
            IF "Depreciation Book Code" <> '' THEN
                AddError(STRSUBSTNO(Text058, FIELDCAPTION("Depreciation Book Code")));
        END;
    end;

    procedure TestPostingType()
    begin
        CASE TRUE OF
            CustPosting AND PurchPostingType:
                AddError(Text059);
            VendPosting AND SalesPostingType:
                AddError(Text060);
        END;
    end;

    local procedure WarningIfNegativeAmt(GenJnlLine: Record "Gen. Journal Line")
    begin
        IF (GenJnlLine.Amount < 0) AND NOT AmountError THEN BEGIN
            AmountError := TRUE;
            AddError(STRSUBSTNO(Text007, GenJnlLine.FIELDCAPTION(Amount)));
        END;
    end;

    local procedure WarningIfPositiveAmt(GenJnlLine: Record "Gen. Journal Line")
    begin
        IF (GenJnlLine.Amount > 0) AND NOT AmountError THEN BEGIN
            AmountError := TRUE;
            AddError(STRSUBSTNO(Text006, GenJnlLine.FIELDCAPTION(Amount)));
        END;
    end;

    local procedure WarningIfZeroAmt(GenJnlLine: Record "Gen. Journal Line")
    begin
        IF (GenJnlLine.Amount = 0) AND NOT AmountError THEN BEGIN
            AmountError := TRUE;
            AddError(STRSUBSTNO(Text002, GenJnlLine.FIELDCAPTION(Amount)));
        END;
    end;

    local procedure WarningIfNonZeroAmt(GenJnlLine: Record "Gen. Journal Line")
    begin
        IF (GenJnlLine.Amount <> 0) AND NOT AmountError THEN BEGIN
            AmountError := TRUE;
            AddError(STRSUBSTNO(Text062, GenJnlLine.FIELDCAPTION(Amount)));
        END;
    end;

    local procedure CheckAgainstPrevLines(GenJnlLine: Record "Gen. Journal Line")
    var
        i: Integer;
        AccType: Integer;
        AccNo: Code[20];
        ErrorFound: Boolean;
    begin
        IF (GenJnlLine."External Document No." = '') OR
           NOT (GenJnlLine."Account Type" IN
            [GenJnlLine."Account Type"::Customer, GenJnlLine."Account Type"::Vendor]) AND
           NOT (GenJnlLine."Bal. Account Type" IN
            [GenJnlLine."Bal. Account Type"::Customer, GenJnlLine."Bal. Account Type"::Vendor])
        THEN
            EXIT;

        IF GenJnlLine."Account Type" IN [GenJnlLine."Account Type"::Customer, GenJnlLine."Account Type"::Vendor] THEN BEGIN
            AccType := GenJnlLine."Account Type";
            AccNo := GenJnlLine."Account No.";
        END ELSE BEGIN
            AccType := GenJnlLine."Bal. Account Type";
            AccNo := GenJnlLine."Bal. Account No.";
        END;

        TempGenJnlLine.RESET;
        TempGenJnlLine.SETRANGE("External Document No.", GenJnlLine."External Document No.");

        WHILE (i < 2) AND NOT ErrorFound DO BEGIN
            i := i + 1;
            IF i = 1 THEN BEGIN
                TempGenJnlLine.SETRANGE("Account Type", AccType);
                TempGenJnlLine.SETRANGE("Account No.", AccNo);
                TempGenJnlLine.SETRANGE("Bal. Account Type");
                TempGenJnlLine.SETRANGE("Bal. Account No.");
            END ELSE BEGIN
                TempGenJnlLine.SETRANGE("Account Type");
                TempGenJnlLine.SETRANGE("Account No.");
                TempGenJnlLine.SETRANGE("Bal. Account Type", AccType);
                TempGenJnlLine.SETRANGE("Bal. Account No.", AccNo);
            END;
            IF TempGenJnlLine.FIND('-') THEN BEGIN
                ErrorFound := TRUE;
                AddError(
                  STRSUBSTNO(
                    Text064, GenJnlLine.FIELDCAPTION("External Document No."), GenJnlLine."External Document No.",
                    TempGenJnlLine."Line No.", GenJnlLine.FIELDCAPTION("Document No."), TempGenJnlLine."Document No."));
            END;
        END;

        TempGenJnlLine.RESET;
        TempGenJnlLine := GenJnlLine;
        TempGenJnlLine.INSERT;
    end;

    procedure CheckICDocument()
    var
        GenJnlLine4: Record "Gen. Journal Line";
        "IC G/L Account": Record "IC G/L Account";
    begin
        WITH DataItem7024 DO BEGIN
            IF GenJnlTemplate.Type = GenJnlTemplate.Type::Intercompany THEN BEGIN
                IF (("Posting Date" <> LastDate) OR ("Document Type" <> LastDocType) OR ("Document No." <> LastDocNo)) THEN BEGIN
                    GenJnlLine4.SETCURRENTKEY("Journal Template Name", "Journal Batch Name", "Posting Date", "Document No.");
                    GenJnlLine4.SETRANGE("Journal Template Name", "Journal Template Name");
                    GenJnlLine4.SETRANGE("Journal Batch Name", "Journal Batch Name");
                    GenJnlLine4.SETRANGE("Posting Date", "Posting Date");
                    GenJnlLine4.SETRANGE("Document No.", "Document No.");
                    GenJnlLine4.SETFILTER("IC Partner Code", '<>%1', '');
                    IF GenJnlLine4.FIND('-') THEN
                        CurrentICPartner := GenJnlLine4."IC Partner Code"
                    ELSE
                        CurrentICPartner := '';
                END;
                IF (CurrentICPartner <> '') AND ("IC Direction" = "IC Direction"::Outgoing) THEN BEGIN
                    IF ("Account Type" IN ["Account Type"::"G/L Account", "Account Type"::"Bank Account"]) AND
                       ("Bal. Account Type" IN ["Bal. Account Type"::"G/L Account", "Account Type"::"Bank Account"]) AND
                       ("Account No." <> '') AND
                       ("Bal. Account No." <> '')
                    THEN BEGIN
                        AddError(
                          STRSUBSTNO(
                            Text066, FIELDCAPTION("Account No."), FIELDCAPTION("Bal. Account No.")));
                    END ELSE BEGIN
                        IF (("Account Type" IN ["Account Type"::"G/L Account", "Account Type"::"Bank Account"]) AND ("Account No." <> '')) XOR
                           (("Bal. Account Type" IN ["Bal. Account Type"::"G/L Account", "Account Type"::"Bank Account"]) AND
                          ("Bal. Account No." <> ''))
                        THEN BEGIN
                            IF "IC Partner G/L Acc. No." = '' THEN
                                AddError(
                                  STRSUBSTNO(
                                    Text002, FIELDCAPTION("IC Partner G/L Acc. No.")))
                            ELSE BEGIN
                                IF "IC G/L Account".GET("IC Partner G/L Acc. No.") THEN
                                    IF "IC G/L Account".Blocked THEN
                                        AddError(
                                          STRSUBSTNO(
                                            Text032,
                                            "IC G/L Account".FIELDCAPTION(Blocked), FALSE, FIELDCAPTION("IC Partner G/L Acc. No."), "IC Partner G/L Acc. No."
                        ));
                            END;
                        END ELSE
                            IF "IC Partner G/L Acc. No." <> '' THEN
                                AddError(
                                  STRSUBSTNO(
                                    Text009, FIELDCAPTION("IC Partner G/L Acc. No.")));
                    END;
                END ELSE
                    IF "IC Partner G/L Acc. No." <> '' THEN BEGIN
                        IF "IC Direction" = "IC Direction"::Incoming THEN
                            AddError(
                              STRSUBSTNO(
                                Text069, FIELDCAPTION("IC Partner G/L Acc. No."), FIELDCAPTION("IC Direction"), FORMAT("IC Direction")));
                        IF (CurrentICPartner = '') THEN
                            AddError(
                              STRSUBSTNO(
                                Text070, FIELDCAPTION("IC Partner G/L Acc. No.")));
                    END;
            END;
        END;
    end;

    procedure TestJobFields(var GenJnlLine: Record "Gen. Journal Line")
    var
        Job: Record "Job";
        JT: Record "Job Task";
    begin
        WITH GenJnlLine DO BEGIN
            IF ("Job No." = '') OR ("Account Type" <> "Account Type"::"G/L Account") THEN
                EXIT;
            IF NOT Job.GET("Job No.") THEN
                AddError(STRSUBSTNO(Text071, Job.TABLECAPTION, "Job No."))
            ELSE
                IF Job.Blocked > Job.Blocked::" " THEN
                    AddError(
                      STRSUBSTNO(
                        Text072, Job.FIELDCAPTION(Blocked), Job.Blocked, Job.TABLECAPTION, "Job No."));

            IF "Job Task No." = '' THEN
                AddError(STRSUBSTNO(Text002, FIELDCAPTION("Job Task No.")))
            ELSE
                IF NOT JT.GET("Job No.", "Job Task No.") THEN
                    AddError(STRSUBSTNO(Text071, JT.TABLECAPTION, "Job Task No."))
        END;
    end;

    local procedure CheckFADocNo(GenJnlLine: Record "Gen. Journal Line")
    var
        DeprBook: Record "Depreciation Book";
        FAJnlLine: Record "FA Journal Line";
        OldFALedgEntry: Record "FA Ledger Entry";
        OldMaintenanceLedgEntry: Record "Maintenance Ledger Entry";
        FANo: Code[20];
    begin
        WITH GenJnlLine DO BEGIN
            IF "Account Type" = "Account Type"::"Fixed Asset" THEN
                FANo := "Account No.";
            IF "Bal. Account Type" = "Bal. Account Type"::"Fixed Asset" THEN
                FANo := "Bal. Account No.";
            IF (FANo = '') OR
               ("FA Posting Type" = "FA Posting Type"::" ") OR
               ("Depreciation Book Code" = '') OR
               ("Document No." = '')
            THEN
                EXIT;
            IF NOT DeprBook.GET("Depreciation Book Code") THEN
                EXIT;
            IF DeprBook."Allow Identical Document No." THEN
                EXIT;

            FAJnlLine."FA Posting Type" := "FA Posting Type" - 1;
            IF "FA Posting Type" <> "FA Posting Type"::Maintenance THEN BEGIN
                OldFALedgEntry.SETCURRENTKEY(
                  "FA No.", "Depreciation Book Code", "FA Posting Category", "FA Posting Type", "Document No.");
                OldFALedgEntry.SETRANGE("FA No.", FANo);
                OldFALedgEntry.SETRANGE("Depreciation Book Code", "Depreciation Book Code");
                OldFALedgEntry.SETRANGE("FA Posting Category", OldFALedgEntry."FA Posting Category"::" ");
                OldFALedgEntry.SETRANGE("FA Posting Type", FAJnlLine.ConvertToLedgEntry(FAJnlLine));
                OldFALedgEntry.SETRANGE("Document No.", "Document No.");
                IF OldFALedgEntry.FINDFIRST THEN
                    AddError(
                      STRSUBSTNO(
                        Text073,
                        FIELDCAPTION("Document No."), "Document No."));
            END ELSE BEGIN
                OldMaintenanceLedgEntry.SETCURRENTKEY(
                  "FA No.", "Depreciation Book Code", "Document No.");
                OldMaintenanceLedgEntry.SETRANGE("FA No.", FANo);
                OldMaintenanceLedgEntry.SETRANGE("Depreciation Book Code", "Depreciation Book Code");
                OldMaintenanceLedgEntry.SETRANGE("Document No.", "Document No.");
                IF OldMaintenanceLedgEntry.FINDFIRST THEN
                    AddError(
                      STRSUBSTNO(
                        Text073,
                        FIELDCAPTION("Document No."), "Document No."));
            END;
        END;
    end;
}

