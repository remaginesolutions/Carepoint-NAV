table 16035501 msdyn_agreement
{
    // version CAREPOINT1.00

    // Dynamics CRM Version: 8.2.2.135

    Caption = 'Agreement';
    Description = 'Provides ability to store details about service agreements you have with your customers';
    ExternalName = 'msdyn_agreement';
    TableType = CRM;

    fields
    {
        field(1;msdyn_agreementId;Guid)
        {
            Caption = 'Agreement';
            Description = 'Shows the entity instances.';
            ExternalAccess = Insert;
            ExternalName = 'msdyn_agreementid';
            ExternalType = 'Uniqueidentifier';
        }
        field(2;CreatedOn;DateTime)
        {
            Caption = 'Created On';
            Description = 'Shows the date and time when the record was created. The date and time are displayed in the time zone selected in Microsoft Dynamics 365 options.';
            ExternalAccess = Read;
            ExternalName = 'createdon';
            ExternalType = 'DateTime';
        }
        field(3;ModifiedOn;DateTime)
        {
            Caption = 'Modified On';
            Description = 'Shows the date and time when the record was last updated. The date and time are displayed in the time zone selected in Microsoft Dynamics 365 options.';
            ExternalAccess = Read;
            ExternalName = 'modifiedon';
            ExternalType = 'DateTime';
        }
        field(4;statecode;Option)
        {
            Caption = 'Status';
            Description = 'Status of the Agreement';
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
            Description = 'Reason for the status of the Agreement';
            ExternalName = 'statuscode';
            ExternalType = 'Status';
            InitValue = " ";
            OptionCaption = ' ,Active,Inactive';
            OptionOrdinalValues = -1,1,2;
            OptionMembers = " ",Active,Inactive;
        }
        field(6;VersionNumber;BigInteger)
        {
            Caption = 'Version Number';
            Description = 'Version Number';
            ExternalAccess = Read;
            ExternalName = 'versionnumber';
            ExternalType = 'BigInt';
        }
        field(7;ImportSequenceNumber;Integer)
        {
            Caption = 'Import Sequence Number';
            Description = 'Shows the sequence number of the import that created this record.';
            ExternalAccess = Insert;
            ExternalName = 'importsequencenumber';
            ExternalType = 'Integer';
        }
        field(8;OverriddenCreatedOn;Date)
        {
            Caption = 'Record Created On';
            Description = 'Shows the date and time that the record was migrated.';
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
            Description = 'Shows the time zone code that was in use when the record was created.';
            ExternalName = 'utcconversiontimezonecode';
            ExternalType = 'Integer';
            MinValue = -1;
        }
        field(11;msdyn_name;Text[100])
        {
            Caption = 'Agreement ID';
            Description = '';
            ExternalName = 'msdyn_name';
            ExternalType = 'String';
        }
        field(12;processid;Guid)
        {
            Caption = 'Process Id';
            Description = 'Contains the ID of the process associated with the entity.';
            ExternalName = 'processid';
            ExternalType = 'Uniqueidentifier';
        }
        field(13;stageid;Guid)
        {
            Caption = 'Stage Id';
            Description = 'Contains the ID of the stage where the entity is located.';
            ExternalName = 'stageid';
            ExternalType = 'Uniqueidentifier';
        }
        field(14;traversedpath;Text[250])
        {
            Caption = 'Traversed Path';
            Description = 'Shows a comma-separated list of string values that represent the unique identifiers of stages in a business process flow instance in the order that they occur.';
            ExternalName = 'traversedpath';
            ExternalType = 'String';
        }
        field(15;msdyn_AgreementDetails;BLOB)
        {
            Caption = 'Agreement Details';
            Description = 'Shows the details of this agreement, as presented to the customer';
            ExternalName = 'msdyn_agreementdetails';
            ExternalType = 'Memo';
            SubType = Memo;
        }
        field(16;msdyn_ChildIndex;Integer)
        {
            Caption = 'Child Index';
            ExternalName = 'msdyn_childindex';
            ExternalType = 'Integer';
        }
        field(17;msdyn_DateCanceled;Date)
        {
            Caption = 'Date Canceled';
            Description = 'Enter the date this agreement was canceled.';
            ExternalName = 'msdyn_datecanceled';
            ExternalType = 'DateTime';
        }
        field(18;msdyn_Description;Text[200])
        {
            Caption = 'Description';
            Description = 'Type a description of the agreement.';
            ExternalName = 'msdyn_description';
            ExternalType = 'String';
        }
        field(19;msdyn_Duration;Integer)
        {
            Caption = 'Duration';
            Description = 'Shows the duration how long this agreement is active.';
            ExternalName = 'msdyn_duration';
            ExternalType = 'Integer';
            MinValue = 0;
        }
        field(20;msdyn_EndDate;Date)
        {
            Caption = 'End Date';
            Description = 'Enter the date when this agreement is no longer active.';
            ExternalName = 'msdyn_enddate';
            ExternalType = 'DateTime';
        }
        field(21;msdyn_OriginatingAgreement;Guid)
        {
            Caption = 'Originating Agreement';
            Description = 'If this agreement originates from another agreement, you should specify the originating agreement here';
            ExternalName = 'msdyn_originatingagreement';
            ExternalType = 'Lookup';
            TableRelation = msdyn_agreement.msdyn_agreementId;
        }
        field(22;msdyn_StartDate;Date)
        {
            Caption = 'Start Date';
            Description = 'Enter the date from when this agreement is active.';
            ExternalName = 'msdyn_startdate';
            ExternalType = 'DateTime';
        }
        field(23;msdyn_SystemStatus;Option)
        {
            Caption = 'System Status';
            Description = 'Tracks the current system status.';
            ExternalName = 'msdyn_systemstatus';
            ExternalType = 'Picklist';
            InitValue = " ";
            OptionCaption = ' ,Invite EOI''s,Tender/RFP,Tender/RFP phase not needed,Opportunity (Outbound),Rejected Tender - by us,Rejected Tender - by other party,Undergoing Approval,Rejected Agreement - by us,Rejected Agreement - by other party,Agreement Approved - sent to other party,Agreement Received - awaiting our execution,Active,Active - holding over,Expired,Cancelled - by us,Cancelled - by other party,Estimate';
            OptionOrdinalValues = -1,1,2,3,4,5,6,7,8,9,10,11,690970001,13,690970002,690970003,16,690970000;
            OptionMembers = " ",InviteEOIs,"Tender/RFP","Tender/RFPphasenotneeded","Opportunity(Outbound)","RejectedTender-byus","RejectedTender-byotherparty",UndergoingApproval,"RejectedAgreement-byus","RejectedAgreement-byotherparty","AgreementApproved-senttootherparty","AgreementReceived-awaitingourexecution",Active,"Active-holdingover",Expired,"Cancelled-byus","Cancelled-byotherparty",Estimate;
        }
        field(24;msdyn_Taxable;Boolean)
        {
            Caption = 'Taxable';
            Description = 'Specify if Agreement is taxable. By default an Agreement is taxable if billing account is not tax exempt, and Agreement type is taxable. If any of the above is false it will be set to non-taxable.';
            ExternalName = 'msdyn_taxable';
            ExternalType = 'Boolean';
        }
        field(25;msdyn_OriginatingAgreementName;Text[100])
        {
            CalcFormula = Lookup(msdyn_agreement.msdyn_name WHERE (msdyn_agreementId=FIELD(msdyn_OriginatingAgreement)));
            ExternalAccess = Read;
            ExternalName = 'msdyn_originatingagreementname';
            ExternalType = 'String';
            FieldClass = FlowField;
        }
        field(26;rs_agreementname;Text[100])
        {
            Caption = 'Agreement Name';
            Description = '';
            ExternalName = 'rs_agreementname';
            ExternalType = 'String';
        }
        field(27;rs_agreementexpiryatendofterm;Boolean)
        {
            Caption = 'Agreement Expiry at end of term';
            Description = '';
            ExternalName = 'rs_agreementexpiryatendofterm';
            ExternalType = 'Boolean';
        }
        field(28;rs_contractsotherpartycontacte;Text[100])
        {
            Caption = 'Contracts Other Party Contact Email';
            Description = '';
            ExtendedDatatype = EMail;
            ExternalName = 'rs_contractsotherpartycontactemail';
            ExternalType = 'String';
        }
        field(29;rs_contractsotherpartycontactp;Text[100])
        {
            Caption = 'Contracts Other Party Contact Phone';
            Description = '';
            ExternalName = 'rs_contractsotherpartycontactphone';
            ExternalType = 'String';
        }
        field(30;rs_billtoaddressline1;Text[100])
        {
            Caption = 'Bill To Address Line 1';
            Description = '';
            ExternalName = 'rs_billtoaddressline1';
            ExternalType = 'String';
        }
        field(31;rs_billtoaddressline2;Text[100])
        {
            Caption = 'Bill To Address Line 2';
            Description = '';
            ExternalName = 'rs_billtoaddressline2';
            ExternalType = 'String';
        }
        field(32;rs_billingstartdate;Date)
        {
            Caption = 'Billing Start Date';
            Description = '';
            ExternalName = 'rs_billingstartdate';
            ExternalType = 'DateTime';
        }
        field(33;rs_billingenddate;Date)
        {
            Caption = 'Billing End Date';
            Description = '';
            ExternalName = 'rs_billingenddate';
            ExternalType = 'DateTime';
        }
        field(34;rs_billingfrequency;Option)
        {
            Caption = 'Billing Frequency';
            Description = '';
            ExternalName = 'rs_billingfrequency';
            ExternalType = 'Picklist';
            InitValue = " ";
            OptionCaption = ' ,Monthly,Bimonthly,Quarterly,Semiannually,Annually';
            OptionOrdinalValues = -1,1,2,3,4,5;
            OptionMembers = " ",Monthly,Bimonthly,Quarterly,Semiannually,Annually;
        }
        field(35;rs_cancellationdate;Date)
        {
            Caption = 'Cancellation Date';
            Description = '';
            ExternalName = 'rs_cancellationdate';
            ExternalType = 'DateTime';
        }
        field(36;rs_description;BLOB)
        {
            Caption = 'Description';
            Description = '';
            ExternalName = 'rs_description';
            ExternalType = 'Memo';
            SubType = Memo;
        }
        field(37;rs_departuresfromstandardcontr;BLOB)
        {
            Caption = 'Departures From Standard Contracts';
            Description = '';
            ExternalName = 'rs_departuresfromstandardcontracts';
            ExternalType = 'Memo';
            SubType = Memo;
        }
        field(38;rs_availablefundingperfinancia;Decimal)
        {
            Caption = 'Available Funding - per financial year';
            Description = '';
            ExternalName = 'rs_availablefundingperfinancialyear';
            ExternalType = 'Money';
        }
        field(39;ExchangeRate;Decimal)
        {
            Caption = 'Exchange Rate';
            Description = 'Exchange rate for the currency associated with the entity with respect to the base currency.';
            ExternalAccess = Read;
            ExternalName = 'exchangerate';
            ExternalType = 'Decimal';
        }
        field(40;rs_availablefundingperfinanci1;Decimal)
        {
            Caption = 'Available Funding - per financial year (Base)';
            Description = 'Value of the Available Funding - per financial year in base currency.';
            ExternalAccess = Read;
            ExternalName = 'rs_availablefundingperfinancialyear_base';
            ExternalType = 'Money';
        }
        field(41;rs_availablefundingtotal;Decimal)
        {
            Caption = 'Available Funding - total';
            Description = '';
            ExternalName = 'rs_availablefundingtotal';
            ExternalType = 'Money';
        }
        field(42;rs_availablefundingtotal_Base;Decimal)
        {
            Caption = 'Available Funding - total (Base)';
            Description = 'Value of the Available Funding - total in base currency.';
            ExternalAccess = Read;
            ExternalName = 'rs_availablefundingtotal_base';
            ExternalType = 'Money';
        }
        field(43;rs_source;Text[100])
        {
            Caption = 'Source';
            Description = '';
            ExternalName = 'rs_source';
            ExternalType = 'String';
        }
        field(44;rs_contractorcompliancestatus;Option)
        {
            Caption = 'Contractor Compliance Status';
            Description = '';
            ExternalName = 'rs_contractorcompliancestatus';
            ExternalType = 'Picklist';
            InitValue = " ";
            OptionCaption = ' ,Non-Compliant,Compliant';
            OptionOrdinalValues = -1,0,1;
            OptionMembers = " ","Non-Compliant",Compliant;
        }
        field(45;rs_doesapplicanthavetosupplyab;Boolean)
        {
            Caption = 'Does Applicant have to supply ABN';
            Description = '';
            ExternalName = 'rs_doesapplicanthavetosupplyabn';
            ExternalType = 'Boolean';
        }
        field(46;rs_bookingscreated;Boolean)
        {
            Caption = 'Bookings Created';
            Description = '';
            ExternalName = 'rs_bookingscreated';
            ExternalType = 'Boolean';
        }
        field(50;ModifiedBy;Guid)
        {
            Caption = 'Modified By';
            Description = 'Unique identifier of the user who modified the record.';
            ExternalAccess = Read;
            ExternalName = 'modifiedby';
            ExternalType = 'Lookup';
            TableRelation = "CRM Systemuser".SystemUserId;
        }
        field(100;rs_billtocustomer;Guid)
        {
            ExternalName = 'rs_billtocustomer';
            ExternalType = 'Lookup';
            TableRelation = "CRM Account";
        }
        field(101;rs_otherparty;Guid)
        {
            ExternalName = 'rs_otherparty';
            ExternalType = 'Lookup';
            TableRelation = "CRM Account";
        }
        field(102;rs_programme;Guid)
        {
            ExternalName = 'rs_programme';
            ExternalType = 'Lookup';
            TableRelation = "CRM Programme";
        }
        field(103;rs_subprogramme;Guid)
        {
            ExternalName = 'rs_subprogramme';
            ExternalType = 'Lookup';
            TableRelation = "CRM Subprogramme";
        }
        field(104;rs_navjobno;Text[100])
        {
            Caption = 'NAV Job No.';
            Description = '';
            ExternalName = 'rs_navjobno';
            ExternalType = 'String';
        }
    }

    keys
    {
        key(Key1;msdyn_agreementId)
        {
        }
        key(Key2;msdyn_name)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;msdyn_name)
        {
        }
    }
}

