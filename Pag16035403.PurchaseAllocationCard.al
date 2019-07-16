page 16035403 "Purchase Allocation Card"
{
    // version CAREPOINT1.00

    // CA2.00
    // - Page used for Fixed % Allocations

    Caption = 'Purch. Allocation Code Card';
    PageType = ListPlus;
    SourceTable = "Standard Purchase Code";
    SourceTableView = WHERE ("Allocation Template" = FILTER (true));
    UsageCategory = Lists;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(Code; Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field("Currency Code"; "Currency Code")
                {
                    ApplicationArea = All;
                }
                field("Allocation Template"; "Allocation Template")
                {
                    ApplicationArea = All;
                }
            }
            part(PurchAllocation; 16035402)
            {
                SubPageLink = "Purch. Allocation Code" = FIELD (Code);
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Allocation Template" := TRUE;
    end;
}

