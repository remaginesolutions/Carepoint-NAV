page 16035411 "Purch. Ord. Milestone Lines"
{
    // version CAREPOINT1.00

    AutoSplitKey = true;
    Caption = 'Purch. Ord. Milestone Lines';
    DataCaptionFields = "Document Type", "No.";
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = List;
    SourceTable = "Purch. Ord. Milestone Line";
    UsageCategory = Lists;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater("carepoint_repeater_1")
            {
                field("Document Line No."; "Document Line No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Line No."; "Line No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field("Due Date"; "Due Date")
                {
                    ApplicationArea = All;
                }
                field("Actual Due Date"; "Actual Due Date")
                {
                    ApplicationArea = All;
                }
                field(Completed; Completed)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnClosePage()
    begin
        PurchSetup.GET;
        IF PurchSetup."Enable Milestones" THEN
            IF CallFlagFromPurchOrder THEN
                SendApproval();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        SetUpNewLine;
    end;

    var
        CallFlagFromPurchOrder: Boolean;
        PurchSetup: Record "Purchases & Payables Setup";

    procedure SetFlagFromPurchOrder()
    begin
        CallFlagFromPurchOrder := TRUE;
    end;
}

