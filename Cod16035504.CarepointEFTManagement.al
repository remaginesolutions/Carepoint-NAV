/*
codeunit 16035504 "Carepoint EFT Management"
{
    // version CAREPOINT1.00

    // CAREPOINT1.00 #10882 RP 2017-11-22: Code added for Bank Reference field
    // CAREPOINT1.00 #11804 Code changed

    Permissions = TableData 25 = rim;

    trigger OnRun()
    begin
    end;

    var
        GLSetup: Record "General Ledger Setup";
        VendBankAcc: Record "Vendor Bank Account";
        Vend: Record "Vendor";
        CompanyInfo: Record "Company Information";
        CarepointSetup: Record "Carepoint Setup";
        RBMgt: Codeunit "File Management";
        FileVar: File;
        NoOfLines: Integer;
        TypeOfLine: Code[2];
        ServerFileName: Text;
        TotalAmount: Decimal;
        TotalAmountLCY: Decimal;
        Text11000: Label 'The value for the parameter is too long for the function. The value is %1.';
        Text11001: Label 'The length for %1 is %2 long, %3 characters are maximum.';
        Text11002: Label 'File EFT Payment created with Amount=%1.', Comment = '%1 - amount';
        Text11003: Label 'The value for the parameter is too long for the function %1. The value is %2.';
        ConfirmCancelExportQst: Label 'Do you want to cancel the EFT Payment export?';
        EFTRegisterExportCanceledMsg: Label 'EFT register number %1 has been canceled.', Comment = '%1 - register number';
        InvalidWHTRealizedTypeErr: Label 'Line number %3 in journal template name %1, journal batch name %2 cannot be exported because it must be applied to an invoice when the WHT Realized Type field contains Payment.', Comment = '%1 - journal template name, %2 - journal batch name, %3 - line number';

    procedure CleanUpEFTRegister()
    var
        VendLedgEntry: Record "Vendor Ledger Entry";
        EFTRegister: Record "EFT Register";
    begin
        EFTRegister.RESET;
        VendLedgEntry.RESET;
        VendLedgEntry.SETCURRENTKEY("EFT Register No.");
        IF EFTRegister.FINDSET THEN
            REPEAT
                VendLedgEntry.SETRANGE("EFT Register No.", EFTRegister."No.");
                IF NOT VendLedgEntry.FINDFIRST THEN
                    EFTRegister.DELETE;
            UNTIL EFTRegister.NEXT = 0;
    end;

    procedure Date2Text(Date: Date; Length: Integer): Text[6]
    begin
        IF (Length < 1) OR (Length > 6) THEN
            ERROR(Text11000, Length);
        IF Date <> 0D THEN
            EXIT(COPYSTR(FORMAT(Date, 0, '<Day,2><Month,2><Year,2>'), 1, Length));
        EXIT(PADSTR('', Length));
    end;

    procedure ClearText(Text: Text[250]): Text[250]
    begin
        EXIT(DELCHR(Text, '=', DELCHR(Text, '=', '0123456789')));
    end;

    procedure NFL(Text: Text[250]; Length: Integer): Text[250]
    begin
        Text := DELCHR(Text, '<>');
        IF (Length < 1) OR (Length > 250) THEN
            ERROR(Text11003, 'NFL', Length);
        IF STRLEN(Text) > Length THEN
            Text := COPYSTR(Text, STRLEN(Text) - Length + 1);
        EXIT(PADSTR('', Length - STRLEN(Text), '0') + Text);
    end;

    procedure TFL(Text: Text[250]; Length: Integer): Text[250]
    begin
        Text := DELCHR(Text, '<>');
        IF (Length < 1) OR (Length > 250) THEN
            ERROR(Text11003, 'TFL', Length);
        Text := COPYSTR(Text, 1, Length);
        EXIT(PADSTR('', Length - STRLEN(Text), ' ') + Text);
    end;

    procedure TFR(Text: Text[250]; Length: Integer): Text[250]
    begin
        Text := DELCHR(Text, '<>');
        IF (Length < 1) OR (Length > 250) THEN
            ERROR(Text11003, 'TFR', Length);
        EXIT(UPPERCASE(PADSTR(Text, Length)));
    end;

    procedure BLK(Length: Integer): Text[250]
    begin
        IF (Length < 1) OR (Length > 250) THEN
            ERROR(Text11003, 'BLK', Length);
        EXIT(PADSTR('', Length));
    end;

    procedure Value1(Dec: Decimal; Length: Integer): Text[250]
    begin
        EXIT(NFL(ClearText(FORMAT(ROUND(Dec, 1.0))), Length));
    end;

    procedure Value100(Dec: Decimal; Length: Integer): Text[250]
    begin
        IF Dec = 0 THEN
            EXIT(NFL('000', Length));
        EXIT(NFL(ClearText(FORMAT(ROUND(Dec) * 100)), Length));
    end;

    procedure GetSetup()
    begin
        CompanyInfo.GET;
        GLSetup.GET;
    end;

    procedure OpenFile()
    begin
        // FileVar.TEXTMODE(TRUE);
        // FileVar.WRITEMODE(TRUE);
        // ServerFileName := RBMgt.ServerTempFileName('.txt');
        // FileVar.CREATE(ServerFileName);
        CLEAR(TotalAmount);
        CLEAR(NoOfLines);
        CLEAR(TotalAmountLCY);
    end;

    procedure WriteFile(Length: Integer; Text: Text)
    begin
        IF STRLEN(Text) > Length THEN
            ERROR(Text11001, Text, STRLEN(Text), Length);
        // FileVar.WRITE(PADSTR(Text, Length));
    end;

    procedure CloseFile(EFTRegister: Record "EFT Register"; FileDescription: Text[12]; BankAccount: Record "Bank Account")
    begin
        EFTRegister.LOCKTABLE;
        EFTRegister.FIND;
        EFTRegister."Total Amount (LCY)" := TotalAmountLCY;
        EFTRegister."File Created" := TODAY;
        EFTRegister.Time := TIME;
        EFTRegister."File Description" := FileDescription;
        EFTRegister."Bank Account Code" := BankAccount."No.";
        EFTRegister.MODIFY;
        // FileVar.CLOSE;

        IF CanDownloadFile THEN BEGIN
            // IF RBMgt.DownloadHandler(ServerFileName, '', '', '', FileDescription + '.txt') THEN
            MESSAGE(Text11002, TotalAmountLCY);
        END;
    end;

    procedure CreateFileFromEFTRegister(var EFTRegister: Record "EFT Register"; FileDescription: Text[12]; var BankAcc: Record "Bank Account")
    begin
        GetSetup;
        IF EFTRegister."EFT Payment" THEN BEGIN
            EFTRegister.TESTFIELD(Canceled, FALSE);
            OpenFile;
            CreateFileEFTPayment(EFTRegister, FileDescription, BankAcc);
            CloseFile(EFTRegister, FileDescription, BankAcc);
        END;
    end;

    procedure CreateFileEFTPayment(var EFTRegister: Record "EFT Register"; FileDescription: Text[12]; var BankAccount: Record "Bank Account")
    var
        TempGenJournalLine: Record "Gen. Journal Line" temporary;
        PurchInvHeader: Record "Purch. Inv. Header";
    begin
        CarepointSetup.GET; // #11804
        PreparePaymentBuffer(EFTRegister, TempGenJournalLine);
        WITH TempGenJournalLine DO BEGIN
            IF NOT FIND('-') THEN
                EXIT;
            WriteFile(
              120, '0' + BLK(17) + '01' + TFR(FormatBankAccount(BankAccount."EFT Bank Code"), 10) +
              TFR(BankAccount."EFT Security Name", 26) + NFL(BankAccount."EFT Security No.", 6) +
              TFR(FileDescription, 12) + Date2Text(TODAY, 6) + BLK(40));
            REPEAT
                Vend.GET("Account No.");
                VendBankAcc.GET(Vend."No.", "EFT Bank Account No.");
                IF Amount > 0 THEN
                    TypeOfLine := '50'
                ELSE
                    TypeOfLine := '53';
                TotalAmountLCY += Amount - "WHT Absorb Base";
                NoOfLines += 1;
                VendBankAcc.GET(Vend."No.", "EFT Bank Account No.");

                // #11804 >>
                CASE CarepointSetup."EFT Reference Type" OF
                    CarepointSetup."EFT Reference Type"::"Vendor Inv. No.":
                        BEGIN
                            IF PurchInvHeader.GET("Applies-to Doc. No.") THEN;
                            WriteFile(
                              120, '1' + TFR(FormatBranchNumber(VendBankAcc."EFT BSB No."), 7) + TFL(VendBankAcc."Bank Account No.", 9) +
                              BLK(1) + TypeOfLine + NFL(Value100(Amount - "WHT Absorb Base", 10), 10) + TFR(Vend.Name, 32) +
                              TFR(PurchInvHeader."Vendor Invoice No.", 18) + TFR(FormatBranchNumber(BankAccount."EFT BSB No."), 7) + TFL(
                                BankAccount."Bank Account No.", 9) +
                              TFR(BankAccount."EFT Security Name", 16) + NFL(Value100("WHT Absorb Base", 8), 8));
                        END;

                    CarepointSetup."EFT Reference Type"::"NAV Posted Purch. Inv. No.":
                        BEGIN
                            WriteFile(
                              120, '1' + TFR(FormatBranchNumber(VendBankAcc."EFT BSB No."), 7) + TFL(VendBankAcc."Bank Account No.", 9) +
                              BLK(1) + TypeOfLine + NFL(Value100(Amount - "WHT Absorb Base", 10), 10) + TFR(Vend.Name, 32) +
                              TFR("Document No.", 18) + TFR(FormatBranchNumber(BankAccount."EFT BSB No."), 7) + TFL(
                              BankAccount."Bank Account No.", 9) +
                              TFR(BankAccount."EFT Security Name", 16) + NFL(Value100("WHT Absorb Base", 8), 8));
                        END;
                END;

                //    WriteFile(
                //      120,'1' + TFR(FormatBranchNumber(VendBankAcc."EFT BSB No."),7) + TFL(VendBankAcc."Bank Account No.",9) +
                //      BLK(1) + TypeOfLine + NFL(Value100(Amount - "WHT Absorb Base",10),10) + TFR(Vend.Name,32) +
                //      TFR("Document No.",18) + TFR(FormatBranchNumber(BankAccount."EFT BSB No."),7) + TFL(
                //      BankAccount."Bank Account No.",9) +
                //      TFR(BankAccount."EFT Security Name",16) + NFL(Value100("WHT Absorb Base",8),8));
                // #11804 <<
            UNTIL NEXT = 0;
            IF BankAccount."EFT Balancing Record Required" THEN
                WriteFile(
                  120, '1' + TFR(FormatBranchNumber(BankAccount."EFT BSB No."), 7) + TFL(BankAccount."Bank Account No.", 9) + BLK(1) +
                  '13' + NFL(Value100(TotalAmountLCY, 10), 10) +
                  //ReSRP #10882 Start:
                  //TFR(BankAccount."EFT Security Name",32) + TFR('',18) +
                  TFR(BankAccount."EFT Security Name", 32) + // TFR(EFTRegister."Bank Reference", 18) +
                                                             //ReSRP #10882 End:
                  TFR(FormatBranchNumber(BankAccount."EFT BSB No."), 7) + TFL(BankAccount."Bank Account No.", 9) +
                  TFR(BankAccount."EFT Security Name", 16) + NFL(Value100(0, 8), 8));
            IF BankAccount."EFT Balancing Record Required" THEN
                WriteFile(
                  120, '7' + TFR('999-999', 7) + BLK(12) + NFL(Value100(0, 10), 10) +
                  NFL(Value100(TotalAmountLCY, 10), 10) +
                  NFL(Value100(TotalAmountLCY, 10), 10) +
                  BLK(24) + NFL(Value1(NoOfLines, 6), 6) + BLK(40))
            ELSE
                WriteFile(
                  120, '7' + TFR('999-999', 7) + BLK(12) + NFL(Value100(TotalAmountLCY, 10), 10) +
                  NFL(Value100(TotalAmountLCY, 10), 10) +
                  NFL(Value100(0, 10), 10) +
                  BLK(24) + NFL(Value1(NoOfLines, 6), 6) + BLK(40))
        END;
    end;

    procedure CalcAmountToPay(VendLedgEntry: Record "Vendor Ledger Entry"): Decimal
    begin
        WITH VendLedgEntry DO BEGIN
            CALCFIELDS("Remaining Amount");
            IF ("Document Type" = "Document Type"::Invoice) AND
               ("Due Date" <= "Pmt. Discount Date")
            THEN
                EXIT("Remaining Amount" - "Remaining Pmt. Disc. Possible");
            EXIT("Remaining Amount");
        END;
    end;

    procedure CalcAmountToPayLCY(VendLedgEntry: Record "Vendor Ledger Entry"): Decimal
    begin
        WITH VendLedgEntry DO BEGIN
            IF "Adjusted Currency Factor" <> 1 THEN
                EXIT(ROUND("EFT Amount Transferred" / "Adjusted Currency Factor", GLSetup."Inv. Rounding Precision (LCY)"));
            EXIT(ROUND("EFT Amount Transferred", GLSetup."Inv. Rounding Precision (LCY)"))
        END;
    end;

    procedure FormatBranchNumber(BranchNo: Text[10]): Text[7]
    begin
        IF BranchNo = ' ' THEN
            EXIT(BLK(7));
        IF STRPOS(BranchNo, '-') <> 0 THEN
            EXIT(COPYSTR(BranchNo, 1, 7));
        EXIT(FORMAT(COPYSTR(BranchNo, 1, 3) + '-' + COPYSTR(BranchNo, 4, 3)));
    end;

    procedure FormatBankAccount(BankAcc: Code[10]): Text[3]
    begin
        IF BankAcc = ' ' THEN
            EXIT(BLK(3));
        EXIT(COPYSTR(BankAcc, 1, 3));
    end;

    procedure WithHoldingTaxAmountLCY(VendLedgEntry: Record "Vendor Ledger Entry"): Decimal
    var
        TempGenJnlLine: Record "Gen. Journal Line" temporary;
        WHTSetup: Record "WHT Posting Setup";
        WHTManagement: Codeunit "WHTManagement";
        WHTAmount: Decimal;
    begin
        TempGenJnlLine.DELETEALL;
        GLSetup.GET;
        WITH VendLedgEntry DO BEGIN
            TempGenJnlLine.INIT;
            TempGenJnlLine."Line No." += 10000;
            TempGenJnlLine.VALIDATE("Posting Date", "Posting Date");
            TempGenJnlLine.VALIDATE("Account Type", TempGenJnlLine."Account Type"::Vendor);
            TempGenJnlLine.VALIDATE("Account No.", "Vendor No.");
            TempGenJnlLine.VALIDATE("Document Type", "Document Type"::Payment);
            TempGenJnlLine.VALIDATE("Currency Code", "Currency Code");
            TempGenJnlLine.VALIDATE(Amount, "EFT Amount Transferred");
            TempGenJnlLine.VALIDATE("Applies-to Doc. Type", "Document Type");
            TempGenJnlLine.VALIDATE("Applies-to Doc. No.", "Document No.");
            TempGenJnlLine.INSERT;
        END;
        IF TempGenJnlLine."Account Type" = TempGenJnlLine."Account Type"::Vendor THEN
            IF WHTSetup.GET(TempGenJnlLine."WHT Business Posting Group", TempGenJnlLine."WHT Product Posting Group") THEN
                IF WHTSetup."Realized WHT Type" <> WHTSetup."Realized WHT Type"::Earliest THEN
                    WHTAmount := WHTAmount + WHTManagement.WHTAmountJournal(TempGenJnlLine, FALSE)
                ELSE
                    WHTAmount := WHTAmount + ABS(WHTManagement.CalcVendExtraWHTForEarliest(TempGenJnlLine));

        WHTAmount := ROUND(WHTAmount, GLSetup."Inv. Rounding Precision (LCY)");

        IF VendLedgEntry."Adjusted Currency Factor" <> 1 THEN
            EXIT(ROUND(WHTAmount / VendLedgEntry."Adjusted Currency Factor", GLSetup."Inv. Rounding Precision (LCY)"));
        EXIT(ROUND(WHTAmount, GLSetup."Inv. Rounding Precision (LCY)"));
    end;

    procedure CalcAmountToPayGJLrec(GenJournalLine: Record "Gen. Journal Line"): Decimal
    var
        VendLedgerEntry: Record "Vendor Ledger Entry";
    begin
        GenJournalLine.TESTFIELD("EFT Ledger Entry No.");
        VendLedgerEntry.GET(GenJournalLine."EFT Ledger Entry No.");
        VendLedgerEntry."Due Date" := GenJournalLine."Due Date";
        EXIT(-CalcAmountToPay(VendLedgerEntry));
    end;

    procedure GetServerFileName(): Text
    begin
        EXIT(ServerFileName);
    end;

    local procedure PreparePaymentBuffer(EFTRegister: Record "EFT Register"; var PaymentBufferGenJournalLine: Record "Gen. Journal Line")
    begin
        FillBufferFromNonPostedPayments(EFTRegister, PaymentBufferGenJournalLine);
        FillBufferFromPostedPayments(EFTRegister, PaymentBufferGenJournalLine);
    end;

    local procedure FillBufferFromNonPostedPayments(EFTRegister: Record "EFT Register"; var PaymentBufferGenJournalLine: Record "Gen. Journal Line")
    var
        GenJournalLine: Record "Gen. Journal Line";
    begin
        GenJournalLine.SETRANGE("EFT Register No.", EFTRegister."No.");
        IF GenJournalLine.FINDSET THEN
            REPEAT
                IF (GenJournalLine."Applies-to Doc. Type" = GenJournalLine."Applies-to Doc. Type"::Invoice) AND
                   (GenJournalLine."Applies-to Doc. No." <> '')
                THEN
                    FillBufferFromAppliedDoc(PaymentBufferGenJournalLine, GenJournalLine)
                ELSE
                    IF GenJournalLine."Applies-to ID" <> '' THEN
                        FillBufferFromAppliedEntries(PaymentBufferGenJournalLine, GenJournalLine)
                    ELSE
                        FillBufferFromPaymentLine(PaymentBufferGenJournalLine, GenJournalLine);
            UNTIL GenJournalLine.NEXT = 0;
    end;

    local procedure FillBufferFromPostedPayments(EFTRegister: Record "EFT Register"; var PaymentBufferGenJournalLine: Record "Gen. Journal Line")
    var
        VendorLedgerEntry: Record "Vendor Ledger Entry";
        TempVendorLedgerEntry: Record "Vendor Ledger Entry" temporary;
    begin
        VendorLedgerEntry.SETRANGE("EFT Register No.", EFTRegister."No.");
        IF VendorLedgerEntry.FINDSET THEN
            REPEAT
                FindAppliedEntries(VendorLedgerEntry, TempVendorLedgerEntry);
                IF TempVendorLedgerEntry.FINDSET THEN BEGIN
                    InitPaymentBuffer(
                      PaymentBufferGenJournalLine,
                      VendorLedgerEntry."Vendor No.",
                      VendorLedgerEntry."EFT Bank Account No.");
                    REPEAT
                        UpdatePaymentBufferAmounts(PaymentBufferGenJournalLine, TempVendorLedgerEntry);
                    UNTIL TempVendorLedgerEntry.NEXT = 0;
                    PaymentBufferGenJournalLine.INSERT;
                END;
            UNTIL VendorLedgerEntry.NEXT = 0;
    end;

    local procedure FillBufferFromAppliedDoc(var PaymentBufferGenJournalLine: Record "Gen. Journal Line"; GenJournalLine: Record "Gen. Journal Line")
    var
        VendorLedgerEntry: Record "Vendor Ledger Entry";
    begin
        VendorLedgerEntry.SETRANGE("Vendor No.", GenJournalLine."Account No.");
        VendorLedgerEntry.SETRANGE("Document No.", GenJournalLine."Applies-to Doc. No.");
        VendorLedgerEntry.FINDFIRST;
        InitPaymentBuffer(
          PaymentBufferGenJournalLine, VendorLedgerEntry."Vendor No.", GenJournalLine."EFT Bank Account No.");
        UpdatePaymentBufferAmounts(PaymentBufferGenJournalLine, VendorLedgerEntry);
        PaymentBufferGenJournalLine.INSERT;
    end;

    local procedure FillBufferFromAppliedEntries(var PaymentBufferGenJournalLine: Record "Gen. Journal Line"; GenJournalLine: Record "Gen. Journal Line")
    var
        VendorLedgerEntry: Record "Vendor Ledger Entry";
    begin
        VendorLedgerEntry.SETRANGE("Vendor No.", GenJournalLine."Account No.");
        VendorLedgerEntry.SETRANGE("Applies-to ID", GenJournalLine."Applies-to ID");
        VendorLedgerEntry.SETRANGE(Open, TRUE);
        VendorLedgerEntry.SETFILTER("Document Type", '<>%1&<>%2',
          VendorLedgerEntry."Document Type"::Payment, VendorLedgerEntry."Document Type"::Refund);
        IF VendorLedgerEntry.FINDSET THEN BEGIN
            InitPaymentBuffer(
              PaymentBufferGenJournalLine, VendorLedgerEntry."Vendor No.", GenJournalLine."EFT Bank Account No.");
            REPEAT
                UpdatePaymentBufferAmounts(PaymentBufferGenJournalLine, VendorLedgerEntry);
            UNTIL VendorLedgerEntry.NEXT = 0;
            PaymentBufferGenJournalLine.INSERT;
        END;
    end;

    local procedure FillBufferFromPaymentLine(var PaymentBufferGenJournalLine: Record "Gen. Journal Line"; GenJournalLine: Record "Gen. Journal Line")
    begin
        GLSetup.GET;
        IF GLSetup."Enable WHT" AND NOT GenJournalLine."Skip WHT" THEN
            CheckRealizedWHTType(GenJournalLine);
        InitPaymentBuffer(
          PaymentBufferGenJournalLine, GenJournalLine."Account No.", GenJournalLine."EFT Bank Account No.");
        PaymentBufferGenJournalLine.Amount := GenJournalLine.Amount;
        PaymentBufferGenJournalLine."WHT Absorb Base" := 0;
        PaymentBufferGenJournalLine.INSERT;
    end;

    local procedure CheckRealizedWHTType(GenJournalLine: Record "Gen. Journal Line")
    var
        WHTPostingSetup: Record "WHT Posting Setup";
    begin
        WITH GenJournalLine DO
            IF WHTPostingSetup.GET("WHT Business Posting Group", "WHT Product Posting Group") THEN
                IF WHTPostingSetup."Realized WHT Type" = WHTPostingSetup."Realized WHT Type"::Payment THEN
                    ERROR(
                      InvalidWHTRealizedTypeErr,
                      "Journal Template Name",
                      "Journal Batch Name",
                      "Line No.");
    end;

    local procedure FindAppliedEntries(PaymentVendorLedgerEntry: Record "Vendor Ledger Entry"; var AppliedVendorLedgerEntry: Record "Vendor Ledger Entry")
    var
        VendorLedgerEntry: Record "Vendor Ledger Entry";
        DtldVendLedgEntry1: Record "Detailed Vendor Ledg. Entry";
        DtldVendLedgEntry2: Record "Detailed Vendor Ledg. Entry";
    begin
        DtldVendLedgEntry1.SETCURRENTKEY("Vendor Ledger Entry No.");
        DtldVendLedgEntry1.SETRANGE("Vendor Ledger Entry No.", PaymentVendorLedgerEntry."Entry No.");
        DtldVendLedgEntry1.SETRANGE("Entry Type", DtldVendLedgEntry1."Entry Type"::Application);
        DtldVendLedgEntry1.SETRANGE(Unapplied, FALSE);
        IF DtldVendLedgEntry1.FINDSET THEN
            REPEAT
                IF DtldVendLedgEntry1."Vendor Ledger Entry No." =
                   DtldVendLedgEntry1."Applied Vend. Ledger Entry No."
                THEN BEGIN
                    DtldVendLedgEntry2.INIT;
                    DtldVendLedgEntry2.SETCURRENTKEY("Applied Vend. Ledger Entry No.", "Entry Type");
                    DtldVendLedgEntry2.SETRANGE(
                      "Applied Vend. Ledger Entry No.", DtldVendLedgEntry1."Applied Vend. Ledger Entry No.");
                    DtldVendLedgEntry2.SETRANGE("Entry Type", DtldVendLedgEntry2."Entry Type"::Application);
                    DtldVendLedgEntry2.SETRANGE(Unapplied, FALSE);
                    IF DtldVendLedgEntry2.FINDSET THEN
                        REPEAT
                            IF DtldVendLedgEntry2."Vendor Ledger Entry No." <>
                               DtldVendLedgEntry2."Applied Vend. Ledger Entry No."
                            THEN BEGIN
                                VendorLedgerEntry.GET(DtldVendLedgEntry2."Vendor Ledger Entry No.");
                                AddAppliedEntryToBuffer(VendorLedgerEntry, AppliedVendorLedgerEntry);
                            END;
                        UNTIL DtldVendLedgEntry2.NEXT = 0;
                END ELSE BEGIN
                    VendorLedgerEntry.GET(DtldVendLedgEntry1."Applied Vend. Ledger Entry No.");
                    AddAppliedEntryToBuffer(VendorLedgerEntry, AppliedVendorLedgerEntry);
                END;
            UNTIL DtldVendLedgEntry1.NEXT = 0;
    end;

    local procedure AddAppliedEntryToBuffer(VendorLedgerEntry: Record "Vendor Ledger Entry"; var ApliedVendorLedgerEntry: Record "Vendor Ledger Entry")
    begin
        IF NOT ApliedVendorLedgerEntry.GET(VendorLedgerEntry."Entry No.") THEN BEGIN
            ApliedVendorLedgerEntry := VendorLedgerEntry;
            ApliedVendorLedgerEntry.INSERT;
        END;
    end;

    local procedure UpdatePaymentBufferAmounts(var PaymentBufferGenJournalLine: Record "Gen. Journal Line"; VendorLedgerEntry: Record "Vendor Ledger Entry")
    begin
        VendorLedgerEntry."EFT Amount Transferred" :=
          -(VendorLedgerEntry."Amount to Apply" - VendorLedgerEntry."Max. Payment Tolerance");
        PaymentBufferGenJournalLine.Amount += VendorLedgerEntry."EFT Amount Transferred";
        PaymentBufferGenJournalLine."WHT Absorb Base" += WithHoldingTaxAmountLCY(VendorLedgerEntry);
    end;

    local procedure InitPaymentBuffer(var PaymentBufferGenJournalLine: Record "Gen. Journal Line"; VendorNo: Code[20]; EFTBankAccountNo: Code[20])
    begin
        PaymentBufferGenJournalLine.INIT;
        PaymentBufferGenJournalLine."Line No." += 10000;
        PaymentBufferGenJournalLine."Account No." := VendorNo;
        PaymentBufferGenJournalLine."EFT Bank Account No." := EFTBankAccountNo;
    end;

    local procedure CanDownloadFile(): Boolean
    var
        DoNotDownloadFile: Boolean;
    begin
        OnBeforeDownloadFile(DoNotDownloadFile);
        EXIT(NOT DoNotDownloadFile);
    end;

    procedure CancelExport(var EFTRegister: Record "EFT Register")
    var
        GenJournalLine: Record "Gen. Journal Line";
    begin
        IF NOT CONFIRM(ConfirmCancelExportQst) THEN
            EXIT;

        EFTRegister.Canceled := TRUE;
        EFTRegister.MODIFY(TRUE);

        GenJournalLine.SETRANGE("EFT Register No.", EFTRegister."No.");
        GenJournalLine.MODIFYALL("EFT Register No.", 0);

        MESSAGE(EFTRegisterExportCanceledMsg, EFTRegister."No.");
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeDownloadFile(var DoNotDownloadFile: Boolean)
    begin
    end;
}

*/