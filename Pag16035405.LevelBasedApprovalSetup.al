page 16035405 "Level Based Approval Setup"
{
    // version CAREPOINT1.00

    // HBS VK 2016-12-05: Field 100 "Restrict Self-Approval" added (ticket #10296)

    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Level Based Approval Setup";
    UsageCategory = Administration;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            grid("carepoint_grid_1")
            {
                group("Approval Level 1")
                {
                    field("Code"; Approver1)
                    {
                        ApplicationArea = All;
                        Caption = 'Code';
                    }
                    field("Dimension Code1"; "Approver1 Dimension Code")
                    {
                        ApplicationArea = All;
                        Caption = 'Dimension Code';
                        LookupPageID = Dimensions;
                    }
                }
                group("Approval Level 2")
                {
                    field(Code2; Approver2)
                    {
                        ApplicationArea = All;
                        Caption = 'Code';
                    }
                    field("Dimension Code2"; "Approver2 Dimension Code")
                    {
                        ApplicationArea = All;
                        Caption = 'Dimension Code';
                        LookupPageID = Dimensions;
                    }
                }
                group("Approval Level 3")
                {
                    field(Code3; Approver3)
                    {
                        ApplicationArea = All;
                        Caption = 'Code';
                    }
                    field("Dimension Code3"; "Approver3 Dimension Code")
                    {
                        ApplicationArea = All;
                        Caption = 'Dimension Code';
                        LookupPageID = Dimensions;
                    }
                }
                group("Approval Level 4")
                {
                    field(Code4; Approver4)
                    {
                        ApplicationArea = All;
                        Caption = 'Code';
                    }
                    field("Dimension Code4"; "Approver4 Dimension Code")
                    {
                        ApplicationArea = All;
                        Caption = 'Dimension Code';
                        LookupPageID = Dimensions;
                    }
                }
                group("Approval Level 5")
                {
                    field(Code5; Approver5)
                    {
                        ApplicationArea = All;
                        Caption = 'Code';
                        Importance = Standard;
                    }
                    field("Dimension Code5"; "Approver5 Dimension Code")
                    {
                        ApplicationArea = All;
                        Caption = 'Dimension Code';
                        Importance = Standard;
                        LookupPageID = Dimensions;
                    }
                }
                group("Approval Level 6")
                {
                    field(Code6; Approver6)
                    {
                        ApplicationArea = All;
                        Caption = 'Code';
                        Importance = Standard;
                    }
                    field("Dimension Code6"; "Approver6 Dimension Code")
                    {
                        ApplicationArea = All;
                        Caption = 'Dimension Code';
                        Importance = Standard;
                        LookupPageID = Dimensions;
                    }
                }
                group("Approval Level 7")
                {
                    field(Code7; Approver7)
                    {
                        Caption = 'Code';
                        Importance = Additional;
                        ApplicationArea = All;
                    }
                    field("Dimension Code7"; "Approver7 Dimension Code")
                    {
                        Caption = 'Dimension Code';
                        Importance = Additional;
                        LookupPageID = Dimensions;
                        ApplicationArea = All;
                    }
                }
                group("Approval Level 8")
                {
                    field(Code8; Approver8)
                    {
                        Caption = 'Code';
                        Importance = Additional;
                        ApplicationArea = All;
                    }
                    field("Dimension Code8"; "Approver8 Dimension Code")
                    {
                        Caption = 'Dimension Code';
                        Importance = Additional;
                        LookupPageID = Dimensions;
                        ApplicationArea = All;
                    }
                }
                group("Approval Level 9")
                {
                    field(Code9; Approver9)
                    {
                        Caption = 'Code';
                        Importance = Additional;
                        ApplicationArea = All;
                    }
                    field("Dimension Code9"; "Approver9 Dimension Code")
                    {
                        Caption = 'Dimension Code';
                        Importance = Additional;
                        LookupPageID = Dimensions;
                        ApplicationArea = All;
                    }
                }
                group("ApprovAl Level 10")
                {
                    field(Code10; Approver10)
                    {
                        Caption = 'Code';
                        Importance = Additional;
                        ApplicationArea = All;
                    }
                    field("Dimension Code10"; "Approver10 Dimension Code")
                    {
                        Caption = 'Dimension Code';
                        Importance = Additional;
                        LookupPageID = Dimensions;
                        ApplicationArea = All;
                    }
                }
                group("Approval Level 11")
                {
                    field(Code11; Approver11)
                    {
                        Caption = 'Code';
                        Importance = Additional;
                        ApplicationArea = All;
                    }
                    field("Dimension Code11"; "Approver11 Dimension Code")
                    {
                        Caption = 'Dimension Code';
                        Importance = Additional;
                        LookupPageID = Dimensions;
                        ApplicationArea = All;
                    }
                }
                group("Approval Level 12")
                {
                    field(Code12; Approver12)
                    {
                        Caption = 'Code';
                        Importance = Additional;
                        ApplicationArea = All;
                    }
                    field("Dimension Code12"; "Approver12 Dimension Code")
                    {
                        Caption = 'Dimension Code';
                        Importance = Additional;
                        LookupPageID = Dimensions;
                        ApplicationArea = All;
                    }
                }
                group(Settings)
                {
                    field("Restrict Self-Approval"; "Restrict Self-Approval")
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        IF NOT GET THEN
            INSERT;
    end;
}

