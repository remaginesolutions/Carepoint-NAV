codeunit 16035403 "Purchase Reallocation"
{
    // version CAREPOINT1.00

    // CA2.00
    // //Document Dimension is not exist


    trigger OnRun()
    begin
    end;

    var
        Dim: Record "Dimension";
        "Purch No.": Code[20];
        "Allocation Code": Code[20];
        "Line No.": Integer;

    procedure SetVariables(PurchNo: Code[20]; AllocCode: Code[20])
    begin
        IF PurchNo <> '' THEN
            "Purch No." := PurchNo;
        IF AllocCode <> '' THEN
            "Allocation Code" := AllocCode;
    end;

    procedure BlankVariables()
    begin
        "Purch No." := '';
        "Allocation Code" := '';
    end;

    procedure CreateAllocationLines()
    var
        PurchLine: Record "Purchase Line";
        ReallocationSetup: Record "Purchase Allocation Lines";
        PurchLine2: Record "Purchase Line";
        NextLineNo: Integer;
        OriginalAmount: Decimal;
        OriginalQty: Decimal;
        LastLineNo: Integer;
    begin
        PurchLine.RESET;
        PurchLine.SETRANGE("Document Type", PurchLine."Document Type"::Invoice);
        PurchLine.SETRANGE("Document No.", "Purch No.");
        IF PurchLine.FINDLAST THEN BEGIN
            LastLineNo := PurchLine."Line No.";
        END;

        PurchLine.RESET;
        PurchLine.SETRANGE("Document Type", PurchLine."Document Type"::Invoice);
        PurchLine.SETRANGE("Document No.", "Purch No.");
        PurchLine.SETFILTER("Line No.", '<=%1', LastLineNo);
        IF PurchLine.FIND('-') THEN BEGIN
            REPEAT
                OriginalQty := PurchLine.Quantity;
                OriginalAmount := PurchLine.Amount;
                PurchLine2.RESET;
                PurchLine2.SETRANGE("Document Type", PurchLine2."Document Type"::Invoice);
                PurchLine2.SETRANGE("Document No.", "Purch No.");
                IF PurchLine2.FINDLAST THEN
                    NextLineNo := PurchLine2."Line No." + 1
                ELSE
                    ERROR('Could not calculate line number');

                PurchLine2.RESET;
                ReallocationSetup.RESET;
                ReallocationSetup.SETRANGE("Purch. Allocation Code", "Allocation Code");
                IF ReallocationSetup.FINDSET THEN BEGIN
                    REPEAT
                        PurchLine2 := PurchLine;
                        PurchLine2."Line No." := NextLineNo;
                        PurchLine2.INSERT;
                        PurchLine2.VALIDATE("Shortcut Dimension 1 Code", ReallocationSetup."Global Dimension 1 Code");
                        PurchLine2.VALIDATE("Shortcut Dimension 2 Code", ReallocationSetup."Global Dimension 2 Code");
                        PurchLine2.VALIDATE(Quantity, (ReallocationSetup."Allocation Percentage" / 100) * OriginalQty);
                        PurchLine2."Reallocated Line" := TRUE;
                        PurchLine2.MODIFY;
                        /*
                        IF Dim.GET('SITE') THEN BEGIN
                          DocumentDimension.RESET;
                          DocumentDimension.INIT;
                          DocumentDimension.VALIDATE("Table ID",39);
                          DocumentDimension.VALIDATE("Document Type",DocumentDimension."Document Type"::Invoice);
                          DocumentDimension.VALIDATE("Document No.",PurchLine."Document No.");
                          DocumentDimension.VALIDATE("Line No.",NextLineNo);
                          DocumentDimension.VALIDATE("Dimension Code",'SITE');
                          DocumentDimension.VALIDATE("Dimension Value Code",ReallocationSetup.Site);
                          DocumentDimension.INSERT;
                        END;
                        */
                        NextLineNo := NextLineNo + 1;
                    UNTIL ReallocationSetup.NEXT = 0;
                END;
                PurchLine.DELETE;
            UNTIL PurchLine.NEXT = 0;
        END;

    end;
}

