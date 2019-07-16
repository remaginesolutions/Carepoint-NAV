table 16035511 "Intercompany Integration Conf."
{
    // version CAREPOINT1.00


    fields
    {
        field(1; "Table ID"; Integer)
        {
            //TableRelation = "Table Information"."Table No.";
            //This property is currently not supported
            //TestTableRelation = false;
            //ValidateTableRelation = false;
        }
        field(2; "Integration Table ID"; Integer)
        {
            //TableRelation = "Table Information"."Table No.";
            //This property is currently not supported
            //TestTableRelation = false;
            //ValidateTableRelation = false;
        }
        field(3; "Business Unit Field No."; Integer)
        {
            TableRelation = Field."No." WHERE (TableNo = FIELD ("Integration Table ID"),
                                             Type = CONST (GUID));
        }
        field(4; "NAV No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(5; "Primary Key Code Field"; Integer)
        {
            TableRelation = Field."No." WHERE (TableNo = FIELD ("Table ID"),
                                             Type = CONST (Code));
        }
        field(6; "Update To Consolidation Comp."; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Table ID", "Integration Table ID")
        {
        }
    }

    fieldgroups
    {
    }
}

