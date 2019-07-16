tableextension 16035571 tableextension16035571 extends "Purchase Header Archive" 
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    // HBSTG CAREPOINT1.00 2014-09-22: Added field "Document Sub-Type"
    // HBSTG CAREPOINT1.00 2015-09-18: Added Field Invoice Authorized
    // HBSRP CAREPOINT1.00 2015-11-20: Field "Creator ID" added and Code added to update it.
    fields
    {
        field(16035400;"Amount to Allocate";Decimal)
        {
            Description = 'CAREPOINT1.00';
        }
        field(16035401;"Creator ID";Code[20])
        {
            Description = 'CAREPOINT1.00';
            Editable = false;
        }
        field(16035402;"Document Sub-Type";Option)
        {
            Description = 'CAREPOINT1.00';
            OptionCaption = 'Normal Purchase,Asset Purchase';
            OptionMembers = "Normal Purchase","Asset Purchase";
        }
        field(16035403;"Invoice Authorized";Boolean)
        {
            Description = 'CAREPOINT1.00';
        }
    }
}

