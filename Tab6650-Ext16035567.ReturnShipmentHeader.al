tableextension 16035567 tableextension16035567 extends "Return Shipment Header" 
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    // HBSTG CAREPOINT1.00 2014-09-22: Added field "Document Sub-Type"
    // HBSTG CAREPOINT1.00 2015-09-18: Added Field Invoice Authorized
    // HBSRP CAREPOINT1.00 2015-11-20: Field "Creator ID" added and Code added to update it.
    fields
    {
        field(16035400;"Amount to Allocate";Decimal)
        {
            Description = 'HBSTG';
        }
        field(16035401;"Creator ID";Code[50])
        {
            Description = 'HBSRP';
            Editable = false;
        }
        field(16035402;"Document Sub-Type";Option)
        {
            Description = 'HBSTG PA1.00 2014-09-17';
            OptionCaption = 'Normal Purchase,Asset Purchase';
            OptionMembers = "Normal Purchase","Asset Purchase";
        }
        field(16035403;"Invoice Authorized";Boolean)
        {
            Description = 'HBSTG PA1.02 2015-09-18';
        }
    }
}

