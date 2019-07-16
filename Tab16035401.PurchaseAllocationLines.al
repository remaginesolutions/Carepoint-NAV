table 16035401 "Purchase Allocation Lines"
{
    // version CAREPOINT1.00

    // HBSTG CA2.00 2013-05-07: Added fields for Fixed % Cost Allocation
    // HBSTG PA1.03 2015-10-01: Added field "Period"


    fields
    {
        field(1; "Purch. Allocation Code"; Code[20])
        {
            TableRelation = "Standard Purchase Code".Code;
        }
        field(2; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(3; Period; Date)
        {
            Description = 'HBSTG PA1.03 2015-10-01';
        }
        field(4; Description; Text[50])
        {
        }
        field(5; "Allocation Percentage"; Decimal)
        {
        }
        field(6; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Description = 'CA2.00';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(7; "Allocation Quantity"; Decimal)
        {
            Description = 'HBSTG PA1.03 2015-10-01';
        }
    }

    keys
    {
        key(Key1; "Purch. Allocation Code", Period, "Global Dimension 1 Code", "Global Dimension 2 Code")
        {
        }
    }

    fieldgroups
    {
    }

    var
        Text001: Label 'Do you want to continue with amount allocation for the code %1?';

    procedure OpenAllocationListing(PurchaseHeader: Record "Purchase Header")
    var
        PurchReallocRec: Record "Standard Purchase Code";
        PurchReallocCode: Codeunit "Purchase Reallocation";
    begin
        /*
        IF PAGE.RUNMODAL(PAGE::"Purch. Allocation Lines",PurchReallocRec) = ACTION::LookupOK THEN BEGIN
          PurchReallocCode.BlankVariables();
          PurchReallocCode.SetVariables(PurchaseHeader."No.",PurchReallocRec."Purch. Allocation Code");
          PurchReallocCode.CreateAllocationLines();
        END;
        */

        //HBSTG
        IF PAGE.RUNMODAL(PAGE::"Purchase Allocation Codes", PurchReallocRec) = ACTION::LookupOK THEN BEGIN
            IF CONFIRM(Text001, TRUE, PurchReallocRec.Code) THEN BEGIN
                PurchReallocCode.BlankVariables();
                PurchReallocCode.SetVariables(PurchaseHeader."No.", PurchReallocRec.Code);
                PurchReallocCode.CreateAllocationLines();
            END;
        END;

    end;
}

