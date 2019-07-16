tableextension 16035556 tableextension16035556 extends "Purch. Rcpt. Line" 
{
    // version NAVW113.00,CAREPOINT1.00

    // HBS CAREPOINT1.00: Field "Reallocated Line" added
    // ReSRP Ticket #10854 2017-11-01: Code and functions added for Milestone lines
    fields
    {
        field(16035400;"Reallocated Line";Boolean)
        {
            Description = 'CAREPOINT';
        }
    }

    procedure ShowMilestoneLines()
    var
        PurchOrdMilestoneLine: Record "Purch. Ord. Milestone Line";
        PurchOrdMilestoneLines: Page "Purch. Ord. Milestone Lines";
    begin
        PurchOrdMilestoneLine.SETRANGE("Document Type",PurchOrdMilestoneLine."Document Type"::Receipt);
        PurchOrdMilestoneLine.SETRANGE("No.","Document No.");
        PurchOrdMilestoneLine.SETRANGE("Document Line No.","Line No.");
        PurchOrdMilestoneLines.SETTABLEVIEW(PurchOrdMilestoneLine);
        PurchOrdMilestoneLines.EDITABLE(FALSE);
        PurchOrdMilestoneLines.RUNMODAL;
    end;
}
