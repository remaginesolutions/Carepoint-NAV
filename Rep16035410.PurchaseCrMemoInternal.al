report 16035410 "Purchase - Cr. Memo Internal"
{
    // version CAREPOINT1.00

    // CAREPOINT1.00 2017-01-01: Object created
    DefaultLayout = RDLC;
    RDLCLayout = './Purchase - Cr. Memo Internal.rdlc';

    Caption = 'Purchase - Credit Memo';
    PreviewMode = PrintLayout;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem(DataItem9869; "Purch. Cr. Memo Hdr.")
        {
            DataItemTableView = SORTING ("No.");
            RequestFilterFields = "No.", "Buy-from Vendor No.", "No. Printed";
            RequestFilterHeading = 'Posted Purchase Cr. Memo';
            column(No_PurchCrMemoHeader; "No.")
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING (Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING (Number)
                                        WHERE (Number = CONST (1));
                    column(CompanyInfoEmail; CompanyInfo."E-Mail")
                    {
                    }
                    column(CompanyInfoHomePage; CompanyInfo."Home Page")
                    {
                    }
                    column(DocumentCaption; STRSUBSTNO(DocumentCaption, CopyText))
                    {
                    }
                    column(VendAddr1; VendAddr[1])
                    {
                    }
                    column(CompanyAddr1; CompanyAddr[1])
                    {
                    }
                    column(VendAddr2; VendAddr[2])
                    {
                    }
                    column(CompanyAddr2; CompanyAddr[2])
                    {
                    }
                    column(VendAddr3; VendAddr[3])
                    {
                    }
                    column(CompanyAddr3; CompanyAddr[3])
                    {
                    }
                    column(VendAddr4; VendAddr[4])
                    {
                    }
                    column(CompanyAddr4; CompanyAddr[4])
                    {
                    }
                    column(VendAddr5; VendAddr[5])
                    {
                    }
                    column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
                    {
                    }
                    column(VendAddr6; VendAddr[6])
                    {
                    }
                    column(CompanyInfoVATRegNo; CompanyInfo."VAT Registration No.")
                    {
                    }
                    column(CompanyInfoGiroNo; CompanyInfo."Giro No.")
                    {
                    }
                    column(CompanyInfoBankName; CompanyInfo."Bank Name")
                    {
                    }
                    column(CompanyInfoBankAccountNo; CompanyInfo."Bank Account No.")
                    {
                    }
                    column(CompanyInfoHomePage1; CompanyInfo."Home Page")
                    {
                    }
                    column(CompanyInfoEmail1; CompanyInfo."E-Mail")
                    {
                    }
                    column(VendAddr7; VendAddr[7])
                    {
                    }
                    column(VendAddr8; VendAddr[8])
                    {
                    }
                    column(CompanyAddr5; CompanyAddr[5])
                    {
                    }
                    column(CompanyAddr6; CompanyAddr[6])
                    {
                    }
                    column(CompanyInfoABNDivPartNo; CompanyInfo."ABN Division Part No.")
                    {
                    }
                    column(CompanyInfoABN; CompanyInfo.ABN)
                    {
                    }
                    column(PaytoVendNo_PurchCrMemoHeader; DataItem9869."Pay-to Vendor No.")
                    {
                    }
                    column(PaytoVendNo_PurchCrMemoHeaderCaption; DataItem9869.FIELDCAPTION("Pay-to Vendor No."))
                    {
                    }
                    column(VATNoText; VATNoText)
                    {
                    }
                    column(VATRegNo_PurchCrMemoHeader; DataItem9869."VAT Registration No.")
                    {
                    }
                    column(PurchaserText; PurchaserText)
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(ReferenceText; ReferenceText)
                    {
                    }
                    column(BuyfromVendNo_PurchCrMemoHeader; DataItem9869."Buy-from Vendor No.")
                    {
                    }
                    column(YourRef_PurchCrMemoHeader; DataItem9869."Your Reference")
                    {
                    }
                    column(DocDate_PurchCrMemoHeader; FORMAT(DataItem9869."Document Date", 0, 4))
                    {
                    }
                    column(AppliedToText; AppliedToText)
                    {
                    }
                    column(ReturnOrderNoText; ReturnOrderNoText)
                    {
                    }
                    column(No1_PurchCrMemoHeader; DataItem9869."No.")
                    {
                    }
                    column(PostDate_PurchCrMemoHeader; DataItem9869."Posting Date")
                    {
                    }
                    column(PostDate_PurchCrMemoHeaderCaption; DataItem9869.FIELDCAPTION("Posting Date"))
                    {
                    }
                    column(PricesInclVAT_PurchCrMemoHeader; DataItem9869."Prices Including VAT")
                    {
                    }
                    column(PricesInclVAT_PurchCrMemoHeaderCaption; DataItem9869.FIELDCAPTION("Prices Including VAT"))
                    {
                    }
                    column(ReturnOrderNo_PurchCrMemoHeader; DataItem9869."Return Order No.")
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(ABNDivPartNo_PurchCrMemoHeader; DataItem9869."ABN Division Part No.")
                    {
                    }
                    column(ABN_PurchCrMemoHeader; DataItem9869.ABN)
                    {
                    }
                    column(ReasonCode_PurchCrMemoHeader; DataItem9869."Reason Code")
                    {
                    }
                    column(OriginalInvDate; OriginalInvDate)
                    {
                    }
                    column(GSTEnabled; GSTEnabled)
                    {
                    }
                    column(PhoneNoCaption; PhoneNoCaptionLbl)
                    {
                    }
                    column(VATRegNoCaption; VATRegNoCaptionLbl)
                    {
                    }
                    column(GiroNoCaption; GiroNoCaptionLbl)
                    {
                    }
                    column(BankNameCaption; BankNameCaptionLbl)
                    {
                    }
                    column(BankAccNoCaption; BankAccNoCaptionLbl)
                    {
                    }
                    column(ABNDivisionPartNoCaption; ABNDivisionPartNoCaptionLbl)
                    {
                    }
                    column(ABNCaption; ABNCaptionLbl)
                    {
                    }
                    column(CreditMemoNoCaption; CreditMemoNoCaptionLbl)
                    {
                    }
                    column(ReasonCodeCaption; ReasonCodeCaptionLbl)
                    {
                    }
                    column(OriginalInvNoCaption; OriginalInvNoCaptionLbl)
                    {
                    }
                    column(OriginalInvDateCaption; OriginalInvDateCaptionLbl)
                    {
                    }
                    column(DocumentDtCaption; DocumentDtCaptionLbl)
                    {
                    }
                    column(HomePageCaption; HomePageCaptionLbl)
                    {
                    }
                    column(EmailCaption; EmailCaptionLbl)
                    {
                    }
                    column(BuyFromVendorCaption; BuyFromVendorCaptionLbl)
                    {
                    }
                    column(PageCaption; PageCaptionLbl)
                    {
                    }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = DataItem9869;
                        DataItemTableView = SORTING (Number)
                                            WHERE (Number = FILTER (1 ..));
                        column(DimText; DimText)
                        {
                        }
                        column(HeaderDimensionsCaption; HeaderDimensionsCaptionLbl)
                        {
                        }

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
                    dataitem(DataItem7507; "Purch. Cr. Memo Line")
                    {
                        DataItemLink = "Document No." = FIELD ("No.");
                        DataItemLinkReference = DataItem9869;
                        DataItemTableView = SORTING ("Document No.", "Line No.");
                        column(ShowInternalInfo; ShowInternalInfo)
                        {
                        }
                        column(AllowInvDiscount; AllowInvDiscount)
                        {
                        }
                        column(PricesIncludingVAT; PricesIncludingVAT)
                        {
                        }
                        column(Type_PurchCrMemoLine; FORMAT(DataItem7507.Type, 0, 2))
                        {
                        }
                        column(VATBasDisc_PurchCrMemoHeader; DataItem9869."VAT Base Discount %")
                        {
                        }
                        column(VATAmountText; VATAmountText)
                        {
                        }
                        column(LineAmount_PurchCrMemoLine; "Line Amount")
                        {
                            AutoFormatExpression = DataItem7507.GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(Desc_PurchCrMemoLine; Description)
                        {
                        }
                        column(Desc_PurchCrMemoLineCaption; FIELDCAPTION(Description))
                        {
                        }
                        column(No_PurchCrMemoLine; "No.")
                        {
                        }
                        column(No_PurchCrMemoLineCaption; FIELDCAPTION("No."))
                        {
                        }
                        column(Quantity_PurchCrMemoLine; Quantity)
                        {
                        }
                        column(Quantity_PurchCrMemoLineCaption; FIELDCAPTION(Quantity))
                        {
                        }
                        column(UOM_PurchCrMemoLine; "Unit of Measure")
                        {
                        }
                        column(UOM_PurchCrMemoLineCaption; FIELDCAPTION("Unit of Measure"))
                        {
                        }
                        column(DirectUnitCost_PurchCrMemoLine; "Direct Unit Cost")
                        {
                            AutoFormatExpression = DataItem7507.GetCurrencyCode;
                            AutoFormatType = 2;
                        }
                        column(LineDisc_PurchCrMemoLine; "Line Discount %")
                        {
                        }
                        column(AllowInvDisc_PurchCrMemoLine; "Allow Invoice Disc.")
                        {
                            IncludeCaption = false;
                        }
                        column(VATIdent_PurchCrMemoLine; "VAT Identifier")
                        {
                        }
                        column(VATIdent_PurchCrMemoLineCaption; FIELDCAPTION("VAT Identifier"))
                        {
                        }
                        column(InvDisctAmt_PurchCrMemoLine; -"Inv. Discount Amount")
                        {
                            AutoFormatExpression = DataItem7507.GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(TotalText; TotalText)
                        {
                        }
                        column(Amount_PurchCrMemoLine; Amount)
                        {
                            AutoFormatExpression = DataItem7507.GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(TotalExclVATText; TotalExclVATText)
                        {
                        }
                        column(TotalInclVATText; TotalInclVATText)
                        {
                        }
                        column(AmtInclVAT_PurchCrMemoLine; "Amount Including VAT")
                        {
                            AutoFormatExpression = DataItem7507.GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(AmountIncludingVATAmount; "Amount Including VAT" - Amount)
                        {
                            AutoFormatExpression = DataItem7507.GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATAmtText; VATAmountLine.VATAmountText)
                        {
                        }
                        column(AmountIncLCY; AmountIncLCY)
                        {
                            AutoFormatExpression = DataItem7507.GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(CurrFactor_PurchCrMemoHeader; DataItem9869."Currency Factor")
                        {
                        }
                        column(TotalExclVATTextLCY; TotalExclVATTextLCY)
                        {
                        }
                        column(TotalInclVATTextLCY; TotalInclVATTextLCY)
                        {
                        }
                        column(AmountIncLCYAmountLCY; AmountIncLCY - AmountLCY)
                        {
                            AutoFormatExpression = DataItem7507.GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(AmountLCY; AmountLCY)
                        {
                            AutoFormatExpression = DataItem7507.GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(CurrencyLCY; CurrencyLCY)
                        {
                        }
                        column(CurrCode_PurchCrMemoHeader; DataItem9869."Currency Code")
                        {
                        }
                        column(AmountLangB1AmountLangB2; AmountLangB[1] + ' ' + AmountLangB[2])
                        {
                        }
                        column(AmountLangA1AmountLangA2; AmountLangA[1] + ' ' + AmountLangA[2])
                        {
                        }
                        column(AmountInWords; AmountInWords)
                        {
                        }
                        column(LineNo_PurchCrMemoLine; "Line No.")
                        {
                        }
                        column(TotalSubTotal; TotalSubTotal)
                        {
                            AutoFormatExpression = DataItem9869."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalInvDiscountAmount; TotalInvoiceDiscountAmount)
                        {
                            AutoFormatExpression = DataItem9869."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalAmount; TotalAmount)
                        {
                            AutoFormatExpression = DataItem9869."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalAmountInclVAT; TotalAmountInclVAT)
                        {
                            AutoFormatExpression = DataItem9869."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalAmountVAT; TotalAmountVAT)
                        {
                            AutoFormatExpression = DataItem9869."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalPaymentDiscountOnVAT; TotalPaymentDiscountOnVAT)
                        {
                            AutoFormatType = 1;
                        }
                        column(DirectUnitCostCaption; DirectUnitCostCaptionLbl)
                        {
                        }
                        column(DiscountPercentCaption; DiscountPercentCaptionLbl)
                        {
                        }
                        column(AmountCaption; AmountCaptionLbl)
                        {
                        }
                        column(InvDiscountAmtCaption; InvDiscountAmtCaptionLbl)
                        {
                        }
                        column(SubtotalCaption; SubtotalCaptionLbl)
                        {
                        }
                        column(PaymentDiscVATCaption; PaymentDiscVATCaptionLbl)
                        {
                        }
                        column(ExchangeRateCaption; ExchangeRateCaptionLbl)
                        {
                        }
                        column(AllowInvoiceDiscountCaption; AllowInvoiceDiscountCaptionLbl)
                        {
                        }
                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = SORTING (Number)
                                                WHERE (Number = FILTER (1 ..));
                            column(DimText1; DimText)
                            {
                            }
                            column(LineDimensionsCaption; LineDimensionsCaptionLbl)
                            {
                            }

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

                                DimSetEntry2.SETRANGE("Dimension Set ID", DataItem7507."Dimension Set ID");
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            IF (Type = Type::"G/L Account") AND (NOT ShowInternalInfo) THEN
                                "No." := '';

                            VATAmountLine.INIT;
                            VATAmountLine."VAT Identifier" := DataItem7507."VAT Identifier";
                            VATAmountLine."VAT Calculation Type" := "VAT Calculation Type";
                            VATAmountLine."Tax Group Code" := "Tax Group Code";
                            VATAmountLine."Use Tax" := "Use Tax";
                            VATAmountLine."VAT %" := "VAT %";
                            VATAmountLine."VAT Base" := Amount;
                            VATAmountLine."VAT Amount" := "Amount Including VAT" - Amount;
                            VATAmountLine."Amount Including VAT" := "Amount Including VAT";
                            VATAmountLine."Line Amount" := "Line Amount";
                            IF "Allow Invoice Disc." THEN
                                VATAmountLine."Inv. Disc. Base Amount" := "Line Amount";
                            VATAmountLine."Invoice Discount Amount" := "Inv. Discount Amount";
                            VATAmountLine.InsertLine;

                            AllowInvDiscount := FORMAT(DataItem7507."Allow Invoice Disc.");

                            TotalSubTotal += "Line Amount";
                            TotalInvoiceDiscountAmount -= "Inv. Discount Amount";
                            TotalAmount += Amount;
                            TotalAmountVAT += "Amount Including VAT" - Amount;
                            TotalAmountInclVAT += "Amount Including VAT";
                            TotalPaymentDiscountOnVAT += -("Line Amount" - "Inv. Discount Amount" - "Amount Including VAT");
                        end;

                        trigger OnPreDataItem()
                        var
                            PurchCrMemoLine: Record "Purch. Cr. Memo Line";
                            VATIdentifier: Code[10];
                        begin
                            VATAmountLine.DELETEALL;
                            MoreLines := FIND('+');
                            WHILE MoreLines AND (Description = '') AND ("No." = '') AND (Quantity = 0) AND (Amount = 0) DO
                                MoreLines := NEXT(-1) <> 0;
                            IF NOT MoreLines THEN
                                CurrReport.BREAK;
                            SETRANGE("Line No.", 0, "Line No.");
                            CurrReport.CREATETOTALS("Line Amount", Amount, "Amount Including VAT", "Inv. Discount Amount");

                            PurchCrMemoLine.SETRANGE("Document No.", DataItem9869."No.");
                            PurchCrMemoLine.SETFILTER(Type, '<>%1', 0);
                            VATAmountText := '';
                            IF PurchCrMemoLine.FIND('-') THEN BEGIN
                                VATAmountText := STRSUBSTNO(Text012, PurchCrMemoLine."VAT %");
                                VATIdentifier := PurchCrMemoLine."VAT Identifier";
                                REPEAT
                                    IF (PurchCrMemoLine."VAT Identifier" <> VATIdentifier) AND (PurchCrMemoLine.Quantity <> 0) THEN
                                        VATAmountText := Text013;
                                UNTIL PurchCrMemoLine.NEXT = 0;
                            END;
                            AllowInvDiscount := FORMAT(DataItem7507."Allow Invoice Disc.");
                        end;
                    }
                    dataitem(VATCounter; "Integer")
                    {
                        DataItemTableView = SORTING (Number);
                        column(VATAmountLineVATBase; VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = DataItem9869."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLineVATAmount; VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = DataItem9869."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLineLineAmount; VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = DataItem9869."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineInvDiscBaseAmt; VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = DataItem9869."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineInvoiceDiscAmt; VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = DataItem9869."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLineVAT; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATAmtLineVATIdentifier; VATAmountLine."VAT Identifier")
                        {
                        }
                        column(VATPercentCaption; VATPercentCaptionLbl)
                        {
                        }
                        column(VATBaseCaption; VATBaseCaptionLbl)
                        {
                        }
                        column(VATAmountCaption; VATAmountCaptionLbl)
                        {
                        }
                        column(VATAmtSpecCaption; VATAmtSpecCaptionLbl)
                        {
                        }
                        column(VATIdentifierCaption; VATIdentifierCaptionLbl)
                        {
                        }
                        column(LineAmountCaption; LineAmountCaptionLbl)
                        {
                        }
                        column(InvDiscBaseAmtCaption; InvDiscBaseAmtCaptionLbl)
                        {
                        }
                        column(TotalCaption; TotalCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(Number);
                        end;

                        trigger OnPreDataItem()
                        begin
                            SETRANGE(Number, 1, VATAmountLine.COUNT);
                            CurrReport.CREATETOTALS(
                              VATAmountLine."Line Amount", VATAmountLine."Inv. Disc. Base Amount",
                              VATAmountLine."Invoice Discount Amount", VATAmountLine."VAT Base", VATAmountLine."VAT Amount");
                        end;
                    }
                    dataitem(VATCounterLCY; "Integer")
                    {
                        DataItemTableView = SORTING (Number);
                        column(VALExchRate; VALExchRate)
                        {
                        }
                        column(VALSpecLCYHeader; VALSpecLCYHeader)
                        {
                        }
                        column(VALVATAmountLCY; VALVATAmountLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATBaseLCY; VALVATBaseLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VATAmountLineVAT1; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATAmtLineVATIdentifier1; VATAmountLine."VAT Identifier")
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(Number);
                            VALVATBaseLCY :=
                              VATAmountLine.GetBaseLCY(
                                DataItem9869."Posting Date", DataItem9869."Currency Code",
                                DataItem9869."Currency Factor");
                            VALVATAmountLCY :=
                              VATAmountLine.GetAmountLCY(
                                DataItem9869."Posting Date", DataItem9869."Currency Code",
                                DataItem9869."Currency Factor");
                        end;

                        trigger OnPreDataItem()
                        begin
                            IF (NOT GLSetup."Print VAT specification in LCY") OR
                               (DataItem9869."Currency Code" = '')
                            THEN
                                CurrReport.BREAK;

                            SETRANGE(Number, 1, VATAmountLine.COUNT);
                            CurrReport.CREATETOTALS(VALVATBaseLCY, VALVATAmountLCY);

                            IF GLSetup."LCY Code" = '' THEN
                                VALSpecLCYHeader := Text008 + Text009
                            ELSE
                                VALSpecLCYHeader := Text008 + FORMAT(GLSetup."LCY Code");

                            CurrExchRate.FindCurrency(DataItem9869."Posting Date", DataItem9869."Currency Code", 1);
                            CalculatedExchRate := ROUND(1 / DataItem9869."Currency Factor" * CurrExchRate."Exchange Rate Amount", 0.000001);
                            VALExchRate := STRSUBSTNO(Text010, CalculatedExchRate, CurrExchRate."Exchange Rate Amount");
                        end;
                    }
                    dataitem(Total; "Integer")
                    {
                        DataItemTableView = SORTING (Number)
                                            WHERE (Number = CONST (1));

                        trigger OnPreDataItem()
                        begin
                            IF DataItem9869."Buy-from Vendor No." = DataItem9869."Pay-to Vendor No." THEN
                                CurrReport.BREAK;
                        end;
                    }
                    dataitem(Total2; "Integer")
                    {
                        DataItemTableView = SORTING (Number)
                                            WHERE (Number = CONST (1));
                        column(ShipToAddr1; ShipToAddr[1])
                        {
                        }
                        column(ShipToAddr2; ShipToAddr[2])
                        {
                        }
                        column(ShipToAddr3; ShipToAddr[3])
                        {
                        }
                        column(ShipToAddr4; ShipToAddr[4])
                        {
                        }
                        column(ShipToAddr5; ShipToAddr[5])
                        {
                        }
                        column(ShipToAddr6; ShipToAddr[6])
                        {
                        }
                        column(ShipToAddr7; ShipToAddr[7])
                        {
                        }
                        column(ShipToAddr8; ShipToAddr[8])
                        {
                        }
                        column(ShiptoAddressCaption; ShiptoAddressCaptionLbl)
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            IF ShipToAddr[1] = '' THEN
                                CurrReport.BREAK;
                        end;
                    }

                    trigger OnPreDataItem()
                    begin
                        //GSTEnabled := GLSetup.GSTEnabled(DataItem9869."Document Date");
                        GSTEnabled := True;
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    IF Number > 1 THEN BEGIN
                        CopyText := FormatDocument.GetCOPYText;
                        OutputNo += 1;
                    END;
                    CurrReport.PAGENO := 1;

                    TotalSubTotal := 0;
                    TotalInvoiceDiscountAmount := 0;
                    TotalAmount := 0;
                    TotalAmountVAT := 0;
                    TotalAmountInclVAT := 0;
                    TotalPaymentDiscountOnVAT := 0;
                end;

                trigger OnPostDataItem()
                begin
                    IF NOT CurrReport.PREVIEW THEN
                        CODEUNIT.RUN(CODEUNIT::"PurchCrMemo-Printed", DataItem9869);
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

                FormatAddressFields(DataItem9869);
                FormatDocumentFields(DataItem9869);

                DimSetEntry1.SETRANGE("Dimension Set ID", "Dimension Set ID");

                IF "Applies-to Doc. No." = '' THEN
                    AppliedToText := ''
                ELSE
                    //IF GLSetup.GSTEnabled(PurchInvHeader."Document Date") THEN BEGIN
                    AppliedToText := "Applies-to Doc. No.";
                IF PurchInvHeader.GET("Adjustment Applies-to") THEN
                    OriginalInvDate := PurchInvHeader."Document Date"
                ELSE
                    OriginalInvDate := 0D;
                //END ELSE
                //    AppliedToText := FORMAT(STRSUBSTNO(Text003, FORMAT("Applies-to Doc. Type"), "Applies-to Doc. No."));

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
                          16, "No.", 0, 0, DATABASE::Vendor, "Buy-from Vendor No.", "Purchaser Code", '', "Posting Description", '');

                PricesIncludingVAT := FORMAT(DataItem9869."Prices Including VAT");
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
                    field(NoOfCopies; NoOfCopies)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'No. of Copies';
                        ToolTip = 'Specifies how many copies of the document to print.';
                    }
                    field(ShowInternalInfo; ShowInternalInfo)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Internal Information';
                        ToolTip = 'Specifies if the document shows internal information.';
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies that interactions with the contact are logged.';
                    }
                    field(ShowTotalInWords; AmountInWords)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Total In Words';
                    }
                    field(ShowLCYForFCY; CurrencyLCY)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show LCY for FCY';
                    }
                    field(ShowTHAmountInWords; ShowTHFormatting)
                    {
                        ApplicationArea = Basic, Suite;
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
            LogInteraction := SegManagement.FindInteractTmplCode(16) <> '';
            LogInteractionEnable := LogInteraction;
        end;
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        GLSetup.GET;
        CompanyInfo.GET;
    end;

    trigger OnPreReport()
    begin
        IF NOT CurrReport.USEREQUESTPAGE THEN
            InitLogInteraction;
    end;

    var
        Text003: Label '(Applies to %1 %2)';
        Text005: Label 'Purchase - Credit Memo%1', Comment = '%1 = Document No.';
        GLSetup: Record "General Ledger Setup";
        CompanyInfo: Record "Company Information";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        VATAmountLine: Record "VAT Amount Line" temporary;
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        RespCenter: Record "Responsibility Center";
        Language: Record "Language";
        CurrExchRate: Record "Currency Exchange Rate";
        FormatAddr: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        SegManagement: Codeunit "SegManagement";
        VendAddr: array[8] of Text[50];
        ShipToAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        ReturnOrderNoText: Text[80];
        PurchaserText: Text[30];
        VATNoText: Text[80];
        ReferenceText: Text[80];
        AppliedToText: Text;
        TotalText: Text[50];
        TotalInclVATText: Text[50];
        TotalExclVATText: Text[50];
        AllowInvDiscount: Text[30];
        PricesIncludingVAT: Text[30];
        VATAmountText: Text[30];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        OutputNo: Integer;
        CopyText: Text[30];
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        LogInteraction: Boolean;
        VALVATBaseLCY: Decimal;
        VALVATAmountLCY: Decimal;
        VALSpecLCYHeader: Text[80];
        VALExchRate: Text[50];
        Text008: Label 'VAT Amount Specification in ';
        Text009: Label 'Local Currency';
        Text010: Label 'Exchange rate: %1/%2';
        CalculatedExchRate: Decimal;
        TotalInclVATTextLCY: Text[50];
        TotalExclVATTextLCY: Text[50];
        AmountLCY: Decimal;
        AmountIncLCY: Decimal;
        CheckReport: Report "Check";
        AmountLangA: array[2] of Text[80];
        AmountLangB: array[2] of Text[80];
        CurrencyLCY: Boolean;
        AmountInWords: Boolean;
        PurchaseLine: Record "Purchase Line";
        ShowTHFormatting: Boolean;
        OriginalInvDate: Date;
        PurchInvHeader: Record "Purch. Inv. Header";
        Text011: Label 'Purchase - Prepmt. Credit Memo %1';
        Text012: Label '%1% VAT';
        Text013: Label 'VAT Amount';
        GSTEnabled: Boolean;
        [InDataSet]
        LogInteractionEnable: Boolean;
        TotalSubTotal: Decimal;
        TotalAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        TotalAmountVAT: Decimal;
        TotalInvoiceDiscountAmount: Decimal;
        TotalPaymentDiscountOnVAT: Decimal;
        PhoneNoCaptionLbl: Label 'Phone No.';
        VATRegNoCaptionLbl: Label 'VAT Registration No.';
        GiroNoCaptionLbl: Label 'Giro No.';
        BankNameCaptionLbl: Label 'Bank';
        BankAccNoCaptionLbl: Label 'Account No.';
        ABNDivisionPartNoCaptionLbl: Label 'Division Part No.';
        ABNCaptionLbl: Label 'ABN';
        CreditMemoNoCaptionLbl: Label 'Credit Memo No.';
        ReasonCodeCaptionLbl: Label 'Reason Code';
        OriginalInvNoCaptionLbl: Label 'Original Invoice No.';
        OriginalInvDateCaptionLbl: Label 'Original Invoice Date';
        DocumentDtCaptionLbl: Label 'Document Date';
        HomePageCaptionLbl: Label 'Home Page';
        EmailCaptionLbl: Label 'Email';
        BuyFromVendorCaptionLbl: Label 'Buy From Vendor';
        PageCaptionLbl: Label 'Page';
        HeaderDimensionsCaptionLbl: Label 'Header Dimensions';
        DirectUnitCostCaptionLbl: Label 'Direct Unit Cost';
        DiscountPercentCaptionLbl: Label 'Discount %';
        AmountCaptionLbl: Label 'Amount';
        InvDiscountAmtCaptionLbl: Label 'Invoice Discount Amount';
        SubtotalCaptionLbl: Label 'Subtotal';
        PaymentDiscVATCaptionLbl: Label 'Payment Discount on VAT';
        ExchangeRateCaptionLbl: Label 'Exchange Rate';
        AllowInvoiceDiscountCaptionLbl: Label 'Allow invoice Discount';
        LineDimensionsCaptionLbl: Label 'Line Dimensions';
        VATPercentCaptionLbl: Label 'VAT %';
        VATBaseCaptionLbl: Label 'VAT Base';
        VATAmountCaptionLbl: Label 'VAT Amount';
        VATAmtSpecCaptionLbl: Label 'VAT Amount Specification';
        VATIdentifierCaptionLbl: Label 'VAT Identifier';
        LineAmountCaptionLbl: Label 'Line Amount';
        InvDiscBaseAmtCaptionLbl: Label 'Invoice Discount Base Amount';
        TotalCaptionLbl: Label 'Total';
        ShiptoAddressCaptionLbl: Label 'Ship-to Address';

    procedure InitLogInteraction()
    begin
        LogInteraction := SegManagement.FindInteractTmplCode(16) <> '';
    end;

    local procedure DocumentCaption(): Text[250]
    begin
        IF DataItem9869."Prepayment Credit Memo" THEN
            EXIT(Text011);
        EXIT(Text005);
    end;

    procedure InitializeRequest(NewNoOfCopies: Integer; NewShowInternalInfo: Boolean; NewLogInteraction: Boolean)
    begin
        NoOfCopies := NewNoOfCopies;
        ShowInternalInfo := NewShowInternalInfo;
        LogInteraction := NewLogInteraction;
    end;

    local procedure FormatAddressFields(var PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr.")
    begin
        FormatAddr.GetCompanyAddr(PurchCrMemoHdr."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
        FormatAddr.PurchCrMemoPayTo(VendAddr, PurchCrMemoHdr);
        FormatAddr.PurchCrMemoShipTo(ShipToAddr, PurchCrMemoHdr);
    end;

    local procedure FormatDocumentFields(PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr.")
    begin
        WITH PurchCrMemoHdr DO BEGIN
            FormatDocument.SetTotalLabels("Currency Code", TotalText, TotalInclVATText, TotalExclVATText);
            FormatDocument.SetPurchaser(SalesPurchPerson, "Purchaser Code", PurchaserText);

            ReturnOrderNoText := FormatDocument.SetText("Return Order No." <> '', FIELDCAPTION("Return Order No."));
            ReferenceText := FormatDocument.SetText("Your Reference" <> '', FIELDCAPTION("Your Reference"));
            VATNoText := FormatDocument.SetText("VAT Registration No." <> '', FIELDCAPTION("VAT Registration No."));
            AppliedToText :=
              FormatDocument.SetText(
                "Applies-to Doc. No." <> '', FORMAT(STRSUBSTNO(Text003, FORMAT("Applies-to Doc. Type"), "Applies-to Doc. No.")));
        END;
    end;
}

