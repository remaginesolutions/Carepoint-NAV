page 16035404 "Purchase Allocation Codes"
{
    // version CAREPOINT1.00

    // HBSTG CA2.00 2013-05-06:
    // - Added Fields for Cost Allocation Functionality

    Caption = 'Purchase Allocation Codes';
    CardPageID = "Purchase Allocation Card";
    PageType = List;
    SourceTable = "Standard Purchase Code";
    SourceTableView = WHERE ("Allocation Template" = FILTER (true));
    UsageCategory = Lists;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater("carepoint_repeater_1")
            {
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
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Allocation Template"; "Allocation Template")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

