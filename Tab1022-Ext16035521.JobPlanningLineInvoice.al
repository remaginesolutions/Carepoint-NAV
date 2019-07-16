tableextension 16035521 tableextension16035521 extends "Job Planning Line Invoice"
{
    // version NAVW113.00,CAREPOINT1.00

    // HBS VK 2016-07-22: Field "Service Activity Id" added
    // HBS VK 2016-11-02: Field "Service Delivery Date" added (ticket #10209)
    // HBS VK 2016-11-09: Fields "Scheduled Start", "Scheduled End" added (ticket #10235)
    // ReSRP CAREPOINT1.00 2018-08-14: New fields related to  NDIS have been added (Ticket #10997)
    fields
    {
        field(16035500; "Service Activity Id"; Guid)
        {
            Caption = 'Service Activity Id';
            Description = 'NDIS';
            TableRelation = msdyn_workorder;
        }
        field(16035501; "Service Delivery Date"; Date)
        {
            Description = 'NDIS';
        }
        field(16035502; "Scheduled Start"; DateTime)
        {
            Description = 'NDIS';
        }
        field(16035503; "Scheduled End"; DateTime)
        {
            Description = 'NDIS';
        }
        field(16035505; "NDIS Claim Reference Code"; Code[20])
        {
            Description = 'NDIS';
        }
    }


    //Unsupported feature: Code Modification on "InitFromJobPlanningLine(PROCEDURE 1)".

    //procedure InitFromJobPlanningLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Job No." := JobPlanningLine."Job No.";
    "Job Task No." := JobPlanningLine."Job Task No.";
    "Job Planning Line No." := JobPlanningLine."Line No.";
    "Quantity Transferred" := JobPlanningLine."Qty. to Transfer to Invoice";
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
    "Service Activity Id" := JobPlanningLine."Work Order Id"; // HBS VK 2016-07-22 CAREPOINT1.00
    "Service Delivery Date" := JobPlanningLine."Planned Delivery Date"; // HBS VK #10209 CAREPOINT1.00
    "Scheduled Start" := JobPlanningLine."Scheduled Start"; // HBS VK #10209 CAREPOINT1.00
    "Scheduled End" := JobPlanningLine."Scheduled End"; // HBS VK #10209 CAREPOINT1.00
    "NDIS Claim Reference Code" := JobPlanningLine."NDIS Claim Reference Code";  //ReSRP 2018-04-09:
    */
    //end;
}

