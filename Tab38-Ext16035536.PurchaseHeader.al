tableextension 16035536 tableextension16035536 extends "Purchase Header"
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    // HBSTG PA1.00 2014-09-17: Added field "Document Sub-Type"
    // HUME1.07 RK 8/10/14 : Added boolean RCTI
    // HBS TG CAREPOINT1.00 2015-09-18: Added Field Invoice Authorized
    // HBS RP CAREPOINT1.00 2015-11-20: Field "Creator ID" added and Code added to update it.
    // HBS SA CAREPOINT1.00 2016-27-01: Length of the field 'Creator ID' increased according to the length in User Setup table
    // HBS SA CAREPOINT1.00 2016-06-15: New fields added
    // ReSRP #10850 2017-10-27: added code for populating RCTI Invoice value from Vendor card to Purchase Header
    fields
    {
        field(16035400; "Amount to Allocate"; Decimal)
        {
            Description = 'CAREPOINT';
        }
        field(16035401; "Creator ID"; Code[50])
        {
            Description = 'CAREPOINT';
            Editable = false;
        }
        field(16035402; "Document Sub-Type"; Option)
        {
            Description = 'CAREPOINT';
            OptionCaption = 'Normal Purchase,Asset Purchase';
            OptionMembers = "Normal Purchase","Asset Purchase";
        }
        field(16035403; "Invoice Authorized"; Boolean)
        {
            Description = 'CAREPOINT';
        }
        field(16035404; "Total Amount Excl. GST"; Decimal)
        {
            CalcFormula = Sum ("Purchase Line".Amount WHERE ("Document Type" = FIELD ("Document Type"),
                                                            "Document No." = FIELD ("No.")));
            Description = 'CAREPOINT';
            FieldClass = FlowField;
        }
        field(16035405; "Outstanding Amount Excl. GST"; Decimal)
        {
            CalcFormula = Sum ("Purchase Line"."Outstanding Amt. Ex. VAT (LCY)" WHERE ("Document Type" = FIELD ("Document Type"),
                                                                                      "Document No." = FIELD ("No.")));
            Description = 'CAREPOINT';
            FieldClass = FlowField;
        }
        field(16035410; "RCTI Invoice"; Boolean)
        {
            Description = 'CAREPOINT1.00';

            trigger OnValidate()
            begin
                // CAREPOINT1.00 >>
                IF "RCTI Invoice" THEN BEGIN
                    IF CONFIRM(Text50000, FALSE) THEN
                        "Posting No." := "No."
                    ELSE
                        "Posting No." := '';
                END ELSE
                    "Posting No." := '';
                // CAREPOINT1.00 <<
            end;
        }
    }

    procedure AllocateAmountonLines(pPurchHeader: Record "Purchase Header")
    var
        recPurchLine: Record "Purchase Line";
    begin
        // CAREPOINT1.00 >>
        recPurchLine.RESET;
        recPurchLine.SETRANGE("Document Type", pPurchHeader."Document Type");
        recPurchLine.SETRANGE("Document No.", pPurchHeader."No.");
        IF recPurchLine.FINDSET THEN
            REPEAT
                recPurchLine.VALIDATE("Direct Unit Cost", pPurchHeader."Amount to Allocate");
                recPurchLine.MODIFY(TRUE);
            UNTIL recPurchLine.NEXT = 0;
        // CAREPOINT1.00 <<
    end;

    var
        Text50000: Label 'This will make the Invoice keep the number above as the posted invoice number. Do you want to continue?';
}

