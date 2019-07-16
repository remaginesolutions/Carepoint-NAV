page 16035401 "Cost Allocation Income Account"
{
    // version CAREPOINT1.00

    PageType = List;
    SourceTable = "Cost Allocation Income Acc.";
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {

                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        GLacc.RESET;
                        GLacc.GET("No.");
                        Description := GLacc.Name;
                        Type := Type::"Cost Allocation Income Account";
                    end;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Type; Type)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    var
        GLacc: Record "G/L Account";
}

