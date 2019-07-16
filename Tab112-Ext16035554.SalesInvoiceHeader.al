tableextension 16035554 tableextension16035554 extends "Sales Invoice Header" 
{
    // version NAVW113.00,NAVAPAC13.00,CAREPOINT1.00

    // HBS VK CAREPOINT1.00 2016-11-07 Fields added
    fields
    {
        field(16035500;"NDIA Claim Reference";Code[20])
        {
            Description = 'CAREPOINT1.00';
            Editable = false;
        }
        field(16035501;"NDIA Claim Uploaded";Boolean)
        {
            Description = 'CAREPOINT1.00';
            Editable = false;
        }
        field(16035502;"Pantry Invoice";Boolean)
        {
            Description = 'CAREPOINT1.00';
        }
        field(16035503;"Work Type Code";Code[50])
        {
            Description = 'CAREPOINT1.00';
            TableRelation = "Work Type";
        }
        field(16035504;"Session ID";Text[100])
        {
            Description = 'CAREPOINT1.00';
        }
        field(16035505;"CRM Job Task";Guid)
        {
            Description = 'CAREPOINT1.00';
        }
        field(16035506;"CRM Service";Guid)
        {
            Description = 'CAREPOINT1.00';
        }
        field(16035507;"CRM Case";Guid)
        {
            Description = 'CAREPOINT1.00';
        }
    }
}

