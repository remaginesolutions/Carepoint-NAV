tableextension 16035532 tableextension16035532 extends "User Setup" 
{
    // version NAVW113.00,CAREPOINT1.00

    // HBSTG CAREPOINT1.00 2014-09-22: Added field User Full Name and code to update it automatically
    fields
    {
        field(16035400;"User Full Name";Text[80])
        {
            Description = 'CAREPOINT';
            Editable = false;
        }
    }
}

