tableextension 16035566 tableextension16035566 extends "Purchase Line"
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    // HBSTG CAREPOINT1.00 2015-09-19: Added funtion to change GL Code and Direct Unit Cost
    // HBSVK CAREPOINT1.00 2016-05-30: Field "No." filter changed to only display G/L Accounts with "Purchasing Filter" = Yes (ticket #10029)
    // HBSSA 2017-11-06: Added a code to populate VAT Amount #10864
    // ReSRP Ticket #10854 2017-11-01: Code and functions added for Milestone lines
    fields
    {

        //Unsupported feature: Property Modification (TableRelation) on ""No."(Field 6)".

        field(50000; "VAT Amount"; Decimal)
        {
            Caption = 'VAT Amount';
            Description = '#10864';
        }
        field(16035400; "Reallocated Line"; Boolean)
        {
            Description = 'CAREPOINT1.00';
        }
    }

    procedure ChangeGLAcc()
    var
        PurchLine2: Record "Purchase Line";
        pgChangeGLAccount: Page "Change G/L Account";
        DirectUnitCost: Decimal;
        NewGLAccCode: Code[20];
        DimSetID: Integer;
    begin
        // HBS TG CAREPOINT1.00 2015-09-19 >>
        IF (Type = Type::"G/L Account") AND ("No." <> '') THEN BEGIN
            PurchLine2.RESET;
            PurchLine2.SETRANGE("Document Type", "Document Type");
            PurchLine2.SETRANGE("Document No.", "Document No.");
            PurchLine2.SETRANGE("Line No.", "Line No.");
            PurchLine2.FINDFIRST;
            CLEAR(pgChangeGLAccount);
            // CLEAR(AllowLineChange);
            pgChangeGLAccount.SETTABLEVIEW(PurchLine2);
            IF pgChangeGLAccount.RUNMODAL = ACTION::Yes THEN BEGIN
                pgChangeGLAccount.GetNewGLAcc(NewGLAccCode);
                IF (NewGLAccCode <> '') AND (NewGLAccCode <> "No.") THEN BEGIN
                    // AllowLineChange := TRUE;
                    SuspendStatusCheck(TRUE);
                    DirectUnitCost := "Direct Unit Cost";
                    DimSetID := "Dimension Set ID";
                    VALIDATE("No.", NewGLAccCode);
                    VALIDATE("Direct Unit Cost", DirectUnitCost);
                    VALIDATE("Dimension Set ID", DimSetID);
                    SuspendStatusCheck(FALSE);
                END;
            END;
        END;
        // HBS TG CAREPOINT1.00 <<
    end;

    procedure ChangeDirectUnitCost()
    var
        ApprovalEntry: Record "Approval Entry";
        GLSetup: Record "General Ledger Setup";
        PurchLine2: Record "Purchase Line";
        pgChangeAmount: Page "Change Amount";
        NewDirectUnitCost: Decimal;
        Text0001: Label 'The variance of %1 in Direct Unit Cost is more than allowed tolerance limit of %2 (%3/% of Direct Unit Cost).';
        TotalLineAmt: Decimal;
        Text0002: Label 'Amount change not allowed because the Total Invoice Amount %1 cannot be more than Approver''s Limit %2. ';
    begin
        // HBS TG CAREPOINT1.00 2015-09-19
        GLSetup.GET();
        GLSetup.TESTFIELD("Invoice Tolerance %");
        IF (Type = Type::"G/L Account") AND ("No." <> '') THEN BEGIN
            PurchLine2.RESET;
            PurchLine2.SETRANGE("Document Type", "Document Type");
            PurchLine2.SETRANGE("Document No.", "Document No.");
            PurchLine2.SETRANGE("Line No.", "Line No.");
            PurchLine2.FINDFIRST;
            CLEAR(pgChangeAmount);
            // CLEAR(AllowLineChange);
            pgChangeAmount.SETTABLEVIEW(PurchLine2);
            IF pgChangeAmount.RUNMODAL = ACTION::Yes THEN BEGIN
                pgChangeAmount.GetNewDirectUnitCost(NewDirectUnitCost);
                IF NewDirectUnitCost <> "Direct Unit Cost" THEN BEGIN
                    IF ABS(NewDirectUnitCost - "Direct Unit Cost") > ABS(ROUND("Direct Unit Cost" * GLSetup."Invoice Tolerance %" / 100, 0.01)) THEN
                        ERROR(Text0001, ABS(NewDirectUnitCost - "Direct Unit Cost"), ABS(ROUND("Direct Unit Cost" * GLSetup."Invoice Tolerance %" / 100, 0.01)), GLSetup."Invoice Tolerance %");
                    SuspendStatusCheck(TRUE);
                    VALIDATE("Direct Unit Cost", NewDirectUnitCost);
                    TotalLineAmt := "Line Amount";
                    PurchLine2.SETFILTER("Line No.", '<>%1', "Line No.");
                    IF NOT PurchLine2.ISEMPTY THEN BEGIN
                        PurchLine2.CALCSUMS("Line Amount");
                        TotalLineAmt += PurchLine2."Line Amount";
                    END;
                    ApprovalEntry.RESET;
                    ApprovalEntry.SETRANGE("Table ID", 38);
                    ApprovalEntry.SETRANGE("Document Type", "Document Type");
                    ApprovalEntry.SETRANGE("Document No.", "Document No.");
                    IF ApprovalEntry.FINDLAST THEN
                        IF TotalLineAmt > ApprovalEntry."Approval Level Amount Limit" THEN
                            ERROR(Text0002, TotalLineAmt, ApprovalEntry."Approval Level Amount Limit");
                END;
            END;
            SuspendStatusCheck(FALSE);
        END;
        // CAREPOINT1.00 <<
    end;

    procedure ShowMilestoneLines()
    var
        PurchOrdMilestoneLine: Record "Purch. Ord. Milestone Line";
        PurchOrdMilestoneLines: Page "Purch. Ord. Milestone Lines";
        PurchSetup: Record "Purchases & Payables Setup";
    begin
        TESTFIELD("Document No.");
        TESTFIELD("Line No.");
        PurchSetup.GET;
        PurchSetup.TESTFIELD("Enable Milestones", TRUE);
        PurchOrdMilestoneLine.SETRANGE("Document Type", "Document Type");
        PurchOrdMilestoneLine.SETRANGE("No.", "Document No.");
        PurchOrdMilestoneLine.SETRANGE("Document Line No.", "Line No.");
        PurchOrdMilestoneLines.SetFlagFromPurchOrder();
        PurchOrdMilestoneLines.SETTABLEVIEW(PurchOrdMilestoneLine);
        PurchOrdMilestoneLines.RUNMODAL;
    end;
}

