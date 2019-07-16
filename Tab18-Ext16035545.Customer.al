tableextension 16035545 tableextension16035545 extends Customer 
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    fields
    {
        field(16035500;"NDIS Number";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'NDIS';
        }
         // Add changes to table fields here
        field(16035600;"ePDF Email";Boolean)
        {
        }
    }
}

