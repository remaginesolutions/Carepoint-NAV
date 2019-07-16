page 16035505 "Intercompany Integration Conf."
{
    // version CAREPOINT1.00

    DelayedInsert = true;
    PageType = List;
    SourceTable = "Intercompany Integration Conf.";
    UsageCategory = Administration;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Table ID"; "Table ID")
                {
                    ApplicationArea = All;
                }
                field("Integration Table ID"; "Integration Table ID")
                {
                    ApplicationArea = All;
                }
                field("Business Unit Field No."; "Business Unit Field No.")
                {
                    ApplicationArea = All;
                }
                field("NAV No. Series"; "NAV No. Series")
                {
                    ApplicationArea = All;
                }
                field("Primary Key Code Field"; "Primary Key Code Field")
                {
                    ApplicationArea = All;
                }
                field("Update To Consolidation Comp."; "Update To Consolidation Comp.")
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

