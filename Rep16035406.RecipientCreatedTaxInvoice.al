report 16035406 "Recipient Created Tax Invoice"
{
    // version CAREPOINT1.00

    DefaultLayout = RDLC;
    RDLCLayout = './Recipient Created Tax Invoice.rdlc';
    Caption = 'Recipient Created Tax Invoice';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem(DataItem3733; "Purch. Inv. Header")
        {
            CalcFields = Amount, "Amount Including VAT";
            DataItemTableView = SORTING ("No.");
            RequestFilterFields = "No.", "Buy-from Vendor No.", "No. Printed";
            RequestFilterHeading = 'Posted Purchase Invoice';
            column(Purch__Inv__Header_No_; "No.")
            {
            }
            column(Total_Excl_GST; Amount)
            {
            }
            column(Total_Incl_GST; "Amount Including VAT")
            {
            }
            column(WHT_Amount; WHTAmount)
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING (Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING (Number)
                                        WHERE (Number = CONST (1));
                    column(Sales_Invoice_Header___Due_Date_; PaymentTerms.Description)
                    {
                    }
                    column(Purch__Inv__Header___Vendor_Invoice_No__; DataItem3733."Vendor Invoice No.")
                    {
                    }
                    column(BuyFromAddr_4_; VendAddr[4])
                    {
                    }
                    column(BuyFromAddr_5_; VendAddr[5])
                    {
                    }
                    column(BuyFromAddr_6_; VendAddr[6])
                    {
                    }
                    //column(STRSUBSTNO_Text005_FORMAT_CurrReport_PAGENO__; FORMAT(CurrReport.PAGENO))
                    //{
                    //}
                    column(BuyFromAddr_3_; VendAddr[3])
                    {
                    }
                    column(FORMAT__Purchase_Header___Document_Date__0_4_; FORMAT(DataItem3733."Posting Date"))
                    {
                    }
                    column(BuyFromAddr_2_; VendAddr[2])
                    {
                    }
                    column(Purchase_Header___No__; DataItem3733."No.")
                    {
                    }
                    column(BuyFromAddr_1_; VendAddr[1])
                    {
                    }
                    column(CompanyInfo_Picture; CompanyInfo.Picture)
                    {
                    }
                    column(CompanyInfo_City_____CompanyInfo_County_____CompanyInfo__Post_Code_; CompanyInfo.City + ' ' + CompanyInfo.County + ' ' + CompanyInfo."Post Code")
                    {
                    }
                    column(CompanyInfo_Address; CompanyInfo.Address)
                    {
                    }
                    column(Fax________CompanyInfo__Fax_No__; 'Fax: ' + ' ' + CompanyInfo."Fax No.")
                    {
                    }
                    column(Phone________CompanyInfo__Phone_No__; 'Phone: ' + ' ' + CompanyInfo."Phone No.")
                    {
                    }
                    column(ABN____CompanyInfo_ABN; 'ABN: ' + CompanyInfo.ABN)
                    {
                    }
                    column(CompanyInfo_Name; CompanyInfo.Name)
                    {
                    }
                    column(VendABNNo_Value; VendABNNo)
                    {
                    }
                    column(Company_Add_5; CompanyAddr[5])
                    {
                    }
                    column(Company_Add_4; CompanyAddr[4])
                    {
                    }
                    column(Company_Add_3; CompanyAddr[3])
                    {
                    }
                    column(Company_Add_2; CompanyAddr[2])
                    {
                    }
                    column(Company_Add_1; CompanyAddr[1])
                    {
                    }
                    column(PurchLine__Line_Amount__PurchLine__Inv__Discount_Amount____VATAmount; '$ ' + FORMAT(DataItem5707."Amount Including VAT", 0, '<Precision,2><Standard Format,0>'))
                    {
                        AutoFormatExpression = DataItem3733."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(TotalInclVATText; 'Balance Due')
                    {
                    }
                    column(VATAmountLine_VATAmountText; 'GST')
                    {
                    }
                    column(VATAmount; FORMAT(DataItem5707."Amount Including VAT" - DataItem5707.Amount, 0, '<Precision,2><Standard Format,0>'))
                    {
                        AutoFormatExpression = DataItem3733."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(TotalExclVATText; 'Subtotal')
                    {
                    }
                    column(PurchLine__Line_Amount__PurchLine__Inv__Discount_Amount__Control147; '$ ' + FORMAT(DataItem5707.Amount, 0, '<Precision,2><Standard Format,0>'))
                    {
                        AutoFormatExpression = DataItem3733."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(Vend__Fax_No__; Vend."Fax No.")
                    {
                    }
                    column(Vend_ABN; Vend.ABN)
                    {
                    }
                    column(Purchase_Invoice_Line_Amount_Inc_VAT; DataItem5707."Amount Including VAT")
                    {
                    }
                    column(Purchase_Invoice_Line_Amount_Exc_VAT; DataItem5707.Amount)
                    {
                    }
                    column(Purchase_Invoice_Line_VAT_Amount; DataItem5707."Amount Including VAT" - DataItem5707.Amount)
                    {
                    }
                    column(AccountName_Value; Vend.Name)
                    {
                    }
                    column(Sales_Invoice_Header___Due_Date_Caption; Sales_Invoice_Header___Due_Date_CaptionLbl)
                    {
                    }
                    column(Purch__Inv__Header___Vendor_Invoice_No__Caption; Purch__Inv__Header___Vendor_Invoice_No__CaptionLbl)
                    {
                    }
                    column(Page_Caption; Page_CaptionLbl)
                    {
                    }
                    column(Date_Caption; Date_CaptionLbl)
                    {
                    }
                    column(Order_No_Caption; Order_No_CaptionLbl)
                    {
                    }
                    column(Remittance_AdviceCaption; Remittance_AdviceCaptionLbl)
                    {
                    }
                    column(Vendor_ABN_No_Caption; Vendor_ABN_No_CaptionLbl)
                    {
                    }
                    column(AmountCaption; AmountCaptionLbl)
                    {
                    }
                    column(Purchase_Line__Description_Control63Caption; Purchase_Line__Description_Control63CaptionLbl)
                    {
                    }
                    column(Vendor_ABN_Caption; Vendor_ABN_CaptionLbl)
                    {
                    }
                    column(Vendor_Fax_Caption; Vendor_Fax_CaptionLbl)
                    {
                    }
                    column(EFT_Payment_toCaption; EFT_Payment_toCaptionLbl)
                    {
                    }
                    column(AccountName_Caption; AccountName_CaptionLbl)
                    {
                    }
                    column(PageLoop_Number; Number)
                    {
                    }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = DataItem3733;
                        DataItemTableView = SORTING (Number)
                                            WHERE (Number = FILTER (1 ..));

                        trigger OnAfterGetRecord()
                        begin
                            IF Number = 1 THEN BEGIN
                                IF NOT DimSetEntry1.FINDSET THEN
                                    CurrReport.BREAK;
                            END ELSE
                                IF NOT Continue THEN
                                    CurrReport.BREAK;

                            CLEAR(DimText);
                            Continue := FALSE;
                            REPEAT
                                OldDimText := DimText;
                                IF DimText = '' THEN
                                    DimText := STRSUBSTNO('%1 %2', DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code")
                                ELSE
                                    DimText :=
                                      STRSUBSTNO(
                                        '%1, %2 %3', DimText,
                                        DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code");
                                IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                    DimText := OldDimText;
                                    Continue := TRUE;
                                    EXIT;
                                END;
                            UNTIL DimSetEntry1.NEXT = 0;
                        end;

                        trigger OnPreDataItem()
                        begin
                            IF NOT ShowInternalInfo THEN
                                CurrReport.BREAK;
                        end;
                    }
                    dataitem(DataItem5707; "Purch. Inv. Line")
                    {
                        DataItemLink = "Document No." = FIELD ("No.");
                        DataItemLinkReference = DataItem3733;
                        DataItemTableView = SORTING ("Document No.", "Line No.");
                        column(Purchase_Line__Description; Description)
                        {
                        }
                        column(Purch__Inv__Line_Type; Type)
                        {
                        }
                        column(Purch__Inv__Line_Amount; Amount)
                        {
                        }
                        column(Purchase_Line___Line_Amount_; '$ ' + FORMAT(Amount, 0, '<Precision,2><Standard Format,0>'))
                        {
                            AutoFormatExpression = DataItem3733."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(Purchase_Line__Description_Control63; Description)
                        {
                        }
                        column(Purch__Inv__Line_Document_No_; "Document No.")
                        {
                        }
                        column(Purch__Inv__Line_Line_No_; "Line No.")
                        {
                        }
                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = SORTING (Number)
                                                WHERE (Number = FILTER (1 ..));

                            trigger OnAfterGetRecord()
                            begin
                                IF Number = 1 THEN BEGIN
                                    IF NOT DimSetEntry2.FINDSET THEN
                                        CurrReport.BREAK;
                                END ELSE
                                    IF NOT Continue THEN
                                        CurrReport.BREAK;

                                CLEAR(DimText);
                                Continue := FALSE;
                                REPEAT
                                    OldDimText := DimText;
                                    IF DimText = '' THEN
                                        DimText := STRSUBSTNO('%1 %2', DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code")
                                    ELSE
                                        DimText :=
                                          STRSUBSTNO(
                                            '%1, %2 %3', DimText,
                                            DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code");
                                    IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                        DimText := OldDimText;
                                        Continue := TRUE;
                                        EXIT;
                                    END;
                                UNTIL DimSetEntry2.NEXT = 0;
                            end;

                            trigger OnPreDataItem()
                            begin
                                IF NOT ShowInternalInfo THEN
                                    CurrReport.BREAK;

                                DimSetEntry2.SETRANGE("Dimension Set ID", DataItem5707."Dimension Set ID");
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            //IF (LinePrinted = MaxVertLine) AND (LineCount > MaxVertLine) THEN
                                //CurrReport.NEWPAGE;

                            IF (Type = Type::"G/L Account") AND (NOT ShowInternalInfo) THEN
                                "No." := '';

                            VATAmountLine.INIT;
                            VATAmountLine."VAT Identifier" := DataItem5707."VAT Identifier";
                            VATAmountLine."VAT Calculation Type" := "VAT Calculation Type";
                            VATAmountLine."Tax Group Code" := "Tax Group Code";
                            VATAmountLine."Use Tax" := "Use Tax";
                            VATAmountLine."VAT %" := "VAT %";
                            VATAmountLine."VAT Base" := Amount;
                            VATAmountLine."Amount Including VAT" := "Amount Including VAT";
                            VATAmountLine."Line Amount" := "Line Amount";
                            IF "Allow Invoice Disc." THEN
                                VATAmountLine."Inv. Disc. Base Amount" := "Line Amount";
                            VATAmountLine."Invoice Discount Amount" := "Inv. Discount Amount";
                            VATAmountLine.InsertLine;

                            //IF ISSERVICETIER THEN BEGIN
                                AllowVATDisctxt := FORMAT(DataItem5707."Allow Invoice Disc.");
                                PurchInLineTypeNo := DataItem5707.Type;
                            //END;
                        end;

                        trigger OnPreDataItem()
                        var
                            PurchInvLine: Record "Purch. Inv. Line";
                            VATIdentifier: Code[10];
                        begin
                            VATAmountLine.DELETEALL;
                            MoreLines := FIND('+');
                            WHILE MoreLines AND (Description = '') AND ("No." = '') AND (Quantity = 0) AND (Amount = 0) DO
                                MoreLines := NEXT(-1) <> 0;
                            IF NOT MoreLines THEN
                                CurrReport.BREAK;
                            SETRANGE("Line No.", 0, "Line No.");
                            //CurrReport.CREATETOTALS("Line Amount", "Inv. Discount Amount", Amount, "Amount Including VAT");

                            //IF ISSERVICETIER THEN BEGIN
                                PurchInvLine.SETRANGE("Document No.", DataItem3733."No.");
                                PurchInvLine.SETFILTER(Type, '<>%1', 0);
                                VATAmountText := '';
                                IF PurchInvLine.FIND('-') THEN BEGIN
                                    VATAmountText := STRSUBSTNO(Text011, PurchInvLine."VAT %");
                                    VATIdentifier := PurchInvLine."VAT Identifier";
                                    REPEAT
                                        IF (PurchInvLine."VAT Identifier" <> VATIdentifier) AND (PurchInvLine.Quantity <> 0) THEN
                                            VATAmountText := Text012;
                                    UNTIL PurchInvLine.NEXT = 0;
                                END;
                            //END;

                            LineCount := COUNT;
                        end;
                    }
                    dataitem(VertLineCounter; "Integer")
                    {
                        DataItemTableView = SORTING (Number);
                        column(VertLineCounter_Number; Number)
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            IF ((LineCount MOD MaxVertLine) <> 0) THEN
                                SETRANGE(Number, (LineCount MOD MaxVertLine) + 1, MaxVertLine)
                            ELSE
                                IF ((LineCount MOD MaxVertLine) = 0) AND (LineCount <> 0) THEN
                                    CurrReport.BREAK
                                ELSE
                                    IF (LineCount = 0) THEN
                                        SETRANGE(Number, 1, MaxVertLine);
                        end;
                    }
                    dataitem(VATCounter; "Integer")
                    {
                        DataItemTableView = SORTING (Number);

                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(Number);
                        end;

                        trigger OnPreDataItem()
                        begin
                            IF VATAmountLine.GetTotalVATAmount = 0 THEN
                                CurrReport.BREAK;
                            SETRANGE(Number, 1, VATAmountLine.COUNT);
                            //CurrReport.CREATETOTALS(
                              //VATAmountLine."Line Amount", VATAmountLine."Inv. Disc. Base Amount",
                              //VATAmountLine."Invoice Discount Amount", VATAmountLine."VAT Base", VATAmountLine."VAT Amount");
                        end;
                    }
                    dataitem(VATCounterLCY; "Integer")
                    {
                        DataItemTableView = SORTING (Number);

                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(Number);

                            VALVATBaseLCY := ROUND(VATAmountLine."VAT Base" / DataItem3733."Currency Factor");
                            VALVATAmountLCY := ROUND(VATAmountLine."VAT Amount" / DataItem3733."Currency Factor");
                        end;

                        trigger OnPreDataItem()
                        begin
                            IF (NOT GLSetup."Print VAT specification in LCY") OR
                               (DataItem3733."Currency Code" = '') OR
                               (VATAmountLine.GetTotalVATAmount = 0) THEN
                                CurrReport.BREAK;

                            SETRANGE(Number, 1, VATAmountLine.COUNT);
                            //CurrReport.CREATETOTALS(VALVATBaseLCY, VALVATAmountLCY);

                            IF GLSetup."LCY Code" = '' THEN
                                VALSpecLCYHeader := Text007 + Text008
                            ELSE
                                VALSpecLCYHeader := Text007 + FORMAT(GLSetup."LCY Code");

                            CurrExchRate.FindCurrency(DataItem3733."Posting Date", DataItem3733."Currency Code", 1);
                            CalculatedExchRate := ROUND(1 / DataItem3733."Currency Factor" * CurrExchRate."Exchange Rate Amount", 0.000001);
                            VALExchRate := STRSUBSTNO(Text009, CalculatedExchRate, CurrExchRate."Exchange Rate Amount");
                        end;
                    }
                    dataitem(Total; "Integer")
                    {
                        DataItemTableView = SORTING (Number)
                                            WHERE (Number = CONST (1));
                    }
                    dataitem(Total2; "Integer")
                    {
                        DataItemTableView = SORTING (Number)
                                            WHERE (Number = CONST (1));

                        trigger OnPreDataItem()
                        begin
                            IF DataItem3733."Buy-from Vendor No." = DataItem3733."Pay-to Vendor No." THEN
                                CurrReport.BREAK;
                        end;
                    }
                    dataitem(Total3; "Integer")
                    {
                        DataItemTableView = SORTING (Number)
                                            WHERE (Number = CONST (1));

                        trigger OnPreDataItem()
                        begin
                            IF ShipToAddr[1] = '' THEN
                                CurrReport.BREAK;
                        end;
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    IF Number > 1 THEN BEGIN
                        OutputNo := OutputNo + 1;
                        CopyText := Text003;
                    END;
                    //CurrReport.PAGENO := 1;
                end;

                trigger OnPostDataItem()
                begin
                    IF NOT CurrReport.PREVIEW THEN
                        PurchInvCountPrinted.RUN(DataItem3733);
                end;

                trigger OnPreDataItem()
                begin
                    OutputNo := 1;
                    NoOfLoops := ABS(NoOfCopies) + 1;
                    CopyText := '';
                    SETRANGE(Number, 1, NoOfLoops);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");

                CompanyInfo.GET;
                CompanyInfo.CALCFIELDS(Picture);
                IF RespCenter.GET("Responsibility Center") THEN BEGIN
                    FormatAddr.RespCenter(CompanyAddr, RespCenter);
                    CompanyInfo."Phone No." := RespCenter."Phone No.";
                    CompanyInfo."Fax No." := RespCenter."Fax No.";
                END ELSE BEGIN
                    FormatAddr.Company(CompanyAddr, CompanyInfo);
                END;
                FormatAddr.Company(CompanyAddr, CompanyInfo);

                //PostedDocDim1.SETRANGE("Table ID",DATABASE::DataItem3733);
                //PostedDocDim1.SETRANGE("Document No.",DataItem3733."No.");
                DimSetEntry1.SETRANGE("Dimension Set ID", "Dimension Set ID");

                IF "Order No." = '' THEN
                    OrderNoText := ''
                ELSE
                    OrderNoText := FIELDCAPTION("Order No.");
                IF "Purchaser Code" = '' THEN BEGIN
                    CLEAR(SalesPurchPerson);
                    PurchaserText := '';
                END ELSE BEGIN
                    SalesPurchPerson.GET("Purchaser Code");
                    PurchaserText := Text000
                END;
                IF "Your Reference" = '' THEN
                    ReferenceText := ''
                ELSE
                    ReferenceText := FIELDCAPTION("Your Reference");
                IF "VAT Registration No." = '' THEN
                    VATNoText := ''
                ELSE
                    VATNoText := FIELDCAPTION("VAT Registration No.");
                IF "Currency Code" = '' THEN BEGIN
                    GLSetup.TESTFIELD("LCY Code");
                    TotalText := STRSUBSTNO(Text001, GLSetup."LCY Code");
                    TotalInclVATText := STRSUBSTNO(Text002, GLSetup."LCY Code");
                    TotalExclVATText := STRSUBSTNO(Text006, GLSetup."LCY Code");
                END ELSE BEGIN
                    TotalText := STRSUBSTNO(Text001, "Currency Code");
                    TotalInclVATText := STRSUBSTNO(Text002, "Currency Code");
                    TotalExclVATText := STRSUBSTNO(Text006, "Currency Code");
                    TotalInclVATTextLCY := STRSUBSTNO(Text002, GLSetup."LCY Code");
                    TotalExclVATTextLCY := STRSUBSTNO(Text006, GLSetup."LCY Code");
                END;
                //>>Get Vendor ABN No.
                IF "Pay-to Vendor No." <> '' THEN BEGIN
                    VendABNNo := '';
                    VendRec.RESET;
                    IF VendRec.GET("Pay-to Vendor No.") THEN BEGIN
                        VendABNNo := VendRec.ABN;
                    END;
                END;
                //<<Get Vendor ABN No.
                FormatAddr.PurchInvPayTo(VendAddr, DataItem3733);
                IF "Payment Terms Code" = '' THEN
                    PaymentTerms.INIT
                ELSE BEGIN
                    PaymentTerms.GET("Payment Terms Code");
                    PaymentTerms.TranslateDescription(PaymentTerms, "Language Code");
                END;
                IF "Shipment Method Code" = '' THEN
                    ShipmentMethod.INIT
                ELSE BEGIN
                    ShipmentMethod.GET("Shipment Method Code");
                    ShipmentMethod.TranslateDescription(ShipmentMethod, "Language Code");
                END;

                Vend.GET("Buy-from Vendor No.");
                FormatAddr.PurchInvShipTo(ShipToAddr, DataItem3733);

                CALCFIELDS(Amount);
                CALCFIELDS("Amount Including VAT");

                AmountLCY :=
                  ROUND(
                    CurrExchRate.ExchangeAmtFCYToLCY(
                      WORKDATE, "Currency Code", Amount, "Currency Factor"));
                AmountIncLCY :=
                  ROUND(
                    CurrExchRate.ExchangeAmtFCYToLCY(
                      WORKDATE, "Currency Code", "Amount Including VAT", "Currency Factor"));
                //PurchaseLine.InitTextVariable;
                //PurchaseLine.FormatNoText(AmountLangA, "Amount Including VAT", "Currency Code");
                //IF ShowTHFormatting THEN BEGIN
                //    PurchaseLine.InitTextVariableTH;
                //    PurchaseLine.FormatNoTextTH(AmountLangB, "Amount Including VAT", "Currency Code");
                //END ELSE BEGIN
                AmountLangB[1] := '';
                AmountLangB[2] := '';
                //END;

                IF LogInteraction THEN
                    IF NOT CurrReport.PREVIEW THEN
                        SegManagement.LogDocument(
                          14, "No.", 0, 0, DATABASE::Vendor, "Buy-from Vendor No.", "Purchaser Code", '', "Posting Description", '');

                //IF ISSERVICETIER THEN
                    PricesInclVATtxt := FORMAT(DataItem3733."Prices Including VAT");

                // CAREPOINT1.00 2015-10-13 Start:
                WHTAmount := 0;
                WHTEntry.RESET;
                WHTEntry.SETRANGE("Document No.", DataItem3733."No.");
                WHTEntry.SETRANGE("Document Type", WHTEntry."Document Type"::Invoice);
                IF WHTEntry.FINDFIRST THEN
                    WHTAmount := WHTEntry.Amount;

                // CAREPOINT1.00 2015-10-13 End:
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
                    field(NoOfCopies; NoOfCopies)
                    {
                        Caption = 'No. of Copies';
                    }
                    field(ShowInternalInfo; ShowInternalInfo)
                    {
                        Caption = 'Show Internal Information';
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                    }
                    field(AmountInWords; AmountInWords)
                    {
                        Caption = 'Show Total In Words';
                    }
                    field(CurrencyLCY; CurrencyLCY)
                    {
                        Caption = 'Show LCY for FCY';
                    }
                    field(ShowTHFormatting; ShowTHFormatting)
                    {
                        Caption = 'Show TH Amount In Words';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit()
        begin
            LogInteractionEnable := TRUE;
        end;

        trigger OnOpenPage()
        begin
            LogInteraction := SegManagement.FindInteractTmplCode(14) <> '';
            LogInteractionEnable := LogInteraction;
        end;
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        GLSetup.GET;
        MaxVertLine := 25;
    end;

    var
        Text000: Label 'Purchaser';
        Text001: Label 'Total %1';
        Text002: Label 'Total %1 Incl. VAT';
        Text003: Label 'COPY';
        Text004: Label 'Purchase - Invoice %1';
        Text005: Label 'Page %1';
        Text006: Label 'Total %1 Excl. VAT';
        GLSetup: Record "General Ledger Setup";
        CompanyInfo: Record "Company Information";
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        VATAmountLine: Record "VAT Amount Line" temporary;
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        RespCenter: Record "Responsibility Center";
        Language: Record "Language";
        CurrExchRate: Record "Currency Exchange Rate";
        PurchInvCountPrinted: Codeunit "Purch. Inv.-Printed";
        FormatAddr: Codeunit "Format Address";
        SegManagement: Codeunit "SegManagement";
        VendAddr: array[8] of Text[50];
        ShipToAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        PurchaserText: Text[30];
        VATNoText: Text[80];
        ReferenceText: Text[80];
        OrderNoText: Text[80];
        TotalText: Text[50];
        TotalInclVATText: Text[50];
        TotalExclVATText: Text[50];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[10];
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        LogInteraction: Boolean;
        VALVATBaseLCY: Decimal;
        VALVATAmountLCY: Decimal;
        VALSpecLCYHeader: Text[80];
        VALExchRate: Text[50];
        Text007: Label 'VAT Amount Specification in ';
        Text008: Label 'Local Currency';
        Text009: Label 'Exchange rate: %1/%2';
        CalculatedExchRate: Decimal;
        TotalInclVATTextLCY: Text[50];
        TotalExclVATTextLCY: Text[50];
        AmountLCY: Decimal;
        AmountIncLCY: Decimal;
        CurrencyLCY: Boolean;
        AmountInWords: Boolean;
        AmountLangA: array[2] of Text[80];
        AmountLangB: array[2] of Text[80];
        PurchaseLine: Record "Purchase Line";
        ShowTHFormatting: Boolean;
        Text010: Label 'Purchase - Prepayment Invoice %1';
        OutputNo: Integer;
        PricesInclVATtxt: Text[30];
        AllowVATDisctxt: Text[30];
        VATAmountText: Text[30];
        Text011: Label '%1% VAT';
        Text012: Label 'VAT Amount';
        PurchInLineTypeNo: Integer;
        [InDataSet]
        LogInteractionEnable: Boolean;
        MaxVertLine: Integer;
        MaxVertLine1: Integer;
        LinePrinted: Integer;
        LineCount: Integer;
        Vend: Record "Vendor";
        VendRec: Record "Vendor";
        VendABNNo: Text[30];
        Sales_Invoice_Header___Due_Date_CaptionLbl: Label 'Terms:';
        Purch__Inv__Header___Vendor_Invoice_No__CaptionLbl: Label 'Vendor Ref:';
        Page_CaptionLbl: Label 'Page:';
        Date_CaptionLbl: Label 'Date:';
        Order_No_CaptionLbl: Label 'Tax Invoice No.:';
        Remittance_AdviceCaptionLbl: Label 'RECIPIENT CREATED TAX INVOICE';
        Vendor_ABN_No_CaptionLbl: Label 'ABN :';
        AmountCaptionLbl: Label 'Total (Excl. GST)';
        Purchase_Line__Description_Control63CaptionLbl: Label 'Description';
        Vendor_ABN_CaptionLbl: Label 'Vendor ABN:';
        Vendor_Fax_CaptionLbl: Label 'Vendor Fax:';
        EFT_Payment_toCaptionLbl: Label 'EFT Payment to';
        AccountName_CaptionLbl: Label 'Account Name';
        WHTAmount: Decimal;
        WHTEntry: Record "WHT Entry";

    local procedure DocumentCaption(): Text[250]
    begin
        IF DataItem3733."Prepayment Invoice" THEN
            EXIT(Text010);
        EXIT(Text004);
    end;
}

