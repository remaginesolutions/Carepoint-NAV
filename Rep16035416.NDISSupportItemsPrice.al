report 16035416 "NDIS Support Items Price"
{
    // version CAREPOINT1.00

    // CAREPOINT1.00 2017-01-01: Object created
    DefaultLayout = RDLC;
    RDLCLayout = './NDIS Support Items Price.rdlc';

    Caption = 'NDIS Support Items Price';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem(DataItem5508; "Resource")
        {
            RequestFilterFields = Type, "No.";
            //column(StrsubsnoFormatRepPageNo; STRSUBSTNO(Text003, FORMAT(CurrReport.PAGENO)))
            //{
            //}
            column(CompanyAddr1; CompanyAddr[1])
            {
            }
            column(CompanyAddr2; CompanyAddr[2])
            {
            }
            column(CompanyAddr3; CompanyAddr[3])
            {
            }
            column(CompanyAddr4; CompanyAddr[4])
            {
            }
            column(CompanyAddr5; CompanyAddr[5])
            {
            }
            column(CompanyAddr6; CompanyAddr[6])
            {
            }
            column(StrsubsnoAsofFormatWorkDt; STRSUBSTNO(Text004, FORMAT(WORKDATE, 0, 4)))
            {
            }
            column(PhoneNo_CompanyInfo; CompanyInfo."Phone No.")
            {
            }
            column(VATResgNo_CompanyInfo; CompanyInfo."VAT Registration No.")
            {
            }
            column(GiroNo_CompanyInfo; CompanyInfo."Giro No.")
            {
            }
            column(BankName_CompanyInfo; CompanyInfo."Bank Name")
            {
            }
            column(BankAccNo_CompanyInfo; CompanyInfo."Bank Account No.")
            {
            }
            column(ResFldCaptUnitPriceCurrTxt; ResPrice.FIELDCAPTION("Unit Price") + CurrencyText)
            {
            }
            column(No_Resource; "No.")
            {
            }
            column(Type_Resource; Type)
            {
                IncludeCaption = true;
            }
            column(UnitPrice_Resource; "Unit Price")
            {
            }
            column(HomePage_CompanyInfo; CompanyInfo."Home Page")
            {
            }
            column(Email_CompanyInfo; CompanyInfo."E-Mail")
            {
            }
            column(ResourceName; Name)
            {
            }
            column(ResourcePriceListCaption; ResourcePriceListCaptionLbl)
            {
            }
            column(CompanyInfoPhoneNoCaption; CompanyInfoPhoneNoCaptionLbl)
            {
            }
            column(CompanyInfoVATRegistrationNoCaption; CompanyInfoVATRegistrationNoCaptionLbl)
            {
            }
            column(CompanyInfoGiroNoCaption; CompanyInfoGiroNoCaptionLbl)
            {
            }
            column(CompanyInfoBankNameCaption; CompanyInfoBankNameCaptionLbl)
            {
            }
            column(CompanyInfoBankAccountNoCaption; CompanyInfoBankAccountNoCaptionLbl)
            {
            }
            column(ResourceNoCaption; ResourceNoCaptionLbl)
            {
            }
            column(WorkTypeCaption; WorkTypeCaptionLbl)
            {
            }
            column(ResourceNameCaption; ResourceNameCaptionLbl)
            {
            }
            column(WorkTypeDescriptionCaption; WorkTypeDescriptionCaptionLbl)
            {
            }
            dataitem(DataItem5444; "Integer")
            {
                DataItemTableView = SORTING (Number)
                                    WHERE (Number = FILTER (1 ..));
                column(UnitPrice_ResPrice; ResPrice."Unit Price")
                {
                    AutoFormatType = 2;
                }
                column(WorkTypeCode_ResPrice; ResPrice."Work Type Code")
                {
                }
                column(Description_WorkType; WorkType.Description)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    PriceInCurrency := FALSE;

                    IF Number = 1 THEN
                        Ok := ResPriceBuffer.FIND('-')
                    ELSE
                        Ok := ResPriceBuffer.NEXT <> 0;
                    IF NOT Ok THEN
                        CurrReport.BREAK;
                    IF ResPriceBuffer."Work Type Code" = '' THEN
                        CurrReport.SKIP;

                    ResPrice.Type := ResPrice.Type::Resource;
                    ResPrice.Code := DataItem5508."No.";
                    ResPrice."Work Type Code" := ResPriceBuffer."Work Type Code";
                    ResPrice."Currency Code" := Currency.Code;
                    CODEUNIT.RUN(CODEUNIT::"Resource-Find Price", ResPrice);
                    WorkType.GET(ResPrice."Work Type Code");
                    PriceInCurrency := ResPrice."Currency Code" <> '';

                    IF (Currency.Code <> '') AND (NOT PriceInCurrency) THEN
                        ResPrice."Unit Price" :=
                          ROUND(
                            CurrExchRate.ExchangeAmtLCYToFCY(
                              WORKDATE, Currency.Code, ResPrice."Unit Price",
                              CurrExchRate.ExchangeRate(
                                WORKDATE, Currency.Code)),
                            Currency."Unit-Amount Rounding Precision");
                end;

                trigger OnPostDataItem()
                begin
                    ResPriceBuffer.SETRANGE(Type, ResPriceBuffer.Type::Resource, ResPriceBuffer.Type::"Group(Resource)");
                    ResPriceBuffer.DELETEALL;
                end;

                trigger OnPreDataItem()
                begin
                    ResPrice.SETFILTER(Code, '%1|%2', DataItem5508."No.", '');
                    ResPriceBuffer.RESET;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                PriceInCurrency := FALSE;
                ResPrice."Currency Code" := Currency.Code;
                ResPrice.Code := "No.";
                ResPrice."Work Type Code" := '';
                CODEUNIT.RUN(CODEUNIT::"Resource-Find Price", ResPrice);
                "Unit Price" := ResPrice."Unit Price";
                PriceInCurrency := ResPrice."Currency Code" <> '';
                IF (Currency.Code <> '') AND (NOT PriceInCurrency) THEN
                    "Unit Price" :=
                      ROUND(
                        CurrExchRate.ExchangeAmtLCYToFCY(
                          WORKDATE, Currency.Code, "Unit Price",
                          CurrExchRate.ExchangeRate(
                            WORKDATE, Currency.Code)),
                        Currency."Unit-Amount Rounding Precision");

                ResPrice.SETRANGE(Type, ResPrice.Type::Resource);
                ResPrice.SETRANGE(Code, "No.");
                FindWorkTypes;
                ResPrice.SETRANGE(Type, ResPrice.Type::"Group(Resource)");
                ResPrice.SETRANGE(Code, "Resource Group No.");
                FindWorkTypes;
            end;

            trigger OnPreDataItem()
            begin
                ResPrice.SETFILTER("Currency Code", '%1|%2', Currency.Code, '');

                ResPriceBuffer.INIT;
                ResPrice.SETRANGE(Type, ResPrice.Type::All);
                IF ResPrice.FIND('-') THEN
                    REPEAT
                        ResPriceBuffer.Type := ResPrice.Type;
                        ResPriceBuffer."Work Type Code" := ResPrice."Work Type Code";
                        Ok := ResPriceBuffer.INSERT;
                    UNTIL ResPrice.NEXT = 0;
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
                    field(Currency; Currency."Code")
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Currency Code';
                        TableRelation = Currency;
                        ToolTip = 'Specifies the code for the currency that amounts are shown in.';
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
        EMailIdCaption = 'EMail';
        HomePageCaption = 'Home Page';
    }

    trigger OnPreReport()
    begin
        CompanyInfo.GET;
        FormatAddr.Company(CompanyAddr, CompanyInfo);
        IF Currency.Code <> '' THEN
            CurrencyText := ' (' + Currency.Code + ')';
    end;

    var
        Text003: Label 'Page %1';
        Text004: Label 'As of %1';
        CompanyInfo: Record "Company Information";
        Currency: Record "Currency";
        CurrExchRate: Record "Currency Exchange Rate";
        ResPrice: Record "Resource Price";
        ResPriceBuffer: Record "Resource Price" temporary;
        WorkType: Record "Work Type";
        FormatAddr: Codeunit "Format Address";
        CompanyAddr: array[8] of Text[50];
        PriceInCurrency: Boolean;
        Ok: Boolean;
        CurrencyText: Text[30];
        ResourcePriceListCaptionLbl: Label 'Resource - Price List';
        CompanyInfoPhoneNoCaptionLbl: Label 'Phone No.';
        CompanyInfoVATRegistrationNoCaptionLbl: Label 'VAT Reg. No.';
        CompanyInfoGiroNoCaptionLbl: Label 'Giro No.';
        CompanyInfoBankNameCaptionLbl: Label 'Bank';
        CompanyInfoBankAccountNoCaptionLbl: Label 'Account No.';
        ResourceNoCaptionLbl: Label 'Resource No.';
        WorkTypeCaptionLbl: Label 'Work Type';
        ResourceNameCaptionLbl: Label 'Resource Name';
        WorkTypeDescriptionCaptionLbl: Label 'Work Type Description';

    local procedure FindWorkTypes()
    begin
        IF ResPrice.FIND('-') THEN
            REPEAT
                ResPriceBuffer.SETRANGE("Work Type Code", ResPrice."Work Type Code");
                IF NOT ResPriceBuffer.FIND('-') THEN BEGIN
                    ResPriceBuffer.Type := ResPrice.Type;
                    ResPriceBuffer."Work Type Code" := ResPrice."Work Type Code";
                    Ok := ResPriceBuffer.INSERT;
                END;
            UNTIL ResPrice.NEXT = 0;
    end;

    procedure InitializeRequest(CurrencyCodeFrom: Code[10])
    begin
        Currency.Code := CurrencyCodeFrom;
    end;
}

