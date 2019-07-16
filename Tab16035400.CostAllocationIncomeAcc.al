table 16035400 "Cost Allocation Income Acc."
{
    // version CAREPOINT1.00

    // CAREPOINT1.00 RK 220714 : New table for cost allocations
    // CAREPOINT1.00 RK 230714 : Added two options to type for GIA Allocation


    fields
    {
        field(1; "No."; Code[10])
        {
            TableRelation = "G/L Account"."No." WHERE ("Account Type" = FILTER (Posting));

            trigger OnValidate()
            begin
                GLAcc.GET("No.");
                Description := GLAcc.Name;
            end;
        }
        field(2; Description; Text[50])
        {
        }
        field(3; Type; Option)
        {
            OptionMembers = ,"Cost Allocation Income Account","Revenue/Grants in Advance Account","Interest Exclusion Account","GIA Income Account","GIA Expense Account";
        }
    }

    keys
    {
        key(Key1; "No.", Type)
        {
        }
    }

    fieldgroups
    {
    }

    var
        GLAcc: Record "G/L Account";
}

