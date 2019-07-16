page 16035408 "Change Amount"
{
    // version CAREPOINT1.00

    // HBSTG PA1.02 2015-09-19: Created new page for changing Direct Unit Cost on Purchase Lines

    DataCaptionFields = "No.", Description;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = ConfirmationDialog;
    SourceTable = "Purchase Line";
    UsageCategory = Tasks;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            field("No."; "No.")
            {
                ApplicationArea = All;
            }
            field(Description; Description)
            {
                ApplicationArea = All;
            }
            field(Quantity; Quantity)
            {
                ApplicationArea = All;
            }
            field("Direct Unit Cost"; "Direct Unit Cost")
            {
                ApplicationArea = All;
            }
            field("Line Amount"; "Line Amount")
            {
                ApplicationArea = All;
            }
            field("New Direct Unit Cost"; NewDirectUnitCost)
            {
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    NewLineAmount := ROUND(Quantity * NewDirectUnitCost, 0.01);
                end;
            }
            field("New Line Amount"; NewLineAmount)
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }

    actions
    {
    }

    var
        GLAcc: Record "G/L Account";
        NewDirectUnitCost: Decimal;
        NewLineAmount: Decimal;

    procedure GetNewDirectUnitCost(var pNewDirectUnitCost: Decimal)
    begin
        pNewDirectUnitCost := NewDirectUnitCost;
    end;
}

