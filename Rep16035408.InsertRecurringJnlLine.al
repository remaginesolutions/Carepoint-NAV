report 16035408 "Insert Recurring Jnl Line"
{
    // version CAREPOINT1.00

    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem(DataItem1000000000; "Integer")
        {
            DataItemTableView = SORTING (Number)
                                ORDER(Ascending)
                                WHERE (Number = CONST (1));
            MaxIteration = 1;

            trigger OnAfterGetRecord()
            begin
                GLAccount.RESET;
                GLAccount.SETFILTER("No.", GLaccFilter);
                GLAccount.SETRANGE("Direct Posting", TRUE);
                IF GLAccount.FINDSET THEN BEGIN

                    GenJournalLine1.RESET;
                    GenJournalLine1.SETRANGE("Journal Template Name", GenJournalLine."Journal Template Name");
                    GenJournalLine1.SETRANGE("Journal Batch Name", GenJournalLine."Journal Batch Name");
                    IF GenJournalLine1.FINDLAST THEN
                        LineNo := GenJournalLine1."Line No."
                    ELSE
                        LineNo := 0;

                    IF GenJournalTemplate.GET(GenJournalLine."Journal Template Name") THEN;

                    REPEAT
                        LineNo := LineNo + 10000;
                        GenJournalLine2.INIT;
                        GenJournalLine2."Journal Template Name" := GenJournalLine."Journal Template Name";
                        GenJournalLine2."Journal Batch Name" := GenJournalLine."Journal Batch Name";
                        GenJournalLine2."Line No." := LineNo;
                        GenJournalLine2.INSERT(TRUE);
                        GenJournalLine2.VALIDATE("Recurring Method", GenJournalLine."Recurring Method");
                        GenJournalLine2.VALIDATE("Recurring Frequency", GenJournalLine."Recurring Frequency");
                        GenJournalLine2.VALIDATE("Posting Date", GenJournalLine."Posting Date");
                        GenJournalLine2.VALIDATE("Document No.", GenJournalLine."Document No.");
                        GenJournalLine2.VALIDATE("Account Type", GenJournalLine."Account Type");
                        GenJournalLine2.VALIDATE("Account No.", GLAccount."No.");
                        GenJournalLine2.VALIDATE("Shortcut Dimension 1 Code", GenJournalLine."Shortcut Dimension 1 Code");
                        GenJournalLine2.VALIDATE("Source Code", GenJournalTemplate."Source Code");
                        GenJournalLine2.MODIFY(TRUE);
                    UNTIL GLAccount.NEXT = 0;
                END;
            end;

            trigger OnPostDataItem()
            begin
                MESSAGE(Text001);
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
                field("G/L Account Range Filter"; GLaccFilter)
                {

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        CLEAR(GLAccList);
                        GLAccList.LOOKUPMODE(TRUE);
                        IF GLAccList.RUNMODAL = ACTION::LookupOK THEN
                            GLaccFilter := GLAccList.GetSelectionFilter;
                    end;
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
        IF NOT CONFIRM(Text002, TRUE, GLaccFilter, GenJournalLine."Line No.", GenJournalLine."Shortcut Dimension 1 Code") THEN
            CurrReport.QUIT;
    end;

    var
        GLaccFilter: Code[250];
        GenJournalLine: Record "Gen. Journal Line";
        GLAccount: Record "G/L Account";
        LineNo: Integer;
        GenJournalLine1: Record "Gen. Journal Line";
        GenJournalLine2: Record "Gen. Journal Line";
        Text001: Label 'Lines have been inserted successfully.';
        Text002: Label 'Do you want to insert the Journal Lines for the Accounts %1 with default values of current record of line no.= %2 for the Program Code = %3';
        GLAccList: Page "G/L Account List";
        GenJournalTemplate: Record "Gen. Journal Template";

    procedure SetJGnlJnlLine(LGenJnlLine: Record "Gen. Journal Line")
    begin
        GenJournalLine := LGenJnlLine;
    end;
}

