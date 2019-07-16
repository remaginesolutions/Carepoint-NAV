pageextension 16035529 StandardPurchaseCodeExt extends "Standard Purchase Code Card"
{
    layout
    {
        // Add changes to page layout here
        addafter("Currency Code")
        {
            field("Allocation Template"; "Allocation Template")
            {
                ApplicationArea = All;
            }
        }
        modify(StdPurchaseLines)
        {
            visible = ("Allocation Template" = false);
        }
        addafter(StdPurchaseLines)
        {
            part("Purchase Allocation Subform"; "Purchase Allocation Subform")
            {
                ApplicationArea = All;
                visible = ("Allocation Template" = True);
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}