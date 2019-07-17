report 16035419 "G/L Trial Balance Carepoint"
{
    // version CAREPOINT1.00

    // CAREPOINT1.00 2017-01-01: Object created
    DefaultLayout = RDLC;
    RDLCLayout = './GL Trial Balance Carepoint.rdlc';

    Caption = 'G/L Trial Balance';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem(DataItem6710; "G/L Account")
        {
            DataItemTableView = SORTING ("No.");
            RequestFilterFields = "No.", "Date Filter", "G/L Entry Type Filter";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(STRSUBSTNO_Text003_USERID_; STRSUBSTNO(Text003, USERID))
            {
            }
            column(STRSUBSTNO_Text004_PreviousStartDate_; STRSUBSTNO(Text004, PreviousStartDate))
            {
            }
            //column(STRSUBSTNO_Text005_CurrReport_PAGENO_; STRSUBSTNO(Text005, CurrReport.PAGENO))
            //{
            //}
            column(PageCaption; STRSUBSTNO(Text005, ''))
            {
            }
            column(UserCaption; STRSUBSTNO(Text003, ''))
            {
            }
            column(G_L_Account__TABLECAPTION__________Filter; DataItem6710.TABLECAPTION + ': ' + Filter)
            {
            }
            column("Filter"; Filter)
            {
            }
            column(FiscalYearStatusText; FiscalYearStatusText)
            {
            }
            column(Text006; Text006Lbl)
            {
            }
            //column(G_L_Account__GETFILTER; DataItem6710.GETFILTER("G/L Entry Type Filter"))
            //{
            //}
            column(G_L_Account__No__; "No.")
            {
            }
            column(G_L_Account_Name; Name)
            {
            }
            column(GLAccount2__Debit_Amount____GLAccount2__Credit_Amount_; GLAccount2."Debit Amount" - GLAccount2."Credit Amount")
            {
            }
            column(GLAccount2__Credit_Amount____GLAccount2__Debit_Amount_; GLAccount2."Credit Amount" - GLAccount2."Debit Amount")
            {
            }
            column(G_L_Account__Debit_Amount_; "Debit Amount")
            {
            }
            column(G_L_Account__Credit_Amount_; "Credit Amount")
            {
            }
            column(GLAccount2__Debit_Amount_____Debit_Amount____GLAccount2__Credit_Amount_____Credit_Amount_; GLAccount2."Debit Amount" + "Debit Amount" - GLAccount2."Credit Amount" - "Credit Amount")
            {
            }
            column(GLAccount2__Credit_Amount_____Credit_Amount____GLAccount2__Debit_Amount_____Debit_Amount_; GLAccount2."Credit Amount" + "Credit Amount" - GLAccount2."Debit Amount" - "Debit Amount")
            {
            }
            column(TLAccountType; TLAccountType)
            {
            }
            column(G_L_Account__No___Control1500062; "No.")
            {
            }
            column(G_L_Account_Name_Control1500064; Name)
            {
            }
            column(GLAccount2__Debit_Amount____GLAccount2__Credit_Amount__Control1500066; GLAccount2."Debit Amount" - GLAccount2."Credit Amount")
            {
            }
            column(GLAccount2__Credit_Amount____GLAccount2__Debit_Amount__Control1500068; GLAccount2."Credit Amount" - GLAccount2."Debit Amount")
            {
            }
            column(G_L_Account__Debit_Amount__Control1500070; "Debit Amount")
            {
            }
            column(G_L_Account__Credit_Amount__Control1500072; "Credit Amount")
            {
            }
            column(GLAccount2__Debit_Amount_____Debit_Amount____GLAccount2__Credit_Amount_____Credit_Amount__Control1500074; GLAccount2."Debit Amount" + "Debit Amount" - GLAccount2."Credit Amount" - "Credit Amount")
            {
            }
            column(GLAccount2__Credit_Amount_____Credit_Amount____GLAccount2__Debit_Amount_____Debit_Amount__Control1500076; GLAccount2."Credit Amount" + "Credit Amount" - GLAccount2."Debit Amount" - "Debit Amount")
            {
            }
            column(G_L_Trial_BalanceCaption; G_L_Trial_BalanceCaptionLbl)
            {
            }
            column(No_Caption; No_CaptionLbl)
            {
            }
            column(NameCaption; NameCaptionLbl)
            {
            }
            column(Balance_at_Starting_DateCaption; Balance_at_Starting_DateCaptionLbl)
            {
            }
            column(Balance_Date_RangeCaption; Balance_Date_RangeCaptionLbl)
            {
            }
            column(Balance_at_Ending_dateCaption; Balance_at_Ending_dateCaptionLbl)
            {
            }
            column(DebitCaption; DebitCaptionLbl)
            {
            }
            column(CreditCaption; CreditCaptionLbl)
            {
            }
            column(DebitCaption_Control1500030; DebitCaption_Control1500030Lbl)
            {
            }
            column(CreditCaption_Control1500032; CreditCaption_Control1500032Lbl)
            {
            }
            column(DebitCaption_Control1500034; DebitCaption_Control1500034Lbl)
            {
            }
            column(CreditCaption_Control1500036; CreditCaption_Control1500036Lbl)
            {
            }

            trigger OnAfterGetRecord()
            begin
                GLAccount2.COPY(DataItem6710);
                WITH GLAccount2 DO BEGIN
                    IF "Income/Balance" = 0 THEN BEGIN
                        SETRANGE("Date Filter", PreviousStartDate, PreviousEndDate);
                        CALCFIELDS("Debit Amount", "Credit Amount");
                    END ELSE BEGIN
                        SETRANGE("Date Filter", 0D, PreviousEndDate);
                        CALCFIELDS("Debit Amount", "Credit Amount");
                    END;
                END;
                IF NOT ImprNonMvt AND
                   (GLAccount2."Debit Amount" = 0) AND
                   ("Debit Amount" = 0) AND
                   (GLAccount2."Credit Amount" = 0) AND
                   ("Credit Amount" = 0)
                THEN
                    CurrReport.SKIP;

                TLAccountType := DataItem6710."Account Type";
            end;

            trigger OnPreDataItem()
            begin
                IF GETFILTER("Date Filter") = '' THEN
                    ERROR(Text001, FIELDCAPTION("Date Filter"));
                IF COPYSTR(GETFILTER("Date Filter"), 1, 1) = '.' THEN
                    ERROR(Text002);
                StartDate := GETRANGEMIN("Date Filter");
                PreviousEndDate := CLOSINGDATE(StartDate - 1);
                FiltreDateCalc.CreateFiscalYearFilter(TextDate, TextDate, StartDate, 0);
                TextDate := CONVERTSTR(TextDate, '.', ',');
                // FiltreDateCalc.VerifiyDateFilter(TextDate);
                TextDate := COPYSTR(TextDate, 1, 8);
                EVALUATE(PreviousStartDate, TextDate);
                IF COPYSTR(GETFILTER("Date Filter"), STRLEN(GETFILTER("Date Filter")), 1) = '.' THEN
                    EndDate := 0D
                ELSE
                    EndDate := GETRANGEMAX("Date Filter");
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
                    field(ImprNonMvt; ImprNonMvt)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Print G/L Accs. without balance';
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
        Filter := DataItem6710.GETFILTERS;
    end;

    var
        Text001: Label 'You must fill in the %1 field.';
        Text002: Label 'You must specify a Starting Date.';
        Text003: Label 'Printed by %1';
        Text004: Label 'Fiscal Year Start Date : %1';
        Text005: Label 'Page %1';
        GLAccount2: Record "G/L Account";
        FiltreDateCalc: Codeunit "DateFilter-Calc";
        StartDate: Date;
        EndDate: Date;
        PreviousStartDate: Date;
        PreviousEndDate: Date;
        TextDate: Text[30];
        ImprNonMvt: Boolean;
        "Filter": Text[250];
        FiscalYearStatusText: Text[80];
        TLAccountType: Integer;
        Text006Lbl: Label 'This report includes simulation entries.';
        G_L_Trial_BalanceCaptionLbl: Label 'G/L Trial Balance';
        No_CaptionLbl: Label 'No.';
        NameCaptionLbl: Label 'Name';
        Balance_at_Starting_DateCaptionLbl: Label 'Balance at Starting Date';
        Balance_Date_RangeCaptionLbl: Label 'Balance Date Range';
        Balance_at_Ending_dateCaptionLbl: Label 'Balance at Ending date';
        DebitCaptionLbl: Label 'Debit';
        CreditCaptionLbl: Label 'Credit';
        DebitCaption_Control1500030Lbl: Label 'Debit';
        CreditCaption_Control1500032Lbl: Label 'Credit';
        DebitCaption_Control1500034Lbl: Label 'Debit';
        CreditCaption_Control1500036Lbl: Label 'Credit';
}

