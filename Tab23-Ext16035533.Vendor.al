tableextension 16035533 tableextension16035533 extends Vendor
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    // HBSRP CAREPOINT1.00 2015-11-04: New Fields Added related to CRM Connector
    fields
    {
        field(16035400; "Branch Filter"; Code[20])
        {
            Description = 'CAREPOINT';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE ("Dimension Code" = CONST ('BRANCH'));
        }
        field(16035401; "Connector Record"; Boolean)
        {
            Description = 'CAREPOINT';
        }
        field(16035402; "Template Applied"; Boolean)
        {
            Description = 'CAREPOINT';
        }
        field(16035600; "ePDF Email"; Boolean)
        {
            Description = 'CAREPOINT';
            Caption = 'ePDF Email';
        }
        field(16035601; "ePDF Email-RCTI"; Boolean)
        {
            Description = 'CAREPOINT';
            Caption = 'ePDF Email-RCTI';
        }
        field(16035602; "ePDF Email-Remittance"; Boolean)
        {
            Description = 'CAREPOINT';
            Caption = 'ePDF Email-Remittance';
        }
    }
}

