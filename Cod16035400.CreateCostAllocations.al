codeunit 16035400 "Create Cost Allocations"
{
    // version CAREPOINT1.00

    // CAREPOINT1.00 02/06/14 RK : Codeunit called from recurring jnl, to create cost allocations
    // HBSTG 2015-10-02: Added more allocation methods

    TableNo = 81;

    trigger OnRun()
    begin
        IF NOT CONFIRM(Text50000, TRUE) THEN
            EXIT;

        DocNo := '';
        GenJnlBatch.RESET;
        GenJnlBatch.SETRANGE("Journal Template Name", "Journal Template Name");
        GenJnlBatch.SETRANGE(Name, "Journal Batch Name");
        IF GenJnlBatch.FINDFIRST THEN
            IF GenJnlBatch."Posting No. Series" = '' THEN
                ERROR(Text50003, GenJnlBatch."Journal Template Name", GenJnlBatch.Name);

        IF GenJnlBatch."Cost Allocation Type" = GenJnlBatch."Cost Allocation Type"::" " THEN
            ERROR(Text50006, GenJnlBatch."Journal Template Name", GenJnlBatch.Name);

        //Test if current Budget has been defined
        GLSetup.GET;
        IF GLSetup."Current Budget" = '' THEN
            ERROR(Text50004);

        IF GenJnlBatch."Cost Allocation Type" = GenJnlBatch."Cost Allocation Type"::"Service % Based" THEN BEGIN
            GLSetup.TESTFIELD("Program Dimension");
            GLSetup.TESTFIELD("Cost Allocation Expense Acc");
            //Check if income accounts have been defined
            CostALLIncomeRec.RESET;
            CostALLIncomeRec.SETRANGE(Type, CostALLIncomeRec.Type::"Cost Allocation Income Account");
            IF NOT CostALLIncomeRec.FINDFIRST THEN
                ERROR(Text50005);
        END ELSE
            IF GenJnlBatch."Cost Allocation Type" IN [GenJnlBatch."Cost Allocation Type"::"Drivers Based", GenJnlBatch."Cost Allocation Type"::"Drivers Based 2 (Different Charge Acc)"] THEN BEGIN
                //Update Budget Income driver values
                UpdateIncomeDriver(CALCDATE('<-CM>', "Posting Date"), CALCDATE('<+CM>', "Posting Date"));
            END;

        //first empty out the allocations table
        GenJnlAlloc.RESET;
        GenJnlAlloc.SETRANGE("Journal Template Name", "Journal Template Name");
        GenJnlAlloc.SETRANGE("Journal Batch Name", "Journal Batch Name");
        IF GenJnlAlloc.FINDFIRST THEN REPEAT
                                          GenJnlAlloc.DELETE;
            UNTIL GenJnlAlloc.NEXT = 0;

        //now build the table again
        GenJnlLine.RESET;
        GenJnlLine.SETRANGE("Journal Template Name", "Journal Template Name");
        GenJnlLine.SETRANGE("Journal Batch Name", "Journal Batch Name");
        IF GenJnlLine.FINDFIRST THEN REPEAT
                                         GenJnlLine.VALIDATE(Amount, 0);
                                         GenJnlLine."Cost Allocation Line" := TRUE;
                                         GenJnlLine.MODIFY;

                                         //calculate dates
                                         EndDate := CALCDATE('CM', GenJnlLine."Posting Date");
                                         BeginDate := CALCDATE('<-CM>', GenJnlLine."Posting Date");

                                         IF GenJnlBatch."Cost Allocation Type" = GenJnlBatch."Cost Allocation Type"::"Service % Based" THEN BEGIN
                                             //Go through programs for %
                                             IncomeTotal := 0;
                                             AllocAmount := 0;
                                             ProgramPerc.RESET;
                                             //ProgramPerc.SETRANGE(ProgramPerc."Dimension Code",'PROGRAM');
                                             ProgramPerc.SETRANGE(ProgramPerc."Dimension Code", GLSetup."Program Dimension");
                                             ProgramPerc.SETRANGE(ProgramPerc.Blocked, FALSE);
                                             ProgramPerc.SETFILTER("Service Percentage", '<>%1', 0);
                                             IF ProgramPerc.FINDFIRST THEN REPEAT
                                                                               //now check for income in that program
                                                                               CostALLIncomeRec.RESET;
                                                                               CostALLIncomeRec.SETRANGE(Type, CostALLIncomeRec.Type::"Cost Allocation Income Account");
                                                                               IncomeForProgram := 0;
                                                                               IF CostALLIncomeRec.FINDFIRST THEN REPEAT
                                                                                                                      GLBudgetEntry.RESET;
                                                                                                                      GLBudgetEntry.SETRANGE("Budget Name", GLSetup."Current Budget");
                                                                                                                      GLBudgetEntry.SETRANGE("G/L Account No.", CostALLIncomeRec."No.");
                                                                                                                      GLBudgetEntry.SETRANGE(Date, BeginDate, EndDate);
                                                                                                                      GLBudgetEntry.SETRANGE("Global Dimension 1 Code", ProgramPerc.Code);
                                                                                                                      IF GLBudgetEntry.FINDFIRST THEN REPEAT
                                                                                                                                                          IncomeForProgram := IncomeForProgram + GLBudgetEntry.Amount;
                                                                                                                                                          IncomeTotal := IncomeTotal + GLBudgetEntry.Amount;
                                                                                                                          UNTIL GLBudgetEntry.NEXT = 0;
                                                                                   UNTIL CostALLIncomeRec.NEXT = 0;
                                                                               //now insert allocation line
                                                                               IF IncomeForProgram <> 0 THEN BEGIN
                                                                                   GenJnlAlloc.RESET;
                                                                                   GenJnlAlloc.SETRANGE("Journal Template Name", "Journal Template Name");
                                                                                   GenJnlAlloc.SETRANGE("Journal Batch Name", "Journal Batch Name");
                                                                                   GenJnlAlloc.SETRANGE("Journal Line No.", "Line No.");
                                                                                   IF GenJnlAlloc.FINDLAST THEN
                                                                                       LineNo := GenJnlAlloc."Line No." + 10000
                                                                                   ELSE
                                                                                       LineNo := 10000;
                                                                                   GenJnlAlloc.RESET;
                                                                                   GenJnlAlloc.INIT;
                                                                                   GenJnlAlloc.VALIDATE("Journal Template Name", "Journal Template Name");
                                                                                   GenJnlAlloc.VALIDATE("Journal Batch Name", "Journal Batch Name");
                                                                                   GenJnlAlloc.VALIDATE("Journal Line No.", GenJnlLine."Line No.");
                                                                                   GenJnlAlloc.VALIDATE("Line No.", LineNo);
                                                                                   GenJnlAlloc.VALIDATE("Account No.", GLSetup."Cost Allocation Expense Acc");
                                                                                   GenJnlAlloc.INSERT;
                                                                                   GenJnlAlloc.VALIDATE("Shortcut Dimension 1 Code", ProgramPerc.Code);
                                                                                   GenJnlAlloc.VALIDATE("Shortcut Dimension 2 Code", "Shortcut Dimension 2 Code");
                                                                                   GenJnlAlloc.VALIDATE(Amount, -(ProgramPerc."Service Percentage") / 100 * IncomeForProgram);
                                                                                   AllocAmount := AllocAmount + GenJnlAlloc.Amount;
                                                                                   GenJnlAlloc.VALIDATE("Gen. Posting Type", GenJnlAlloc."Gen. Posting Type"::" ");
                                                                                   GenJnlAlloc.VALIDATE("Gen. Bus. Posting Group", '');
                                                                                   GenJnlAlloc.VALIDATE("Gen. Prod. Posting Group", '');
                                                                                   GenJnlAlloc.VALIDATE("VAT Bus. Posting Group", '');
                                                                                   GenJnlAlloc.VALIDATE("VAT Prod. Posting Group", '');
                                                                                   GenJnlAlloc.MODIFY;
                                                                               END;
                                                 UNTIL ProgramPerc.NEXT = 0;

                                             //Go through programs for amount - not pecentage
                                             //Code commented for GML
                                             /*
                                             ProgramAmount.RESET;
                                             ProgramAmount.SETRANGE("Dimension Code",'PROGRAM');
                                             ProgramAmount.SETRANGE("Dimension Code",GLSetup."Program Dimension");
                                             ProgramAmount.SETRANGE(Blocked,FALSE);
                                             ProgramAmount.SETFILTER(ProgramAmount."Service Amount (Annualised)",'<>%1',0);
                                             IF ProgramAmount.FINDFIRST THEN REPEAT
                                               IF ((ProgramAmount."Service Amount Starting Date" = 0D) OR
                                                   (ProgramAmount."Service Amount Starting Date" < GenJnlLine."Posting Date")) THEN
                                                 IF ((ProgramAmount."Service Amount Ending Date" = 0D) OR
                                                     (ProgramAmount."Service Amount Ending Date" >= GenJnlLine."Posting Date")) THEN BEGIN
                                                   //now insert allocation line
                                                   GenJnlAlloc.RESET;
                                                   GenJnlAlloc.SETRANGE("Journal Template Name","Journal Template Name");
                                                   GenJnlAlloc.SETRANGE("Journal Batch Name","Journal Batch Name");
                                                   GenJnlAlloc.SETRANGE("Journal Line No.","Line No.");
                                                   IF GenJnlAlloc.FINDLAST THEN
                                                     LineNo := GenJnlAlloc."Line No." + 10000
                                                   ELSE
                                                     LineNo := 10000;
                                                   //IncomeTotal := IncomeTotal - ProgramAmount."Service Amount (Annualised)"/12;
                                                   GenJnlAlloc.RESET;
                                                   GenJnlAlloc.INIT;
                                                   GenJnlAlloc.VALIDATE("Journal Template Name","Journal Template Name");
                                                   GenJnlAlloc.VALIDATE("Journal Batch Name","Journal Batch Name");
                                                   GenJnlAlloc.VALIDATE("Journal Line No.",GenJnlLine."Line No.");
                                                   GenJnlAlloc.VALIDATE("Line No.",LineNo);
                                                   GenJnlAlloc.VALIDATE("Account No.",GLSetup."Cost Allocation Expense Acc");
                                                   GenJnlAlloc.INSERT;
                                                   GenJnlAlloc.VALIDATE("Shortcut Dimension 1 Code",ProgramAmount.Code);
                                                   GenJnlAlloc.VALIDATE("Shortcut Dimension 2 Code","Shortcut Dimension 2 Code");
                                                   GenJnlAlloc.VALIDATE(Amount,ProgramAmount."Service Amount (Annualised)"/12);
                                                   AllocAmount := AllocAmount + GenJnlAlloc.Amount;
                                                   GenJnlAlloc.VALIDATE("Gen. Posting Type",GenJnlAlloc."Gen. Posting Type"::" ");
                                                   GenJnlAlloc.VALIDATE("Gen. Bus. Posting Group",'');
                                                   GenJnlAlloc.VALIDATE("Gen. Prod. Posting Group",'');
                                                   GenJnlAlloc.VALIDATE("VAT Bus. Posting Group",'');
                                                   GenJnlAlloc.VALIDATE("VAT Prod. Posting Group",'');
                                                   GenJnlAlloc.MODIFY;
                                               END;
                                             UNTIL ProgramAmount.NEXT = 0;
                                             */
                                             //Code commented for GML
                                             GenJnlLine.VALIDATE(Amount, -AllocAmount);

                                         END ELSE
                                             IF GenJnlBatch."Cost Allocation Type" IN [GenJnlBatch."Cost Allocation Type"::"Drivers Based", GenJnlBatch."Cost Allocation Type"::"Drivers Based 2 (Different Charge Acc)"] THEN BEGIN
                                                 //HBSTG 2015-10-02 >>
                                                 //Create Allocation Lines based on respective Driver values
                                                 DimVal.GET(GLSetup."Program Dimension", GenJnlLine."Shortcut Dimension 1 Code");
                                                 IF DimVal."Driver Allocation Code" = '' THEN
                                                     ERROR(Text50007, DimVal."Dimension Code", DimVal.Code);
                                                 StdPurchCode.RESET;
                                                 StdPurchCode.GET(DimVal."Driver Allocation Code");
                                                 PurchAllocLines.RESET;
                                                 PurchAllocLines.SETRANGE("Purch. Allocation Code", StdPurchCode.Code);
                                                 PurchAllocLines.SETRANGE(Period, BeginDate, EndDate);          //Monthly Drivers Filter
                                                 IF PurchAllocLines.ISEMPTY THEN
                                                     ERROR(Text50008, DimVal."Driver Allocation Code", GenJnlLine."Shortcut Dimension 1 Code");
                                                 IF PurchAllocLines.FINDSET THEN BEGIN
                                                     //Update Cost to be allocated on Journal Line
                                                     GLEntry.RESET;
                                                     GLEntry.SETCURRENTKEY("G/L Account No.", "Global Dimension 1 Code", "Global Dimension 2 Code", "Posting Date");
                                                     IF GenJnlBatch."Cost Allocation Type" = GenJnlBatch."Cost Allocation Type"::"Drivers Based" THEN
                                                         GLEntry.SETRANGE("G/L Account No.", GenJnlLine."Account No.")
                                                     ELSE
                                                         GLEntry.SETFILTER("G/L Account No.", DimVal."Expense Account Filter");
                                                     GLEntry.SETRANGE("Global Dimension 1 Code", GenJnlLine."Shortcut Dimension 1 Code");
                                                     GLEntry.SETFILTER("Posting Date", '%1..%2', BeginDate, EndDate);
                                                     GLEntry.CALCSUMS(Amount);
                                                     GenJnlLine.VALIDATE(Amount, -GLEntry.Amount);
                                                     GenJnlLine.MODIFY(TRUE);
                                                     REPEAT
                                                         //Insert Gen. Jnl. Allocations line
                                                         GenJnlAlloc.RESET;
                                                         GenJnlAlloc.SETRANGE("Journal Template Name", GenJnlLine."Journal Template Name");
                                                         GenJnlAlloc.SETRANGE("Journal Batch Name", GenJnlLine."Journal Batch Name");
                                                         GenJnlAlloc.SETRANGE("Journal Line No.", GenJnlLine."Line No.");
                                                         IF GenJnlAlloc.FINDLAST THEN
                                                             LineNo := GenJnlAlloc."Line No." + 10000
                                                         ELSE
                                                             LineNo := 10000;

                                                         IF (PurchAllocLines."Allocation Quantity" <> 0) OR (PurchAllocLines."Allocation Percentage" <> 0) THEN BEGIN
                                                             GenJnlAlloc.RESET;
                                                             GenJnlAlloc.INIT;
                                                             GenJnlAlloc.VALIDATE("Journal Template Name", GenJnlLine."Journal Template Name");
                                                             GenJnlAlloc.VALIDATE("Journal Batch Name", GenJnlLine."Journal Batch Name");
                                                             GenJnlAlloc.VALIDATE("Journal Line No.", GenJnlLine."Line No.");
                                                             GenJnlAlloc.VALIDATE("Line No.", LineNo);
                                                             GenJnlAlloc.INSERT(TRUE);
                                                             IF GenJnlBatch."Cost Allocation Type" = GenJnlBatch."Cost Allocation Type"::"Drivers Based" THEN
                                                                 GenJnlAlloc.VALIDATE("Account No.", GenJnlLine."Account No.")
                                                             ELSE
                                                                 GenJnlAlloc.VALIDATE("Account No.", DimVal."Charge Out Account");
                                                             GenJnlAlloc.VALIDATE("Shortcut Dimension 1 Code", PurchAllocLines."Global Dimension 1 Code");
                                                             GenJnlAlloc.VALIDATE("Shortcut Dimension 2 Code", PurchAllocLines."Global Dimension 2 Code");
                                                             IF PurchAllocLines."Allocation Quantity" <> 0 THEN
                                                                 GenJnlAlloc.VALIDATE("Allocation Quantity", PurchAllocLines."Allocation Quantity")
                                                             ELSE
                                                                 GenJnlAlloc.VALIDATE("Allocation %", PurchAllocLines."Allocation Percentage");
                                                             GenJnlAlloc.VALIDATE("Gen. Posting Type", GenJnlAlloc."Gen. Posting Type"::" ");
                                                             GenJnlAlloc.VALIDATE("Gen. Bus. Posting Group", '');
                                                             GenJnlAlloc.VALIDATE("Gen. Prod. Posting Group", '');
                                                             GenJnlAlloc.VALIDATE("VAT Bus. Posting Group", '');
                                                             GenJnlAlloc.VALIDATE("VAT Prod. Posting Group", '');
                                                             GenJnlAlloc.MODIFY;
                                                         END;
                                                     UNTIL PurchAllocLines.NEXT = 0;
                                                 END;
                                                 //HBSTG 2015-10-02  <<
                                             END;
                                         IF DocNo = '' THEN BEGIN
                                             DocNo := NoSeries.GetNextNo(GenJnlBatch."Posting No. Series", TODAY, TRUE);
                                         END;
                                         GenJnlLine.VALIDATE("Document No.", DocNo);
                                         GenJnlLine.MODIFY;
            UNTIL GenJnlLine.NEXT = 0;
        MESSAGE(Text50001);

    end;

    var
        GenJnlLine: Record "Gen. Journal Line";
        Text50000: Label 'This function will create the monthly indirect cost allocation journal. Do you want to continue?';
        DimVal: Record "Dimension Value";
        GenJnlAlloc: Record "Gen. Jnl. Allocation";
        LineNo: Integer;
        SumPercentage: Decimal;
        GLEntry: Record "G/L Entry";
        EndDate: Date;
        BeginDay: Integer;
        BeginMonth: Integer;
        BeginDate: Date;
        BeginYear: Integer;
        AllocAmount: Decimal;
        Text50001: Label 'The cost allocation lines have been created. Please check and post the journal.';
        Text50002: Label 'The allocation percentages do not add up to 100%, but to %1. Please change the cost centre setup and run the function again.';
        DocNo: Code[20];
        NoSeries: Codeunit "NoSeriesManagement";
        GenJnlBatch: Record "Gen. Journal Batch";
        Text50003: Label 'Please set a number series in Template %1, Batch %2.';
        GLSetup: Record "General Ledger Setup";
        Text50004: Label 'Please set the current budget in General Ledger Setup';
        CostALLIncomeRec: Record "Cost Allocation Income Acc.";
        Text50005: Label 'Please set income accounts via General Ledger Setup - Cost Allocation Income Accounts Setup.';
        ProgramPerc: Record "Dimension Value";
        ProgramAmount: Record "Dimension Value";
        GLBudgetEntry: Record "G/L Budget Entry";
        IncomeForProgram: Decimal;
        IncomeTotal: Decimal;
        Text50006: Label 'Please set a Cost Allocation Type in Template %1, Batch %2.';
        StdPurchCode: Record "Standard Purchase Code";
        PurchAllocLines: Record "Purchase Allocation Lines";
        Text50007: Label 'Driver Allocation Code cannot be blank in %1 %2.';
        Text50008: Label 'No Allocation Lines found for Driver %1 for allocating cost of Program %2.';

    procedure UpdateIncomeDriver(pStartdate: Date; pEnddate: Date)
    begin
        //HBSTG 2015-10-02
        PurchAllocLines.RESET;
        PurchAllocLines.SETRANGE("Purch. Allocation Code", GLSetup."Income Driver Code");
        PurchAllocLines.SETRANGE(Period, pStartdate, pEnddate);
        IF PurchAllocLines.FINDSET THEN
            PurchAllocLines.DELETEALL;

        DimVal.RESET;
        DimVal.SETRANGE(DimVal."Dimension Code", GLSetup."Program Dimension");
        DimVal.SETRANGE("Driver Allocable", TRUE);
        IF DimVal.FINDSET AND (GLSetup."Income Driver Code" <> '') THEN BEGIN
            REPEAT
                GLBudgetEntry.RESET;
                GLBudgetEntry.SETCURRENTKEY("Budget Name", "G/L Account No.", Date, "Global Dimension 1 Code",
                                                "Global Dimension 2 Code", "Budget Dimension 1 Code");
                GLBudgetEntry.SETRANGE("Budget Name", GLSetup."Current Budget");
                GLBudgetEntry.SETFILTER("G/L Account No.", GLSetup."Income Account Filter");
                GLBudgetEntry.SETRANGE(Date, pStartdate, pEnddate);
                GLBudgetEntry.SETRANGE("Global Dimension 1 Code", DimVal.Code);
                GLBudgetEntry.CALCSUMS(Amount);
                IF GLBudgetEntry.Amount <> 0 THEN BEGIN
                    PurchAllocLines.RESET;
                    PurchAllocLines.INIT;
                    PurchAllocLines."Purch. Allocation Code" := GLSetup."Income Driver Code";
                    PurchAllocLines.Period := pStartdate;
                    PurchAllocLines."Global Dimension 1 Code" := DimVal.Code;
                    PurchAllocLines.Description := DimVal.Name;
                    PurchAllocLines."Allocation Quantity" := GLBudgetEntry.Amount;
                    PurchAllocLines.INSERT(TRUE);
                END;
            UNTIL DimVal.NEXT = 0;
        END;
    end;
}

