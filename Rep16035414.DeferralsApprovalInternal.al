report 16035414 "Deferrals Approval - Internal"
{
    // version CAREPOINT1.00

    // CAREPOINT1.00 2017-01-01: Object created
    DefaultLayout = RDLC;
    RDLCLayout = './Deferrals Approval - Internal.rdlc';

    Caption = 'Deferrals Approval - Internal';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem(DataItem17; "Posted Deferral Header")
        {
            //DataItemTableView = SORTING ("Deferral Doc. Type", "Account No.", "Posting Date", "Gen. Jnl. Document No.", "Document Type", "Document No.", "Line No.")
                                //ORDER(Ascending)
                                //WHERE ("Deferral Doc. Type" = CONST ("G/L"));
            RequestFilterFields = "Account No.";
            column(CompanyName; COMPANYNAME)
            {
            }
            column(PageGroupNo; PageGroupNo)
            {
            }
            column(PostedDeferralTableCaption; TABLECAPTION + ': ' + PostedDeferralFilter)
            {
            }
            column(PostedDeferralFilter; PostedDeferralFilter)
            {
            }
            column(EmptyString; '')
            {
            }
            column(No_GLAcc; "Account No.")
            {
            }
            column(DeferralSummaryGLCaption; DeferralSummaryGLCaptionLbl)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(BalanceCaption; BalanceCaptionLbl)
            {
            }
            column(PeriodCaption; PeriodCaptionLbl)
            {
            }
            column(GLBalCaption; GLBalCaptionLbl)
            {
            }
            column(RemAmtDefCaption; RemAmtDefCaptionLbl)
            {
            }
            column(TotAmtDefCaption; TotAmtDefCaptionLbl)
            {
            }
            column(BalanceAsOfDateCaption; BalanceAsOfDateCaptionLbl + FORMAT(BalanceAsOfDateFilter))
            {
            }
            column(BalanceAsOfDateFilter; BalanceAsOfDateFilter)
            {
            }
            column(AccountNoCaption; AccountNoLbl)
            {
            }
            column(AmtRecognizedCaption; AmtRecognizedLbl)
            {
            }
            column(AccountName; AccountName)
            {
            }
            column(NumOfPeriods; "No. of Periods")
            {
            }
            column(DocumentType; "Document Type")
            {
            }
            column(DeferralStartDate; FORMAT("Start Date"))
            {
            }
            column(AmtRecognized; AmtRecognized)
            {
            }
            column(RemainingAmtDeferred; RemainingAmtDeferred)
            {
            }
            column(TotalAmtDeferred; "Amount to Defer (LCY)")
            {
            }
            column(PostingDate; FORMAT(PostingDate))
            {
            }
            column(DeferralAccount; DeferralAccount)
            {
            }
            column(Amount; "Amount to Defer (LCY)")
            {
            }
            column(GenJnlDocNo; "Gen. Jnl. Document No.")
            {
            }
            column(GLDocType; GLDocType)
            {
            }

            trigger OnAfterGetRecord()
            var
                GLEntry: Record "G/L Entry";
            begin
                PreviousAccount := WorkingAccount;
                IF GLAccount.GET("Account No.") THEN BEGIN
                    AccountName := GLAccount.Name;
                    WorkingAccount := GLAccount."No.";
                END;

                AmtRecognized := 0;
                RemainingAmtDeferred := 0;

                PostedDeferralLine.SETRANGE("Deferral Doc. Type", "Deferral Doc. Type");
                PostedDeferralLine.SETRANGE("Gen. Jnl. Document No.", "Gen. Jnl. Document No.");
                PostedDeferralLine.SETRANGE("Account No.", "Account No.");
                PostedDeferralLine.SETRANGE("Document Type", "Document Type");
                PostedDeferralLine.SETRANGE("Document No.", "Document No.");
                PostedDeferralLine.SETRANGE("Line No.", "Line No.");
                IF PostedDeferralLine.FIND('-') THEN
                    REPEAT
                        DeferralAccount := PostedDeferralLine."Deferral Account";
                        IF PostedDeferralLine."Posting Date" <= BalanceAsOfDateFilter THEN
                            AmtRecognized := AmtRecognized + PostedDeferralLine."Amount (LCY)"
                        ELSE
                            RemainingAmtDeferred := RemainingAmtDeferred + PostedDeferralLine."Amount (LCY)";
                    UNTIL (PostedDeferralLine.NEXT = 0);

                IF GLEntry.GET("Entry No.") THEN BEGIN
                    GLDocType := GLEntry."Document Type";
                    PostingDate := GLEntry."Posting Date";
                END;

                IF PrintOnlyOnePerPage AND (PreviousAccount <> WorkingAccount) THEN BEGIN
                    PostedDeferralHeaderPage.RESET;
                    PostedDeferralHeaderPage.SETRANGE("Account No.", "Account No.");
                    IF PostedDeferralHeaderPage.FINDFIRST THEN
                        PageGroupNo := PageGroupNo + 1;
                END;
            end;

            trigger OnPreDataItem()
            begin
                PageGroupNo := 1;

                //CurrReport.NEWPAGEPERRECORD := PrintOnlyOnePerPage;
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
                    field(NewPageperGLAcc; PrintOnlyOnePerPage)
                    {
                        Caption = 'New Page per G/L Acc.';
                    }
                    field(BalanceAsOfDateFilter; BalanceAsOfDateFilter)
                    {
                        Caption = 'Balance as of:';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        begin
            IF BalanceAsOfDateFilter = 0D THEN
                BalanceAsOfDateFilter := WORKDATE;
        end;
    }

    labels
    {
        PostingDateCaption = 'Posting Date';
        DocNoCaption = 'Document No.';
        DescCaption = 'Description';
        EntryNoCaption = 'Entry No.';
        NoOfPeriodsCaption = 'No. of Periods';
        DeferralAccountCaption = 'Deferral Account';
        DocTypeCaption = 'Document Type';
        DefStartDateCaption = 'Deferral Start Date';
        AcctNameCaption = 'Account Name';
    }

    trigger OnPreReport()
    begin
        PostedDeferralFilter := DataItem17.GETFILTERS;
    end;

    var
        PostedDeferralHeaderPage: Record "Posted Deferral Header";
        GLAccount: Record "G/L Account";
        PostedDeferralLine: Record "Posted Deferral Line";
        GLDocType: Option " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        PostedDeferralFilter: Text;
        PrintOnlyOnePerPage: Boolean;
        PageGroupNo: Integer;
        PageCaptionLbl: Label 'Page';
        BalanceCaptionLbl: Label 'This also includes general ledger accounts that only have a balance.';
        PeriodCaptionLbl: Label 'This report also includes closing entries within the period.';
        GLBalCaptionLbl: Label 'Balance';
        DeferralSummaryGLCaptionLbl: Label 'Deferral Summary - GL';
        RemAmtDefCaptionLbl: Label 'Remaining Amt. Deferred';
        TotAmtDefCaptionLbl: Label 'Total Amt. Deferred';
        BalanceAsOfDateFilter: Date;
        PostingDate: Date;
        AmtRecognized: Decimal;
        RemainingAmtDeferred: Decimal;
        BalanceAsOfDateCaptionLbl: Label 'Balance as of: ';
        AccountNoLbl: Label 'Account No.';
        AmtRecognizedLbl: Label 'Amt. Recognized';
        AccountName: Text[50];
        WorkingAccount: Code[20];
        PreviousAccount: Code[20];
        DeferralAccount: Code[20];

    procedure InitializeRequest(NewPrintOnlyOnePerPage: Boolean; NewBalanceAsOfDateFilter: Date)
    begin
        PrintOnlyOnePerPage := NewPrintOnlyOnePerPage;
        BalanceAsOfDateFilter := NewBalanceAsOfDateFilter;
    end;
}

