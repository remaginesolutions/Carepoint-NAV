page 16035504 "Carepoint Setup"
{
    // version CAREPOINT1.00

    // ReSRP CAREPOINT1.00 2018-08-14: New fields added related to NDIS added (Ticket #10997)

    DeleteAllowed = false;
    InsertAllowed = false;
    SourceTable = "Carepoint Setup";
    UsageCategory = Administration;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Default Pantry Job No."; "Default Pantry Job No.")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Default Pantry Job Task No."; "Default Pantry Job Task No.")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Allow Price Change"; "Allow Price Change")
                {
                    ApplicationArea = All;
                }
                field("GCC Dim. Value Code"; "GCC Dim. Value Code")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("TCC Dim. Value Code"; "TCC Dim. Value Code")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("GCC Code"; "GCC Code")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("TCC Code"; "TCC Code")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Integr. Error Notif. User"; "Integr. Error Notif. User")
                {
                    ApplicationArea = All;
                }
                field("Consolidation Company"; "Consolidation Company")
                {
                    ApplicationArea = All;
                }
                field("EFT Reference Type"; "EFT Reference Type")
                {
                    ApplicationArea = All;
                }
            }
            group("NDIS Upload")
            {
                field("NDIS Claims No Issued Type"; "NDIS Claims No Issued Type")
                {
                    ApplicationArea = All;
                }
                field("NDIS Claim No. Series"; "NDIS Claim No. Series")
                {
                    ApplicationArea = All;
                }
                field("NDIS Upload No. Series"; "NDIS Upload No. Series")
                {
                    ApplicationArea = All;
                }
                field("NDIS Upload Status Warning En."; "NDIS Upload Status Warning En.")
                {
                    ApplicationArea = All;
                }
                field("NDIS Ready Status Check"; "NDIS Ready Status Check")
                {
                    ApplicationArea = All;
                }
            }
            field("Activity Fee Work Type Code"; "Activity Fee Work Type Code")
            {
                ApplicationArea = All;
            }
            field("Emergency Relief Limit"; "Emergency Relief Limit")
            {
                ApplicationArea = All;
            }
            field("CRM Program Dimension Code"; "CRM Program Dimension Code")
            {
                ApplicationArea = All;
            }
            field("CRM Subprogram Dimension Code"; "CRM Subprogram Dimension Code")
            {
                ApplicationArea = All;
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

