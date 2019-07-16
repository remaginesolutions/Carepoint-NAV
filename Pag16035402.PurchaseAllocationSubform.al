page 16035402 "Purchase Allocation Subform"
{
    // version CAREPOINT1.00

    // CA2.00 - Fields added for Fixed % Allocation

    AutoSplitKey = false;
    Caption = 'Purch. Allocation Lines';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Purchase Allocation Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Period; Period)
                {
                    ApplicationArea = All;
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field("Allocation Quantity"; "Allocation Quantity")
                {
                    ApplicationArea = All;
                }
                field("Allocation Percentage"; "Allocation Percentage")
                {
                    ApplicationArea = All;
                }
                field("Purch. Allocation Code"; "Purch. Allocation Code")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

