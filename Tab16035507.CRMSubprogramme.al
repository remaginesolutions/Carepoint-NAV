table 16035507 "CRM Subprogramme"
{
    // version CAREPOINT1.00

    // Dynamics CRM Version: 8.1.0.538

    Caption = 'Subprogramme';
    Description = '';
    ExternalName = 'hbs_subprogramme';
    TableType = CRM;

    fields
    {
        field(1;hbs_subprogrammeId;Guid)
        {
            Caption = 'Subprogramme';
            Description = 'Unique identifier for entity instances';
            ExternalAccess = Insert;
            ExternalName = 'hbs_subprogrammeid';
            ExternalType = 'Uniqueidentifier';
        }
        field(2;CreatedOn;DateTime)
        {
            Caption = 'Created On';
            Description = 'Date and time when the record was created.';
            ExternalAccess = Read;
            ExternalName = 'createdon';
            ExternalType = 'DateTime';
        }
        field(3;ModifiedOn;DateTime)
        {
            Caption = 'Modified On';
            Description = 'Date and time when the record was modified.';
            ExternalAccess = Read;
            ExternalName = 'modifiedon';
            ExternalType = 'DateTime';
        }
        field(4;statecode;Option)
        {
            Caption = 'Status';
            Description = 'Status of the Subprogramme';
            ExternalAccess = Modify;
            ExternalName = 'statecode';
            ExternalType = 'State';
            InitValue = " ";
            OptionCaption = ' ,Active,Inactive';
            OptionOrdinalValues = -1,0,1;
            OptionMembers = " ",Active,Inactive;
        }
        field(5;statuscode;Option)
        {
            Caption = 'Status Reason';
            Description = 'Reason for the status of the Subprogramme';
            ExternalName = 'statuscode';
            ExternalType = 'Status';
            InitValue = " ";
            OptionCaption = ' ,Active,Inactive';
            OptionOrdinalValues = -1,1,2;
            OptionMembers = " ",Active,Inactive;
        }
        field(6;VersionNumber;BigInteger)
        {
            ExternalAccess = Read;
            ExternalName = 'versionnumber';
            ExternalType = 'BigInt';
        }
        field(7;ImportSequenceNumber;Integer)
        {
            Caption = 'Import Sequence Number';
            Description = 'Sequence number of the import that created this record.';
            ExternalAccess = Insert;
            ExternalName = 'importsequencenumber';
            ExternalType = 'Integer';
        }
        field(8;OverriddenCreatedOn;Date)
        {
            Caption = 'Record Created On';
            Description = 'Date and time that the record was migrated.';
            ExternalAccess = Insert;
            ExternalName = 'overriddencreatedon';
            ExternalType = 'DateTime';
        }
        field(9;TimeZoneRuleVersionNumber;Integer)
        {
            Caption = 'Time Zone Rule Version Number';
            Description = 'For internal use only.';
            ExternalName = 'timezoneruleversionnumber';
            ExternalType = 'Integer';
            MinValue = -1;
        }
        field(10;UTCConversionTimeZoneCode;Integer)
        {
            Caption = 'UTC Conversion Time Zone Code';
            Description = 'Time zone code that was in use when the record was created.';
            ExternalName = 'utcconversiontimezonecode';
            ExternalType = 'Integer';
            MinValue = -1;
        }
        field(11;hbs_name;Text[100])
        {
            Caption = 'Subprogramme Name';
            Description = 'The name of the custom entity.';
            ExternalName = 'hbs_name';
            ExternalType = 'String';
        }
        field(12;hbs_programme;Guid)
        {
            Caption = 'Programme Id';
            Description = '';
            ExternalName = 'hbs_programme';
            ExternalType = 'Lookup';
            TableRelation = "CRM Programme".hbs_programmeId;
        }
        field(13;hbs_programmeName;Text[100])
        {
            Caption = 'Programme Name';
            Enabled = false;
            ExternalAccess = Read;
            ExternalName = 'hbs_programmename';
            ExternalType = 'String';
        }
        field(14;hbs_description;Text[250])
        {
            Caption = 'Description';
            Description = '';
            ExternalName = 'hbs_description';
            ExternalType = 'String';
        }
        field(15;ModifiedBy;Guid)
        {
            Caption = 'Modified By';
            Description = 'Unique identifier of the user who modified the record.';
            ExternalAccess = Read;
            ExternalName = 'modifiedby';
            ExternalType = 'Lookup';
            TableRelation = "CRM Systemuser".SystemUserId;
        }
    }

    keys
    {
        key(Key1;hbs_subprogrammeId)
        {
        }
        key(Key2;hbs_name)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;hbs_name)
        {
        }
    }
}

