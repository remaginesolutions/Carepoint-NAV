codeunit 16035402 "Carepoint Job Queue Functions"
{
    // version CAREPOINT1.00

    // HBS VK 2016-11-01 Object created (ticket #10206)

    TableNo = 472;

    trigger OnRun()
    var
        PurchaseHeader: Record "Purchase Header";
    begin
        CASE "Parameter String" OF
            'CHANGEPOPOSTINGDATE':
                BEGIN
                    PurchaseHeader.SETFILTER(Status, '<>%1', PurchaseHeader.Status::"Pending Approval");
                    IF NOT PurchaseHeader.ISEMPTY THEN BEGIN
                        PurchaseHeader.SetHideValidationDialog(TRUE);
                        PurchaseHeader.MODIFYALL("Posting Date", TODAY, TRUE);
                    END;
                END;
        END;
    end;

    var
        HBSWorkflowMgt: Codeunit "HBS Workflow Mgt.";


}

