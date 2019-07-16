tableextension 16035546 tableextension16035546 extends "Purchase Line Archive"
{
    // version NAVW113.00,CAREPOINT1.00

    // HBS CAREPOINT1.00: Field "Reallocated Line" added
    fields
    {
        field(16035500; "Reallocated Line"; Boolean)
        {
            Description = 'CAREPOINT';
        }
    }
}

