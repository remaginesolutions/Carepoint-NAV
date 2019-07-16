tableextension 16035557 tableextension16035557 extends "Purch. Inv. Header"
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    // HBSTG CAREPOINT1.00 2014-09-22: Added field "Document Sub-Type"
    // HBSTG CAREPOINT1.00 2015-09-18: Added Field Invoice Authorized
    // HBSRP CAREPOINT1.00 2015-11-20: Field "Creator ID" added and Code added to update it.
    // HBSSA CAREPOINT1.00 2016-27-01: Length of the field "Creator ID" increased according to the length in User Setup table
    fields
    {
        field(16035400; "Amount to Allocate"; Decimal)
        {
            Description = 'CAREPOINT1.00';
        }
        field(16035401; "Creator ID"; Code[50])
        {
            Description = 'CAREPOINT1.00';
            Editable = false;
        }
        field(16035402; "Document Sub-Type"; Option)
        {
            Description = 'CAREPOINT1.00';
            OptionCaption = 'Normal Purchase,Asset Purchase';
            OptionMembers = "Normal Purchase","Asset Purchase";
        }
        field(16035403; "Invoice Authorized"; Boolean)
        {
            Description = 'CAREPOINT1.00';
        }
        field(16035411; "Branch Code"; Code[20])
        {
            CalcFormula = Lookup ("Dimension Set Entry"."Dimension Value Code" WHERE ("Dimension Set ID" = FIELD ("Dimension Set ID"),
                                                                                     "Dimension Code" = CONST ('BRANCH')));
            Description = 'CAREPOINT1.00';
            Editable = false;
            FieldClass = FlowField;
            TableRelation = "Dimension Set Entry"."Dimension Value Code" WHERE ("Dimension Set ID" = FIELD ("Dimension Set ID"),
                                                                                "Dimension Code" = CONST ('BRANCH'));
        }
    }
}

