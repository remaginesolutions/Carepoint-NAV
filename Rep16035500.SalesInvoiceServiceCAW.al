report 16035500 "Sales - Invoice Service CAW"
{
    // version CAREPOINT1.00

    // <changelog>
    //   <change id="AP0090" dev="AUGMENTUM" date="2008-06-02" area="N/A"
    //    baseversion="AP4.00.01" releaseversion="AP6.00" feature="NAVCORS22793">
    //    Report Transformation - localized Report Layout.</change>
    // </changelog>
    DefaultLayout = RDLC;
    RDLCLayout = './Sales - Invoice Service CAW.rdlc';

    Caption = 'Sales - Invoice';
    Permissions = TableData 7190 = rimd;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem(DataItem5581; "Sales Invoice Header")
        {
            DataItemTableView = SORTING ("No.");
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeading = 'Posted Sales Invoice';
            column(No_SalesInvHeader; "No.")
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
            column(VATAmountSpecificationCaption; VATAmountSpecificationCaptionLbl)
            {
            }
            column(VATIdentifierCaption; VATIdentifierCaptionLbl)
            {
            }
            column(InvDiscBaseAmountCaption; InvDiscBaseAmountCaptionLbl)
            {
            }
            column(LineAmountCaption; LineAmountCaptionLbl)
            {
            }
            column(InvoiceDiscountAmountCaption; InvoiceDiscountAmountCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(Header_Amount_Excl_GST; DataItem5581.Amount)
            {
            }
            column(Header_Amount_Incl_GST; DataItem5581."Amount Including VAT")
            {
            }
            column(Foreign_Currency; DataItem5581."Currency Code")
            {
            }
            column(External_Doc_No; DataItem5581."External Document No.")
            {
            }
            column(ML_Picture; CompanyPic.Picture)
            {
            }
            column(Sales_Due_Date; FORMAT(DataItem5581."Due Date", 0, '<Day> <Month text,3> <Year4>'))
            {
            }
            column(Sales_Posting_Date; FORMAT(DataItem5581."Posting Date", 0, '<Day> <Month text,3> <Year4>'))
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING (Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING (Number)
                                        WHERE (Number = CONST (1));
                    column(CompInfo3Picture; CompanyInfo3.Picture)
                    {
                    }
                    column(CompInfo2Picture; CompanyInfo2.Picture)
                    {
                    }
                    column(CompInfo1Picture; CompanyInfo1.Picture)
                    {
                    }
                    column(CompInfoPicture; CompanyInfo.Picture)
                    {
                    }
                    column(DocCaptionCopyText; STRSUBSTNO(DocumentCaption, CopyText))
                    {
                    }
                    column(CustAddr1; CustAddr[1])
                    {
                    }
                    column(CompAddr1; CompanyAddr[1])
                    {
                    }
                    column(CustAddr2; CustAddr[2])
                    {
                    }
                    column(CompAddr2; CompanyAddr[2])
                    {
                    }
                    column(CustAddr3; CustAddr[3])
                    {
                    }
                    column(CompAddr3; CompanyAddr[3])
                    {
                    }
                    column(CustAddr4; CustAddr[4])
                    {
                    }
                    column(CompAddr4; CompanyAddr[4])
                    {
                    }
                    column(CustAddr5; CustAddr[5])
                    {
                    }
                    column(CompInfoPhoneNo; CompanyInfo."Phone No.")
                    {
                    }
                    column(CustAddr6; CustAddr[6])
                    {
                    }
                    column(ShipMethodDesc; ShipmentMethod.Description)
                    {
                    }
                    column(PaymentTermsDesc; PaymentTerms.Description)
                    {
                    }
                    column(CompInfoVATRegsNo; CompanyInfo."VAT Registration No.")
                    {
                    }
                    column(CompInfoHomePage; CompanyInfo."Home Page")
                    {
                    }
                    column(CompInfoEmail; CompanyInfo."E-Mail")
                    {
                    }
                    column(CompInfoGiroNo; CompanyInfo."Giro No.")
                    {
                    }
                    column(CompInfoBankName; CompanyInfo."Bank Name")
                    {
                    }
                    column(CompInfoBankAccNo; CompanyInfo."Bank Account No.")
                    {
                    }
                    column(CompInfoBSB; CompanyInfo."Bank Branch No.")
                    {
                    }
                    column(BilltoCustNo_SalesInvHeader; DataItem5581."Bill-to Customer No.")
                    {
                    }
                    column(PostingDt_SalesInvHeader; DataItem5581."Posting Date")
                    {
                    }
                    column(VATNoText; VATNoText)
                    {
                    }
                    column(VATRegsNo_SalesInvHeader; DataItem5581."VAT Registration No.")
                    {
                    }
                    column(DueDate_SalesInvHeader; DataItem5581."Due Date")
                    {
                    }
                    column(SalesPersonText; SalesPersonText)
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(SalesInvHeaderNo1; DataItem5581."No.")
                    {
                    }
                    column(ReferenceText; ReferenceText)
                    {
                    }
                    column(SalesInvHeaderYourReference; DataItem5581."Your Reference")
                    {
                    }
                    column(OrderNoText; OrderNoText)
                    {
                    }
                    column(OrderNo_SalesInvHdr; DataItem5581."Order No.")
                    {
                    }
                    column(CustAddr7; CustAddr[7])
                    {
                    }
                    column(CustAddr8; CustAddr[8])
                    {
                    }
                    column(CompAddr5; CompanyAddr[5])
                    {
                    }
                    column(CompAddr6; CompanyAddr[6])
                    {
                    }
                    column(DocumentDate04_SalesInvHeader; DataItem5581."Document Date")
                    {
                    }
                    column(PricesIncludVAT_SalesInvHdr; DataItem5581."Prices Including VAT")
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(PricesInclVATYesNo; FORMAT(DataItem5581."Prices Including VAT"))
                    {
                    }
                    column(PageCaption; STRSUBSTNO(Text005, ''))
                    {
                    }
                    //column(FormatAddrPrintBarCode1; FormatAddr.PrintBarCode(1))
                    //{
                    //}
                    column(CompInfoABNDivPartNo; CompanyInfo."ABN Division Part No.")
                    {
                    }
                    column(CompInfoABN; CompanyInfo.ABN)
                    {
                    }
                    column(DocumentDateCaption; DocumentDateCaptionLbl)
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
                    column(BankAccountNoCaption; BankAccountNoCaptionLbl)
                    {
                    }
                    column(DueDateCaption; DueDateCaptionLbl)
                    {
                    }
                    column(InvoiceNoCaption; InvoiceNoCaptionLbl)
                    {
                    }
                    column(PostingDateCaption; PostingDateCaptionLbl)
                    {
                    }
                    column(ABNCaption; ABNCaptionLbl)
                    {
                    }
                    column(DivisionPartNoCaption; DivisionPartNoCaptionLbl)
                    {
                    }
                    column(PaymentTermsDescriptionCaption; PaymentTermsDescriptionCaptionLbl)
                    {
                    }
                    column(ShipmentMethodDescriptionCaption; ShipmentMethodDescriptionCaptionLbl)
                    {
                    }
                    column(HomePageCaption; HomePageCaptionLbl)
                    {
                    }
                    column(EmailIdCaption; EmailIdCaptionLbl)
                    {
                    }
                    column(BilltoCustNo_SalesInvHeaderCaption; DataItem5581.FIELDCAPTION("Bill-to Customer No."))
                    {
                    }
                    column(PricesIncludVAT_SalesInvHdrCaption; DataItem5581.FIELDCAPTION("Prices Including VAT"))
                    {
                    }
                    column(NewCompany_Address; CompanyInfo4.Address)
                    {
                    }
                    column(NewCompany_Postcode; CompanyInfo4."Post Code")
                    {
                    }
                    column(NewCompany_State; CompanyInfo4.County)
                    {
                    }
                    column(NewCompany_City; CompanyInfo4.City)
                    {
                    }
                    column(NewCompany_PhoneNo; CompanyInfo4."Phone No.")
                    {
                    }
                    column(NewCompany_FaxNo; CompanyInfo4."Fax No.")
                    {
                    }
                    column(NewCompany_Homepage; CompanyInfo4."Home Page")
                    {
                    }
                    column(NewCompany_Name; CompanyInfo4.Name)
                    {
                    }
                    column(Company_FaxNo; CompanyInfo."Fax No.")
                    {
                    }
                    column(Company_BankName; CompanyInfo."Bank Name")
                    {
                    }
                    column(Company_Email; CompanyInfo."E-Mail")
                    {
                    }
                    column(Customer_ABN; Cust.ABN)
                    {
                    }
                    column(Company_Country; CompanyInfo."Country/Region Code")
                    {
                    }
                    column(Company_Country_Name; CountryName.Name)
                    {
                    }
                    column(Sales_Inv_Hdr_CustomerNo; DataItem5581."Bill-to Customer No.")
                    {
                    }
                    column(Sales_Inv_Hdr_SellToCustName; DataItem5581."Sell-to Customer Name")
                    {
                    }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = DataItem5581;
                        DataItemTableView = SORTING (Number)
                                            WHERE (Number = FILTER (1 ..));
                        column(DimText; DimText)
                        {
                        }
                        column(Number1_IntergerLine; DimensionLoop1.Number)
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
                    dataitem(DataItem1570; "Sales Invoice Line")
                    {
                        DataItemLink = "Document No." = FIELD ("No.");
                        DataItemLinkReference = DataItem5581;
                        DataItemTableView = SORTING ("Document No.", "Line No.");
                        column(LineAmt_SalesInvLine; "Line Amount")
                        {
                            AutoFormatExpression = DataItem1570.GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(Desc_SalesInvLine; Description)
                        {
                        }
                        column(No_SalesInvLine; "No.")
                        {
                        }
                        column(No_SalesInvLineCaption; FIELDCAPTION("No."))
                        {
                        }
                        column(Qty_SalesInvLine; Quantity)
                        {
                        }
                        column(UnitMeasure_SalesInvLine; "Unit of Measure")
                        {
                        }
                        column(UnitPrice_SalesInvLine; "Unit Price")
                        {
                            AutoFormatExpression = DataItem1570.GetCurrencyCode;
                            AutoFormatType = 2;
                        }
                        column(LineDiscount_SalesInvLine; "Line Discount %")
                        {
                        }
                        column(VATIdentifier_SalesInvLine; "VAT Identifier")
                        {
                        }
                        column(PostedShipDt_SalesInvLine; PostedShipmentDate)
                        {
                        }
                        column(SalesLineType_SalesInvLine; FORMAT(DataItem1570.Type))
                        {
                        }
                        column(InvDiscountAmt_SalesInvLine; -"Inv. Discount Amount")
                        {
                            AutoFormatExpression = DataItem1570.GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(TotalSubTotal_SalesInvLine; TotalSubTotal)
                        {
                            AutoFormatExpression = DataItem5581."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalInvDiscountAmt_SalesInvLine; TotalInvoiceDiscountAmount)
                        {
                            AutoFormatExpression = DataItem5581."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalText_SalesInvLine; TotalText)
                        {
                        }
                        column(Amount__SalesInvLine; Amount)
                        {
                            AutoFormatExpression = DataItem1570.GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(TotalAmount__SalesInvLine; TotalAmount)
                        {
                            AutoFormatExpression = DataItem5581."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(AmtIncludVATAmt; "Amount Including VAT" - Amount)
                        {
                            AutoFormatExpression = DataItem1570.GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(AmtIncludVAT_SalesInvLine; "Amount Including VAT")
                        {
                            AutoFormatExpression = DataItem1570.GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATAmtText; VATAmountLine.VATAmountText)
                        {
                        }
                        column(TotalExclVATText; TotalExclVATText)
                        {
                        }
                        column(TotalInclVATText; TotalInclVATText)
                        {
                        }
                        column(TotalAmtInclVAT; TotalAmountInclVAT)
                        {
                            AutoFormatExpression = DataItem5581."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalAmtVAT; TotalAmountVAT)
                        {
                            AutoFormatExpression = DataItem5581."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATBaseDisc_SalesInvHdr; DataItem5581."VAT Base Discount %")
                        {
                            AutoFormatType = 1;
                        }
                        column(TotalPaymentDisOnVAT; TotalPaymentDiscountOnVAT)
                        {
                            AutoFormatType = 1;
                        }
                        column(SalesInvHeaderCurrFactor; DataItem5581."Currency Factor")
                        {
                        }
                        column(TotalExclVATTextLCY; TotalExclVATTextLCY)
                        {
                        }
                        column(TotalInclVATTextLCY; TotalInclVATTextLCY)
                        {
                        }
                        column(AmtIncLCYAmtLCY; AmountIncLCY - AmountLCY)
                        {
                            AutoFormatExpression = DataItem1570.GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(AmtIncLCY; AmountIncLCY)
                        {
                            AutoFormatExpression = DataItem1570.GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(AmtLCY; AmountLCY)
                        {
                            AutoFormatExpression = DataItem1570.GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(CurrLCY; CurrencyLCY)
                        {
                        }
                        column(CurrCode_SalesInvHeader; DataItem5581."Currency Code")
                        {
                        }
                        column(AmtLangB1AmtLangB2; AmountLangB[1] + ' ' + AmountLangB[2])
                        {
                            AutoFormatType = 1;
                        }
                        column(AmtLangA1AmtLangA2; AmountLangA[1] + ' ' + AmountLangA[2])
                        {
                            AutoFormatType = 1;
                        }
                        column(AmtInWords; AmountInWords)
                        {
                        }
                        column(SalesInvLineLineNo; "Line No.")
                        {
                        }
                        column(UnitPriceCaption; UnitPriceCaptionLbl)
                        {
                        }
                        column(DiscountPercentCaption; DiscountPercentCaptionLbl)
                        {
                        }
                        column(AmountCaption; AmountCaptionLbl)
                        {
                        }
                        column(PostedShipmentDateCaption; PostedShipmentDateCaptionLbl)
                        {
                        }
                        column(InvDiscountAmountCaption; InvDiscountAmountCaptionLbl)
                        {
                        }
                        column(SubtotalCaption; SubtotalCaptionLbl)
                        {
                        }
                        column(PaymentDiscountonVATCaption; PaymentDiscountonVATCaptionLbl)
                        {
                        }
                        column(ExchangeRateCaption; ExchangeRateCaptionLbl)
                        {
                        }
                        column(Desc_SalesInvLineCaption; FIELDCAPTION(Description))
                        {
                        }
                        column(Qty_SalesInvLineCaption; FIELDCAPTION(Quantity))
                        {
                        }
                        column(UnitMeasure_SalesInvLineCaption; FIELDCAPTION("Unit of Measure"))
                        {
                        }
                        column(GST_Percent; DataItem1570."VAT %")
                        {
                        }
                        column(VATIdentifier_SalesInvLineCaption; FIELDCAPTION("VAT Identifier"))
                        {
                        }
                        column(SalesInvLine_WorkTypeCode; DataItem1570."Work Type Code")
                        {
                        }
                        column(SalesInvLine_JobNo; DataItem1570."Job No.")
                        {
                        }
                        column(ServiceDeliveryDate; ServiceDeliveryDate)
                        {
                        }
                        column(Program_Dimension_Name; ProgramDimValue.Name)
                        {
                        }
                        dataitem("Sales Shipment Buffer"; "Integer")
                        {
                            DataItemTableView = SORTING (Number);
                            column(SalesShipBufferPostingDt; SalesShipmentBuffer."Posting Date")
                            {
                            }
                            column(SalesShipBufferQty; SalesShipmentBuffer.Quantity)
                            {
                                DecimalPlaces = 0 : 5;
                            }
                            column(ShipmentCaption; ShipmentCaptionLbl)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                IF Number = 1 THEN
                                    SalesShipmentBuffer.FIND('-')
                                ELSE
                                    SalesShipmentBuffer.NEXT;
                            end;

                            trigger OnPreDataItem()
                            begin
                                SalesShipmentBuffer.SETRANGE("Document No.", DataItem1570."Document No.");
                                SalesShipmentBuffer.SETRANGE("Line No.", DataItem1570."Line No.");

                                SETRANGE(Number, 1, SalesShipmentBuffer.COUNT);
                            end;
                        }
                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = SORTING (Number)
                                                WHERE (Number = FILTER (1 ..));
                            column(DimTextCtrl82; DimText)
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

                                DimSetEntry2.SETRANGE("Dimension Set ID", DataItem1570."Dimension Set ID");
                            end;
                        }
                        dataitem(AsmLoop; "Integer")
                        {
                            column(PostedAsmMeasureCode; GetUOMText(TempPostedAsmLine."Unit of Measure Code"))
                            {
                            }
                            column(PostedAsmLineQty; TempPostedAsmLine.Quantity)
                            {
                                DecimalPlaces = 0 : 5;
                            }
                            column(PostedAsmLineVarCode; BlanksForIndent + TempPostedAsmLine."Variant Code")
                            {
                            }
                            column(PostedAsmLineDesc; BlanksForIndent + TempPostedAsmLine.Description)
                            {
                            }
                            column(PostedAsmLineNo; BlanksForIndent + TempPostedAsmLine."No.")
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                IF Number = 1 THEN
                                    TempPostedAsmLine.FINDSET
                                ELSE
                                    TempPostedAsmLine.NEXT;
                            end;

                            trigger OnPreDataItem()
                            begin
                                CLEAR(TempPostedAsmLine);
                                IF NOT DisplayAssemblyInformation THEN
                                    CurrReport.BREAK;
                                CollectAsmInformation;
                                CLEAR(TempPostedAsmLine);
                                SETRANGE(Number, 1, TempPostedAsmLine.COUNT);
                            end;
                        }

                        trigger OnAfterGetRecord()
                        var
                            JobPlanningLineInvoice: Record "Job Planning Line Invoice";
                            DimensionValue: Record "Dimension Value";
                        begin
                            CLEAR(ServiceDeliveryDate);
                            JobPlanningLineInvoice.SETRANGE("Document Type", JobPlanningLineInvoice."Document Type"::"Posted Invoice");
                            JobPlanningLineInvoice.SETRANGE("Document No.", DataItem1570."Document No.");
                            JobPlanningLineInvoice.SETRANGE("Line No.", DataItem1570."Line No.");
                            IF JobPlanningLineInvoice.FINDFIRST THEN
                                ServiceDeliveryDate := JobPlanningLineInvoice."Service Delivery Date";

                            PostedShipmentDate := 0D;
                            IF Quantity <> 0 THEN
                                PostedShipmentDate := FindPostedShipmentDate;

                            IF (Type = Type::"G/L Account") AND (NOT ShowInternalInfo) THEN
                                "No." := '';

                            VATAmountLine.INIT;
                            VATAmountLine."VAT Identifier" := "VAT Identifier";
                            VATAmountLine."VAT Calculation Type" := "VAT Calculation Type";
                            VATAmountLine."Tax Group Code" := "Tax Group Code";
                            VATAmountLine."VAT %" := "VAT %";
                            VATAmountLine."VAT Base" := Amount;
                            VATAmountLine."Amount Including VAT" := "Amount Including VAT";
                            VATAmountLine."Line Amount" := "Line Amount";
                            IF "Allow Invoice Disc." THEN
                                VATAmountLine."Inv. Disc. Base Amount" := "Line Amount";
                            VATAmountLine."Invoice Discount Amount" := "Inv. Discount Amount";
                            VATAmountLine.InsertLine;

                            TotalSubTotal += "Line Amount";
                            TotalInvoiceDiscountAmount -= "Inv. Discount Amount";
                            TotalAmount += Amount;
                            TotalAmountVAT += "Amount Including VAT" - Amount;
                            TotalAmountInclVAT += "Amount Including VAT";
                            TotalPaymentDiscountOnVAT += -("Line Amount" - "Inv. Discount Amount" - "Amount Including VAT");

                            CLEAR(ProgramDimValue);
                            IF ProgramDimValue.GET(GLSetup."Global Dimension 1 Code", DataItem1570."Shortcut Dimension 1 Code") THEN;
                        end;

                        trigger OnPreDataItem()
                        begin
                            VATAmountLine.DELETEALL;
                            SalesShipmentBuffer.RESET;
                            SalesShipmentBuffer.DELETEALL;
                            FirstValueEntryNo := 0;
                            MoreLines := FIND('+');
                            WHILE MoreLines AND (Description = '') AND ("No." = '') AND (Quantity = 0) AND (Amount = 0) DO
                                MoreLines := NEXT(-1) <> 0;
                            IF NOT MoreLines THEN
                                CurrReport.BREAK;
                            SETRANGE("Line No.", 0, "Line No.");
                            //CurrReport.CREATETOTALS("Line Amount", Amount, "Amount Including VAT", "Inv. Discount Amount");
                        end;
                    }
                    dataitem(VATCounter; "Integer")
                    {
                        DataItemTableView = SORTING (Number);
                        column(VATBase_VATAmtLine; VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = DataItem1570.GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(VATAmt_VATAmtLine; VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = DataItem5581."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(LineAmt_VATAmtLine; VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = DataItem5581."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(InvDiscBaseAmt_VATAmtLine; VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = DataItem5581."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(InvDiscAmt_VATAmtLine; VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = DataItem5581."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VAT_VATAmtLine; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATIdentifier_VATAmtLine; VATAmountLine."VAT Identifier")
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(Number);
                        end;

                        trigger OnPreDataItem()
                        begin
                            SETRANGE(Number, 1, VATAmountLine.COUNT);
                            //CurrReport.CREATETOTALS(
                              //VATAmountLine."Line Amount", VATAmountLine."Inv. Disc. Base Amount",
                              //VATAmountLine."Invoice Discount Amount", VATAmountLine."VAT Base", VATAmountLine."VAT Amount");
                        end;
                    }
                    dataitem(VatCounterLCY; "Integer")
                    {
                        DataItemTableView = SORTING (Number);
                        column(VALSpecLCYHdr; VALSpecLCYHeader)
                        {
                        }
                        column(VALExchRate; VALExchRate)
                        {
                        }
                        column(VALVATBaseLCY; VALVATBaseLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATAmtLCY; VALVATAmountLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VATCtrl164_VATAmtLine; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATIndCtrl_VATAmtLine; VATAmountLine."VAT Identifier")
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(Number);

                            VALVATBaseLCY := ROUND(VATAmountLine."VAT Base" / DataItem5581."Currency Factor");
                            VALVATAmountLCY := ROUND(VATAmountLine."VAT Amount" / DataItem5581."Currency Factor");
                        end;

                        trigger OnPreDataItem()
                        begin
                            IF (NOT GLSetup."Print VAT specification in LCY") OR
                               (DataItem5581."Currency Code" = '')
                            THEN
                                CurrReport.BREAK;

                            SETRANGE(Number, 1, VATAmountLine.COUNT);
                            //CurrReport.CREATETOTALS(VALVATBaseLCY, VALVATAmountLCY);

                            IF GLSetup."LCY Code" = '' THEN
                                VALSpecLCYHeader := Text007 + Text008
                            ELSE
                                VALSpecLCYHeader := Text007 + FORMAT(GLSetup."LCY Code");

                            CurrExchRate.FindCurrency(DataItem5581."Posting Date", DataItem5581."Currency Code", 1);
                            CalculatedExchRate := ROUND(1 / DataItem5581."Currency Factor" * CurrExchRate."Exchange Rate Amount", 0.000001);
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
                        column(SelltoCustomerNo_SalesInvHeader; DataItem5581."Sell-to Customer No.")
                        {
                        }
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
                        column(SelltoCustomerNo_SalesInvHeaderCaption; DataItem5581.FIELDCAPTION("Sell-to Customer No."))
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            IF NOT ShowShippingAddr THEN
                                CurrReport.BREAK;
                        end;
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    IF Number > 1 THEN BEGIN
                        CopyText := Text003;
                        OutputNo += 1;
                    END;
                    //CurrReport.PAGENO := 1;

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
                        SalesInvCountPrinted.RUN(DataItem5581);
                end;

                trigger OnPreDataItem()
                begin
                    NoOfLoops := ABS(NoOfCopies) + Cust."Invoice Copies" + 1;
                    IF NoOfLoops <= 0 THEN
                        NoOfLoops := 1;
                    CopyText := '';
                    SETRANGE(Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");

                IF RespCenter.GET("Responsibility Center") THEN BEGIN
                    FormatAddr.RespCenter(CompanyAddr, RespCenter);
                    CompanyInfo."Phone No." := RespCenter."Phone No.";
                    CompanyInfo."Fax No." := RespCenter."Fax No.";
                END ELSE BEGIN
                    FormatAddr.Company(CompanyAddr, CompanyInfo);
                END;

                DimSetEntry1.SETRANGE("Dimension Set ID", "Dimension Set ID");

                IF "Order No." = '' THEN
                    OrderNoText := ''
                ELSE
                    OrderNoText := FIELDCAPTION("Order No.");
                IF "Salesperson Code" = '' THEN BEGIN
                    SalesPurchPerson.INIT;
                    SalesPersonText := '';
                END ELSE BEGIN
                    SalesPurchPerson.GET("Salesperson Code");
                    SalesPersonText := Text000;
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
                FormatAddr.SalesInvBillTo(CustAddr, DataItem5581);
                IF NOT Cust.GET("Bill-to Customer No.") THEN
                    CLEAR(Cust);

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
                FormatAddr.SalesInvShipTo(ShipToAddr, CustAddr, DataItem5581);
                ShowShippingAddr := "Sell-to Customer No." <> "Bill-to Customer No.";
                FOR i := 1 TO ARRAYLEN(ShipToAddr) DO
                    IF ShipToAddr[i] <> CustAddr[i] THEN
                        ShowShippingAddr := TRUE;

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
                //SalesLine.InitTextVariable;
                //SalesLine.FormatNoText(AmountLangA, "Amount Including VAT", "Currency Code");
                //IF ShowTHFormatting THEN BEGIN
                //    SalesLine.InitTextVariableTH;
                //    SalesLine.FormatNoTextTH(AmountLangB, "Amount Including VAT", DataItem5581."Currency Code");
                //END ELSE BEGIN
                AmountLangB[1] := '';
                AmountLangB[2] := '';
                //END;

                IF LogInteraction THEN
                    IF NOT CurrReport.PREVIEW THEN BEGIN
                        IF "Bill-to Contact No." <> '' THEN
                            SegManagement.LogDocument(
                              4, "No.", 0, 0, DATABASE::Contact, "Bill-to Contact No.", "Salesperson Code",
                              "Campaign No.", "Posting Description", '')
                        ELSE
                            SegManagement.LogDocument(
                              4, "No.", 0, 0, DATABASE::Customer, "Bill-to Customer No.", "Salesperson Code",
                              "Campaign No.", "Posting Description", '');
                    END;
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
                    field(DisplayAsmInformation; DisplayAssemblyInformation)
                    {
                        Caption = 'Show Assembly Components';
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
            InitLogInteraction;
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
        SalesSetup.GET;

        CASE SalesSetup."Logo Position on Documents" OF
            SalesSetup."Logo Position on Documents"::"No Logo":
                ;
            SalesSetup."Logo Position on Documents"::Left:
                BEGIN
                    CompanyInfo3.GET;
                    CompanyInfo3.CALCFIELDS(Picture);
                END;
            SalesSetup."Logo Position on Documents"::Center:
                BEGIN
                    CompanyInfo1.GET;
                    CompanyInfo1.CALCFIELDS(Picture);
                END;
            SalesSetup."Logo Position on Documents"::Right:
                BEGIN
                    CompanyInfo2.GET;
                    CompanyInfo2.CALCFIELDS(Picture);
                END;
        END;
        //HBSML>>
        //Get company logo from Company Information
        CompanyPic.GET;
        CompanyPic.CALCFIELDS(CompanyPic.Picture);
        //HBSML<<

        //HBSML>>
        CountryName.GET(CompanyInfo."Country/Region Code");
        //HBSML<<
    end;

    trigger OnPreReport()
    begin
        IF NOT CurrReport.USEREQUESTPAGE THEN
            InitLogInteraction;
    end;

    var
        Text000: Label 'Salesperson';
        Text001: Label 'Total %1';
        Text002: Label 'Total %1 Incl. VAT';
        Text003: Label 'COPY';
        Text004: Label 'Sales - Invoice %1';
        Text005: Label 'Page %1';
        Text006: Label 'Total %1 Excl. VAT';
        ProgramDimValue: Record "Dimension Value";
        GLSetup: Record "General Ledger Setup";
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInfo: Record "Company Information";
        CompanyInfo1: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        CompanyInfo3: Record "Company Information";
        SalesSetup: Record "Sales & Receivables Setup";
        Cust: Record "Customer";
        VATAmountLine: Record "VAT Amount Line" temporary;
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        RespCenter: Record "Responsibility Center";
        Language: Record "Language";
        CurrExchRate: Record "Currency Exchange Rate";
        TempPostedAsmLine: Record "Posted Assembly Line" temporary;
        SalesInvCountPrinted: Codeunit "Sales Inv.-Printed";
        FormatAddr: Codeunit "Format Address";
        SegManagement: Codeunit "SegManagement";
        SalesShipmentBuffer: Record "Sales Shipment Buffer" temporary;
        PostedShipmentDate: Date;
        CustAddr: array[8] of Text[50];
        ShipToAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        OrderNoText: Text[80];
        SalesPersonText: Text[30];
        VATNoText: Text[80];
        ReferenceText: Text[80];
        TotalText: Text[50];
        TotalExclVATText: Text[50];
        TotalInclVATText: Text[50];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        ShowShippingAddr: Boolean;
        i: Integer;
        NextEntryNo: Integer;
        FirstValueEntryNo: Integer;
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        LogInteraction: Boolean;
        VALVATBaseLCY: Decimal;
        VALVATAmountLCY: Decimal;
        VALSpecLCYHeader: Text[80];
        Text007: Label 'VAT Amount Specification in ';
        Text008: Label 'Local Currency';
        VALExchRate: Text[50];
        Text009: Label 'Exchange rate: %1/%2';
        CalculatedExchRate: Decimal;
        Text010: Label 'Sales - Prepayment Invoice %1';
        OutputNo: Integer;
        TotalSubTotal: Decimal;
        TotalAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        TotalAmountVAT: Decimal;
        TotalInvoiceDiscountAmount: Decimal;
        TotalPaymentDiscountOnVAT: Decimal;
        TotalInclVATTextLCY: Text[50];
        TotalExclVATTextLCY: Text[50];
        AmountLCY: Decimal;
        AmountIncLCY: Decimal;
        CurrencyLCY: Boolean;
        AmountInWords: Boolean;
        AmountLangA: array[2] of Text[80];
        AmountLangB: array[2] of Text[80];
        SalesLine: Record "Sales Line";
        ShowTHFormatting: Boolean;
        [InDataSet]
        LogInteractionEnable: Boolean;
        DisplayAssemblyInformation: Boolean;
        VATPercentCaptionLbl: Label 'VAT %';
        VATBaseCaptionLbl: Label 'VAT Base';
        VATAmountCaptionLbl: Label 'VAT Amount';
        VATAmountSpecificationCaptionLbl: Label 'VAT Amount Specification';
        VATIdentifierCaptionLbl: Label 'VAT Identifier';
        InvDiscBaseAmountCaptionLbl: Label 'Invoice Discount Base Amount';
        LineAmountCaptionLbl: Label 'Line Amount';
        InvoiceDiscountAmountCaptionLbl: Label 'Invoice Discount Amount';
        TotalCaptionLbl: Label 'Total';
        DocumentDateCaptionLbl: Label 'Document Date';
        PhoneNoCaptionLbl: Label 'Phone No.';
        VATRegNoCaptionLbl: Label 'VAT Registration No.';
        GiroNoCaptionLbl: Label 'Giro No.';
        BankNameCaptionLbl: Label 'Bank';
        BankAccountNoCaptionLbl: Label 'Account No.';
        DueDateCaptionLbl: Label 'Due Date';
        InvoiceNoCaptionLbl: Label 'Invoice No.';
        PostingDateCaptionLbl: Label 'Posting Date';
        ABNCaptionLbl: Label 'ABN';
        DivisionPartNoCaptionLbl: Label 'Division Part No.';
        PaymentTermsDescriptionCaptionLbl: Label 'Payment Terms';
        ShipmentMethodDescriptionCaptionLbl: Label 'Shipment Method';
        HomePageCaptionLbl: Label 'Home Page';
        EmailIdCaptionLbl: Label 'E-Mail';
        HeaderDimensionsCaptionLbl: Label 'Header Dimensions';
        UnitPriceCaptionLbl: Label 'Unit Price';
        DiscountPercentCaptionLbl: Label 'Discount%';
        AmountCaptionLbl: Label 'Amount';
        PostedShipmentDateCaptionLbl: Label 'Posted Shipment Date';
        InvDiscountAmountCaptionLbl: Label 'Invoice Discount Amount';
        SubtotalCaptionLbl: Label 'Subtotal';
        PaymentDiscountonVATCaptionLbl: Label 'Payment Discount on VAT';
        ExchangeRateCaptionLbl: Label 'Exchange Rate';
        ShipmentCaptionLbl: Label 'Shipment';
        LineDimensionsCaptionLbl: Label 'Line Dimensions';
        ShiptoAddressCaptionLbl: Label 'Ship-to Address';
        CompanyInfo4: Record "Company Information";
        CompanyPic: Record "Company Information";
        CountryName: Record "Country/Region";
        ServiceDeliveryDate: Date;
        ProgramName: Text;

    procedure InitLogInteraction()
    begin
        LogInteraction := SegManagement.FindInteractTmplCode(4) <> '';
    end;

    procedure FindPostedShipmentDate(): Date
    var
        SalesShipmentHeader: Record "Sales Shipment Header";
        SalesShipmentBuffer2: Record "Sales Shipment Buffer" temporary;
    begin
        NextEntryNo := 1;
        IF DataItem1570."Shipment No." <> '' THEN
            IF SalesShipmentHeader.GET(DataItem1570."Shipment No.") THEN
                EXIT(SalesShipmentHeader."Posting Date");

        IF DataItem5581."Order No." = '' THEN
            EXIT(DataItem5581."Posting Date");

        CASE DataItem1570.Type OF
            DataItem1570.Type::Item:
                GenerateBufferFromValueEntry(DataItem1570);
            DataItem1570.Type::"G/L Account", DataItem1570.Type::Resource,
          DataItem1570.Type::"Charge (Item)", DataItem1570.Type::"Fixed Asset":
                GenerateBufferFromShipment(DataItem1570);
            DataItem1570.Type::" ":
                EXIT(0D);
        END;

        SalesShipmentBuffer.RESET;
        SalesShipmentBuffer.SETRANGE("Document No.", DataItem1570."Document No.");
        SalesShipmentBuffer.SETRANGE("Line No.", DataItem1570."Line No.");
        IF SalesShipmentBuffer.FIND('-') THEN BEGIN
            SalesShipmentBuffer2 := SalesShipmentBuffer;
            IF SalesShipmentBuffer.NEXT = 0 THEN BEGIN
                SalesShipmentBuffer.GET(
                  SalesShipmentBuffer2."Document No.", SalesShipmentBuffer2."Line No.", SalesShipmentBuffer2."Entry No.");
                SalesShipmentBuffer.DELETE;
                EXIT(SalesShipmentBuffer2."Posting Date");
            END;
            SalesShipmentBuffer.CALCSUMS(Quantity);
            IF SalesShipmentBuffer.Quantity <> DataItem1570.Quantity THEN BEGIN
                SalesShipmentBuffer.DELETEALL;
                EXIT(DataItem5581."Posting Date");
            END;
        END ELSE
            EXIT(DataItem5581."Posting Date");
    end;

    procedure GenerateBufferFromValueEntry(SalesInvoiceLine2: Record "Sales Invoice Line")
    var
        ValueEntry: Record "Value Entry";
        ItemLedgerEntry: Record "Item Ledger Entry";
        TotalQuantity: Decimal;
        Quantity: Decimal;
    begin
        TotalQuantity := SalesInvoiceLine2."Quantity (Base)";
        ValueEntry.SETCURRENTKEY("Document No.");
        ValueEntry.SETRANGE("Document No.", SalesInvoiceLine2."Document No.");
        ValueEntry.SETRANGE("Posting Date", DataItem5581."Posting Date");
        ValueEntry.SETRANGE("Item Charge No.", '');
        ValueEntry.SETFILTER("Entry No.", '%1..', FirstValueEntryNo);
        IF ValueEntry.FIND('-') THEN
            REPEAT
                IF ItemLedgerEntry.GET(ValueEntry."Item Ledger Entry No.") THEN BEGIN
                    IF SalesInvoiceLine2."Qty. per Unit of Measure" <> 0 THEN
                        Quantity := ValueEntry."Invoiced Quantity" / SalesInvoiceLine2."Qty. per Unit of Measure"
                    ELSE
                        Quantity := ValueEntry."Invoiced Quantity";
                    AddBufferEntry(
                      SalesInvoiceLine2,
                      -Quantity,
                      ItemLedgerEntry."Posting Date");
                    TotalQuantity := TotalQuantity + ValueEntry."Invoiced Quantity";
                END;
                FirstValueEntryNo := ValueEntry."Entry No." + 1;
            UNTIL (ValueEntry.NEXT = 0) OR (TotalQuantity = 0);
    end;

    procedure GenerateBufferFromShipment(SalesInvoiceLine: Record "Sales Invoice Line")
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesInvoiceLine2: Record "Sales Invoice Line";
        SalesShipmentHeader: Record "Sales Shipment Header";
        SalesShipmentLine: Record "Sales Shipment Line";
        TotalQuantity: Decimal;
        Quantity: Decimal;
    begin
        TotalQuantity := 0;
        SalesInvoiceHeader.SETCURRENTKEY("Order No.");
        SalesInvoiceHeader.SETFILTER("No.", '..%1', DataItem5581."No.");
        SalesInvoiceHeader.SETRANGE("Order No.", DataItem5581."Order No.");
        IF SalesInvoiceHeader.FIND('-') THEN
            REPEAT
                SalesInvoiceLine2.SETRANGE("Document No.", SalesInvoiceHeader."No.");
                SalesInvoiceLine2.SETRANGE("Line No.", SalesInvoiceLine."Line No.");
                SalesInvoiceLine2.SETRANGE(Type, SalesInvoiceLine.Type);
                SalesInvoiceLine2.SETRANGE("No.", SalesInvoiceLine."No.");
                SalesInvoiceLine2.SETRANGE("Unit of Measure Code", SalesInvoiceLine."Unit of Measure Code");
                IF SalesInvoiceLine2.FIND('-') THEN
                    REPEAT
                        TotalQuantity := TotalQuantity + SalesInvoiceLine2.Quantity;
                    UNTIL SalesInvoiceLine2.NEXT = 0;
            UNTIL SalesInvoiceHeader.NEXT = 0;

        SalesShipmentLine.SETCURRENTKEY("Order No.", "Order Line No.");
        SalesShipmentLine.SETRANGE("Order No.", DataItem5581."Order No.");
        SalesShipmentLine.SETRANGE("Order Line No.", SalesInvoiceLine."Line No.");
        SalesShipmentLine.SETRANGE("Line No.", SalesInvoiceLine."Line No.");
        SalesShipmentLine.SETRANGE(Type, SalesInvoiceLine.Type);
        SalesShipmentLine.SETRANGE("No.", SalesInvoiceLine."No.");
        SalesShipmentLine.SETRANGE("Unit of Measure Code", SalesInvoiceLine."Unit of Measure Code");
        SalesShipmentLine.SETFILTER(Quantity, '<>%1', 0);

        IF SalesShipmentLine.FIND('-') THEN
            REPEAT
                IF DataItem5581."Get Shipment Used" THEN
                    CorrectShipment(SalesShipmentLine);
                IF ABS(SalesShipmentLine.Quantity) <= ABS(TotalQuantity - SalesInvoiceLine.Quantity) THEN
                    TotalQuantity := TotalQuantity - SalesShipmentLine.Quantity
                ELSE BEGIN
                    IF ABS(SalesShipmentLine.Quantity) > ABS(TotalQuantity) THEN
                        SalesShipmentLine.Quantity := TotalQuantity;
                    Quantity :=
                      SalesShipmentLine.Quantity - (TotalQuantity - SalesInvoiceLine.Quantity);

                    TotalQuantity := TotalQuantity - SalesShipmentLine.Quantity;
                    SalesInvoiceLine.Quantity := SalesInvoiceLine.Quantity - Quantity;

                    IF SalesShipmentHeader.GET(SalesShipmentLine."Document No.") THEN BEGIN
                        AddBufferEntry(
                          SalesInvoiceLine,
                          Quantity,
                          SalesShipmentHeader."Posting Date");
                    END;
                END;
            UNTIL (SalesShipmentLine.NEXT = 0) OR (TotalQuantity = 0);
    end;

    procedure CorrectShipment(var SalesShipmentLine: Record "Sales Shipment Line")
    var
        SalesInvoiceLine: Record "Sales Invoice Line";
    begin
        SalesInvoiceLine.SETCURRENTKEY("Shipment No.", "Shipment Line No.");
        SalesInvoiceLine.SETRANGE("Shipment No.", SalesShipmentLine."Document No.");
        SalesInvoiceLine.SETRANGE("Shipment Line No.", SalesShipmentLine."Line No.");
        IF SalesInvoiceLine.FIND('-') THEN
            REPEAT
                SalesShipmentLine.Quantity := SalesShipmentLine.Quantity - SalesInvoiceLine.Quantity;
            UNTIL SalesInvoiceLine.NEXT = 0;
    end;

    procedure AddBufferEntry(SalesInvoiceLine: Record "Sales Invoice Line"; QtyOnShipment: Decimal; PostingDate: Date)
    begin
        SalesShipmentBuffer.SETRANGE("Document No.", SalesInvoiceLine."Document No.");
        SalesShipmentBuffer.SETRANGE("Line No.", SalesInvoiceLine."Line No.");
        SalesShipmentBuffer.SETRANGE("Posting Date", PostingDate);
        IF SalesShipmentBuffer.FIND('-') THEN BEGIN
            SalesShipmentBuffer.Quantity := SalesShipmentBuffer.Quantity + QtyOnShipment;
            SalesShipmentBuffer.MODIFY;
            EXIT;
        END;

        WITH SalesShipmentBuffer DO BEGIN
            "Document No." := SalesInvoiceLine."Document No.";
            "Line No." := SalesInvoiceLine."Line No.";
            "Entry No." := NextEntryNo;
            Type := SalesInvoiceLine.Type;
            "No." := SalesInvoiceLine."No.";
            Quantity := QtyOnShipment;
            "Posting Date" := PostingDate;
            INSERT;
            NextEntryNo := NextEntryNo + 1
        END;
    end;

    local procedure DocumentCaption(): Text[250]
    begin
        IF DataItem5581."Prepayment Invoice" THEN
            EXIT(Text010);
        EXIT(Text004);
    end;

    procedure InitializeRequest(NewNoOfCopies: Integer; NewShowInternalInfo: Boolean; NewLogInteraction: Boolean; NewAmountInWords: Boolean; NewCurrencyLCY: Boolean; NewShowTHFormatting: Boolean; NewDisplayAsmInfo: Boolean)
    begin
        NoOfCopies := NewNoOfCopies;
        ShowInternalInfo := NewShowInternalInfo;
        LogInteraction := NewLogInteraction;
        AmountInWords := NewAmountInWords;
        CurrencyLCY := NewCurrencyLCY;
        ShowTHFormatting := NewShowTHFormatting;
        DisplayAssemblyInformation := NewDisplayAsmInfo;
    end;

    procedure CollectAsmInformation()
    var
        ValueEntry: Record "Value Entry";
        ItemLedgerEntry: Record "Item Ledger Entry";
        PostedAsmHeader: Record "Posted Assembly Header";
        PostedAsmLine: Record "Posted Assembly Line";
        SalesShipmentLine: Record "Sales Shipment Line";
    begin
        TempPostedAsmLine.DELETEALL;
        IF DataItem1570.Type <> DataItem1570.Type::Item THEN
            EXIT;
        WITH ValueEntry DO BEGIN
            SETCURRENTKEY("Document No.");
            SETRANGE("Document No.", DataItem1570."Document No.");
            SETRANGE("Document Type", "Document Type"::"Sales Invoice");
            SETRANGE("Document Line No.", DataItem1570."Line No.");
            IF NOT FINDSET THEN
                EXIT;
        END;
        REPEAT
            IF ItemLedgerEntry.GET(ValueEntry."Item Ledger Entry No.") THEN BEGIN
                IF ItemLedgerEntry."Document Type" = ItemLedgerEntry."Document Type"::"Sales Shipment" THEN BEGIN
                    SalesShipmentLine.GET(ItemLedgerEntry."Document No.", ItemLedgerEntry."Document Line No.");
                    IF SalesShipmentLine.AsmToShipmentExists(PostedAsmHeader) THEN BEGIN
                        PostedAsmLine.SETRANGE("Document No.", PostedAsmHeader."No.");
                        IF PostedAsmLine.FINDSET THEN
                            REPEAT
                                TreatAsmLineBuffer(PostedAsmLine);
                            UNTIL PostedAsmLine.NEXT = 0;
                    END;
                END;
            END;
        UNTIL ValueEntry.NEXT = 0;
    end;

    procedure TreatAsmLineBuffer(PostedAsmLine: Record "Posted Assembly Line")
    begin
        CLEAR(TempPostedAsmLine);
        TempPostedAsmLine.SETRANGE(Type, PostedAsmLine.Type);
        TempPostedAsmLine.SETRANGE("No.", PostedAsmLine."No.");
        TempPostedAsmLine.SETRANGE("Variant Code", PostedAsmLine."Variant Code");
        TempPostedAsmLine.SETRANGE(Description, PostedAsmLine.Description);
        TempPostedAsmLine.SETRANGE("Unit of Measure Code", PostedAsmLine."Unit of Measure Code");
        IF TempPostedAsmLine.FINDFIRST THEN BEGIN
            TempPostedAsmLine.Quantity += PostedAsmLine.Quantity;
            TempPostedAsmLine.MODIFY;
        END ELSE BEGIN
            CLEAR(TempPostedAsmLine);
            TempPostedAsmLine := PostedAsmLine;
            TempPostedAsmLine.INSERT;
        END;
    end;

    procedure GetUOMText(UOMCode: Code[10]): Text[10]
    var
        UnitOfMeasure: Record "Unit of Measure";
    begin
        IF NOT UnitOfMeasure.GET(UOMCode) THEN
            EXIT(UOMCode);
        EXIT(UnitOfMeasure.Description);
    end;

    procedure BlanksForIndent(): Text[10]
    begin
        EXIT(PADSTR('', 2, ' '));
    end;
}

