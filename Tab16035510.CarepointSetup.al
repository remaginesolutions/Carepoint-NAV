table 16035510 "Carepoint Setup"
{
    // version CAREPOINT1.00

    // VK 2017-04-12: Field "Limited User Group" added (ticket #10512)
    // ReSRP CAREPOINT1.00 2018-08-14: New fields related to  NDIS have been added (Ticket #10997)


    fields
    {
        field(1; "Code"; Code[10])
        {
        }
        field(2; "Default Pantry Job No."; Code[20])
        {
            TableRelation = Job;
        }
        field(3; "Default Pantry Job Task No."; Code[20])
        {
            TableRelation = "Job Task"."Job Task No." WHERE ("Job No." = FIELD ("Default Pantry Job No."));
        }
        field(4; "Allow Price Change"; Boolean)
        {
        }
        field(5; "GCC Dim. Value Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code;
        }
        field(6; "TCC Dim. Value Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code;
        }
        field(7; "GCC Code"; Code[20])
        {
        }
        field(8; "TCC Code"; Code[20])
        {
        }
        field(9; "Integr. Error Notif. User"; Code[50])
        {
            Caption = 'Integr. Error Notif. User';
            TableRelation = "User Setup";
        }
        field(10; "Activity Fee Work Type Code"; Code[20])
        {
            TableRelation = "Work Type";
        }
        field(11; "Default Pantry Work Type"; Code[20])
        {
            TableRelation = "Work Type";
        }
        field(12; "Default Kidsoft Customer"; Code[20])
        {
            Description = 'KIDSOFT';
            TableRelation = Customer;
        }
        field(13; "CRM Program Dimension Code"; Code[20])
        {
            TableRelation = Dimension;
        }
        field(14; "CRM Subprogram Dimension Code"; Code[20])
        {
            TableRelation = Dimension;
        }
        field(17; "Emergency Relief Limit"; Integer)
        {
        }
        field(18; "EFT Reference Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Vendor Inv. No.,NAV Posted Purch. Inv. No.';
            OptionMembers = "Vendor Inv. No.","NAV Posted Purch. Inv. No.";
        }
        field(100; "Consolidation Company"; Code[50])
        {
            TableRelation = Company;
        }
        field(101; "NDIS Claim No. Series"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(102; "NDIS Upload No. Series"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(103; "NDIS Upload Status Warning En."; Boolean)
        {
            Caption = 'NDIS Upload Status Warning Enabled';
        }
        field(104; "NDIS Ready Status Check"; Boolean)
        {
        }
        field(110; "NDIS Claims No Issued Type"; Option)
        {
            Caption = 'Claims No Issued Type';
            OptionCaption = ' ,Bulk,Individual';
            OptionMembers = " ",Bulk,Individual;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
        }
    }

    fieldgroups
    {
    }
}

