page 16035406 "Level Based Approvals"
{
    // version CAREPOINT1.00

    // HBSTG CAREPOINT1.00 2014-09-22: New page to store level based approvals

    PageType = List;
    SourceTable = "Level Based Approval";
    UsageCategory = Administration;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sequence No."; "Sequence No.")
                {
                    ApplicationArea = All;
                }
                field(Level; Level)
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field("Company Level Approval"; "Company Level Approval")
                {
                    ApplicationArea = All;
                }
                field("User ID"; "User ID")
                {
                    ApplicationArea = All;
                }
                field("Normal Purchase Amount Limit"; "Normal Purchase Amount Limit")
                {
                    ApplicationArea = All;
                }
                field("Unlimited Normal Purch Limit"; "Unlimited Normal Purch Limit")
                {
                    ApplicationArea = All;
                }
                field("Asset Purchase Amount Limit"; "Asset Purchase Amount Limit")
                {
                    ApplicationArea = All;
                }
                field("Unlimited Asset Purchase Limit"; "Unlimited Asset Purchase Limit")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Level Based Approval Setup")
            {
                Image = ApprovalSetup;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page 16035405;
                ApplicationArea = All;
            }
            action("Auto Populate")
            {
                Caption = 'Auto Populate';
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    PopulateFromApproverSetup;
                end;
            }
        }
    }
}

