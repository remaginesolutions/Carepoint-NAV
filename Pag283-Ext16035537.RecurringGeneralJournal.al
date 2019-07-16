pageextension 16035537 pageextension16035537 extends "Recurring General Journal"
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    actions
    {
        addafter("F&unctions")
        {
            action("Create Cost Allocations")
            {
                Image = Allocate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    // CAREPOINT1.00 >>
                    CLEAR(CreateCostAllocations);
                    CreateCostAllocations.RUN(Rec);
                    // CAREPOINT1.00 <<
                end;
            }
            action("Insert Recurring Jnl Lines")
            {
                Image = InsertAccount;
                Promoted = true;
                PromotedCategory = New;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    // CAREPOINT1.00 >>
                    CLEAR(InsertRecurringJnlLine);
                    InsertRecurringJnlLine.SetJGnlJnlLine(Rec);
                    InsertRecurringJnlLine.RUN
                    // CAREPOINT1.00 <<
                end;
            }
        }
    }

    var
        CreateCostAllocations: Codeunit "Create Cost Allocations";
        PostingDate: Date;
        PostingDateVisible: Boolean;
        GenJnlBatches: Record "Gen. Journal Batch";
        InsertRecurringJnlLine: Report "Insert Recurring Jnl Line";
}

