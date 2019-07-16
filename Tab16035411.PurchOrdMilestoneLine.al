table 16035411 "Purch. Ord. Milestone Line"
{
    // version CAREPOINT1.00

    // ReSRP Ticket #10854 2017-11-01: New Table

    Caption = 'Purch. Ord. Milestone Line';
    DrillDownPageID = 16035411;
    LookupPageID = 16035411;

    fields
    {
        field(1; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Receipt,Posted Invoice,Posted Credit Memo,Posted Return Shipment';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Receipt,"Posted Invoice","Posted Credit Memo","Posted Return Shipment";
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; Date; Date)
        {
            Caption = 'Date';
        }
        field(5; "Actual Due Date"; Date)
        {
            Caption = 'Actual Due Date';
        }
        field(6; Description; Text[80])
        {
            Caption = 'Description';
        }
        field(7; "Document Line No."; Integer)
        {
            Caption = 'Document Line No.';
        }
        field(10; "Due Date"; Date)
        {
        }
        field(15; Completed; Boolean)
        {

            trigger OnValidate()
            begin
                //IF Completed THEN
                //SendApproval();
            end;
        }
    }

    keys
    {
        key(Key1; "Document Type", "No.", "Document Line No.", "Line No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        //TestStatusOpen();
    end;

    trigger OnModify()
    begin
        //TestStatusOpen();
    end;

    var
        PurchHeader: Record "Purchase Header";
        PurchOrdMilestoneLine1: Record "Purch. Ord. Milestone Line";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";

    procedure SetUpNewLine()
    var
        PurchOrdMilestoneLine: Record "Purch. Ord. Milestone Line";
    begin
        PurchOrdMilestoneLine.SETRANGE("Document Type", "Document Type");
        PurchOrdMilestoneLine.SETRANGE("No.", "No.");
        PurchOrdMilestoneLine.SETRANGE("Document Line No.", "Document Line No.");
        PurchOrdMilestoneLine.SETRANGE(Date, WORKDATE);
        IF NOT PurchOrdMilestoneLine.FINDFIRST THEN
            Date := WORKDATE;
    end;

    local procedure GetPurchHeader()
    begin
        TESTFIELD("No.");
        PurchHeader.GET("Document Type", "No.");
    end;

    local procedure TestStatusOpen()
    begin
        GetPurchHeader;
        PurchHeader.TESTFIELD(Status, PurchHeader.Status::Open);
    end;

    procedure SendApproval()
    begin
        GetPurchHeader();
        PurchOrdMilestoneLine1.SETRANGE("Document Type", "Document Type");
        PurchOrdMilestoneLine1.SETRANGE("No.", "No.");
        PurchOrdMilestoneLine1.SETRANGE(Completed, FALSE);
        IF NOT PurchOrdMilestoneLine1.FINDFIRST THEN BEGIN
            CLEAR(ApprovalsMgmt);
            //ApprovalsMgmt.CallFromMilestoneTrakingLines(TRUE);
            //IF ApprovalMgt.SendPurchaseApprovalRequest(PurchHeader) THEN;
            IF ApprovalsMgmt.CheckPurchaseApprovalPossible(PurchHeader) THEN
                ApprovalsMgmt.OnSendPurchaseDocForApproval(PurchHeader);
        END;
    end;
}

