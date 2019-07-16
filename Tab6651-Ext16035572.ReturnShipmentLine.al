tableextension 16035572 tableextension16035572 extends "Return Shipment Line" 
{
    // version NAVW113.00,CAREPOINT1.00

    // HBS CAREPOINT1.00: Field "Reallocated Line" added
    fields
    {
        field(16035400;"Reallocated Line";Boolean)
        {
            Description = 'CAREPOINT';
        }
    }
}

