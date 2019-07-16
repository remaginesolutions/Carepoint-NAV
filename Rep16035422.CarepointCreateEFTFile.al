report 16035422 "Carepoint Create EFT File"
{
    // version CAREPOINT1.00

    Caption = 'Create EFT File';
    Permissions = TableData 25 = rim;
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem(DataItem7024; "Gen. Journal Line")
        {
            DataItemTableView = SORTING ("Journal Template Name", "Journal Batch Name", "Line No.");

            trigger OnAfterGetRecord()
            begin
                Counter += 1;
                ProcessWindow.UPDATE(1, ROUND(Counter / NoOfRec * 10000, 1.0));
                IF Vendor.GET("Account No.") THEN BEGIN
                    IF Vendor."EFT Payment" THEN
                        Vendor.TESTFIELD("EFT Bank Account No.")
                    ELSE
                        ERROR(Text11003, "Account No.");
                END;
                TESTFIELD("EFT Payment");
                IF "EFT Register No." <> 0 THEN
                    ERROR(PaymentAlreadyExportedErr, "Journal Template Name", "Journal Batch Name", "Line No.");
                BankAccountNo := GetBankAccountNo(DataItem7024);
                IF (PrevBankAcctNo <> '') AND (PrevBankAcctNo <> BankAccountNo) THEN
                    ERROR(BankAccountNotTheSameErr, BankAccountNo, "Line No.", PrevBankAcctNo);

                IF "EFT Payment" THEN BEGIN
                    VendBankAcc.GET(Vendor."No.", "EFT Bank Account No.");
                    VendBankAcc.TESTFIELD("Bank Account No.");
                    VendBankAcc.TESTFIELD("EFT BSB No.");
                END;

                IF VendLedgEntry."EFT Register No." <> 0 THEN
                    ERROR(Text11001, FORMAT("Applies-to Doc. Type"), "Applies-to Doc. No.",
                      VendLedgEntry.FIELDCAPTION("EFT Register No."), VendLedgEntry."EFT Register No.");

                "EFT Register No." := EFTRegister."No.";
                MODIFY;

                PrevBankAcctNo := BankAccountNo;
            end;

            trigger OnPostDataItem()
            begin
                ProcessWindow.CLOSE;

                IF Counter = 0 THEN
                    ERROR(NothingToExportErr);
                BankAcc.GET(BankAccountNo);
                BankAcc.TESTFIELD("Bank Account No.");
                BankAcc.TESTFIELD("EFT Bank Code");
                BankAcc.TESTFIELD("EFT BSB No.");
                BankAcc.TESTFIELD("EFT Security No.");
                // EFTRegister."Bank Reference" := "Bank Reference";                              //ReSRP #10882
                EFTRegister.INSERT;
                //EFTManagement.CreateFileFromEFTRegister(EFTRegister, EFTFileDescription, BankAcc);
            end;

            trigger OnPreDataItem()
            begin
                IF EFTFileDescription = '' THEN
                    ERROR(Text11007);

                SETRANGE("Journal Template Name", GenJnlLine."Journal Template Name");
                SETRANGE("Journal Batch Name", GenJnlLine."Journal Batch Name");

                EFTRegister.RESET;
                EFTRegister.LOCKTABLE;
                IF NOT EFTRegister.FINDLAST THEN
                    CLEAR(EFTRegister."No.");
                EFTRegister."No." += 1;

                EFTRegister.INIT;
                EFTRegister."EFT Payment" := TRUE;
                SETFILTER("Account No.", '<>%1', '');
                SETRANGE("Account Type", "Account Type"::Vendor);

                GenJnlLine1.COPYFILTERS(GenJnlLine);

                ProcessWindow.OPEN('@1@@@@@@@@@@@@@@@@@@@@@@@@@');
                NoOfRec := GenJnlLine1.COUNT;
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
                    field(EFTFileDescription; EFTFileDescription)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'EFT File Description';
                        ToolTip = 'Specifies a description for the EFT file.';
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

    var
        EFTRegister: Record "EFT Register";
        Vendor: Record "Vendor";
        VendLedgEntry: Record "Vendor Ledger Entry";
        GenJnlLine: Record "Gen. Journal Line";
        VendBankAcc: Record "Vendor Bank Account";
        BankAcc: Record "Bank Account";
        GenJnlLine1: Record "Gen. Journal Line";
        EFTManagement: Codeunit "EFT Management";
        ProcessWindow: Dialog;
        Counter: Integer;
        NoOfRec: Integer;
        EFTFileDescription: Text[12];
        PrevBankAcctNo: Code[20];
        Text11001: Label '%1 %2 already exist in %3 %4.';
        Text11003: Label 'EFT Type must not be blank for Vendor No. %1.';
        Text11007: Label 'Please enter the EFT File Description.', Comment = 'Input for description of EFT File.';
        BankAccountNo: Code[20];
        BankAccountNotTheSameErr: Label 'The file can be created for one bank account only. Balancing bank account number %1 for line %2 does not match bank account number %3.', Comment = '%1 and %3 - bank account number, %2 - journal line number.';
        NothingToExportErr: Label 'There is nothing to export.';
        PaymentAlreadyExportedErr: Label 'Line number %3 in journal template name %1, journal batch name %2 has been already exported.', Comment = '%1 - journal template name, %2 - journal batch name, %3 - line number';

    procedure SetGenJnlLine(NewGLJnlLine: Record "Gen. Journal Line")
    begin
        GenJnlLine := NewGLJnlLine;
    end;

    //procedure GetServerFileName(): Text
    //begin
    //    EXIT(EFTManagement.GetServerFileName);
    //end;

    local procedure GetBankAccountNo(GenJournalLine: Record "Gen. Journal Line"): Code[20]
    var
        BalGenJournalLine: Record "Gen. Journal Line";
    begin
        IF GenJournalLine."Bal. Account No." <> '' THEN
            EXIT(GenJournalLine."Bal. Account No.");

        BalGenJournalLine.SETRANGE("Journal Template Name", GenJournalLine."Journal Template Name");
        BalGenJournalLine.SETRANGE("Journal Batch Name", GenJournalLine."Journal Batch Name");
        BalGenJournalLine.SETRANGE("Document No.", GenJnlLine."Document No.");
        BalGenJournalLine.SETRANGE("Posting Date", GenJnlLine."Posting Date");
        BalGenJournalLine.SETRANGE("Account Type", BalGenJournalLine."Account Type"::"Bank Account");
        BalGenJournalLine.FINDFIRST;
        EXIT(BalGenJournalLine."Account No.");
    end;
}

