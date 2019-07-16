pageextension 16035551 pageextension16035551 extends "General Journal"
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    actions
    {
        addafter(DeferralSchedule)
        {
            action(ImportGenJnl)
            {
                ApplicationArea = All;
                Caption = 'Import General Journal';
                Image = Import;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    GeneralLedgerSetup: Record "General Ledger Setup";
                    ImportPayrollTransaction: Codeunit "Import Payroll Transaction";
                begin
                    // #10738 >>
                    GeneralLedgerSetup.GET;
                    GeneralLedgerSetup.TESTFIELD("Journal Import Format");
                    IF FINDLAST THEN;
                    // ImportPayrollTransaction.SelectAndImportPayrollDataToGL(Rec,GeneralLedgerSetup."Journal Import Format");
                    // #10738 <<
                end;
            }
        }
    }
}

