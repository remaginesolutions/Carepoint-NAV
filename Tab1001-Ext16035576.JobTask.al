tableextension 16035576 tableextension16035576 extends "Job Task"
{
    // version NAVW113.00,CAREPOINT1.00

    // HBS VK CAREPOINT1.00 2016-07-04 Field "Closed" added (ticket #10021)
    fields
    {
        field(16035400; Closed; Boolean)
        {
            Caption = 'Closed';
            Description = 'CAREPOINT';
        }
    }
}

