tableextension 16035560 tableextension16035560 extends "Job Planning Line"
{
    // version NAVW113.00,CAREPOINT1.00

    // HBS VK CAREPOINT1.00 2016-07-22 Field "Service Activity Id" added
    // HBS VK CAREPOINT1.00 2016-11-08: Fields "Scheduled Start", "Scheduled End" added (ticket #10235)
    // ReSRP CAREPOINT1.00 2018-08-14: New fields related to  NDIS have been added (Ticket #10997)
    fields
    {
        field(16035500; "Work Order Id"; Guid)
        {
            Caption = 'Work Order Id';
            Description = 'NDIS';
            TableRelation = msdyn_workorder;
        }
        field(16035501; "Scheduled Start"; DateTime)
        {
            Description = 'NDIS';
        }
        field(16035502; "Scheduled End"; DateTime)
        {
            Description = 'NDIS';
        }
        field(16035503; Correction; Boolean)
        {
        }
        field(16035504; "Ready to Credit and Invoice"; Boolean)
        {
        }
        field(16035505; "NDIS Claim Reference Code"; Code[20])
        {
        }
        field(16035506; "CRM-Imported Entry"; Boolean)
        {
        }
    }
}

