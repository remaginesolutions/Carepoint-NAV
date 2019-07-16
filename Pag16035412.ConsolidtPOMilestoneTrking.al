page 16035412 "Consolidt. PO Milestone Trking"
{
    // version CAREPOINT1.00

    AutoSplitKey = true;
    Caption = 'Consolidated PO Milestone Tracking Lines';
    DataCaptionFields = "Document Type", "No.";
    DelayedInsert = true;
    Editable = false;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = List;
    SourceTable = "Purch. Ord. Milestone Line";
    SourceTableView = SORTING ("Document Type", "No.", "Document Line No.", "Line No.")
                      ORDER(Ascending)
                      WHERE ("Document Type" = FILTER (Order));
    UsageCategory = Lists;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater("carepoint_repeater_1")
            {
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = All;
                }
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field("Document Line No."; "Document Line No.")
                {
                    ApplicationArea = All;
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

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        SetUpNewLine;
    end;
}

