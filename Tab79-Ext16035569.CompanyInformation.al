tableextension 16035569 tableextension16035569 extends "Company Information" 
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    // HBS VK CAREPOINT1.00 2016-11-07 Field "NDIS Registration Number" added (ticket #10235)
    fields
    {
        field(16035500;"NDIS Registration Number";Code[20])
        {
            Description = 'NDIS';
        }
    }
}

