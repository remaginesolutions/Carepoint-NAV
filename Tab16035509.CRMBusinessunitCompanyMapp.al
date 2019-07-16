table 16035509 "CRM Businessunit Company Mapp."
{
    // version CAREPOINT1.00


    fields
    {
        field(1;"Business Unit";Guid)
        {
            TableRelation = "CRM Businessunit";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(3;"Business Unit Name";Text[250])
        {
        }
        field(5;"Company Name";Code[100])
        {
            TableRelation = Company;
        }
    }

    keys
    {
        key(Key1;"Business Unit")
        {
        }
    }

    fieldgroups
    {
    }
}

