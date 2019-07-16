table 16035504 msdyn_workorderservice
{
    // version CAREPOINT1.00

    // Dynamics CRM Version: 8.2.2.135

    Caption = 'Work Order Service';
    Description = 'Record all services proposed and performed for work order';
    ExternalName = 'msdyn_workorderservice';
    TableType = CRM;

    fields
    {
        field(1;msdyn_workorderserviceId;Guid)
        {
            Caption = 'Work Order Service';
            Description = 'Shows the entity instances.';
            ExternalAccess = Insert;
            ExternalName = 'msdyn_workorderserviceid';
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
            Description = 'Status of the Work Order Service';
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
            Description = 'Reason for the status of the Work Order Service';
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
        field(11;msdyn_name;Text[200])
        {
            Caption = 'Name';
            Description = 'Enter the name of the custom entity.';
            ExternalName = 'msdyn_name';
            ExternalType = 'String';
        }
        field(12;msdyn_AdditionalCost;Decimal)
        {
            Caption = 'Additional Cost';
            Description = 'Enter any additional costs associated with this service. The values are manually entered. Note: additional cost is not unit dependent.';
            ExternalName = 'msdyn_additionalcost';
            ExternalType = 'Money';
        }
        field(13;ExchangeRate;Decimal)
        {
            Caption = 'Exchange Rate';
            Description = 'Shows the exchange rate for the currency associated with the entity with respect to the base currency.';
            ExternalAccess = Read;
            ExternalName = 'exchangerate';
            ExternalType = 'Decimal';
        }
        field(14;msdyn_additionalcost_Base;Decimal)
        {
            Caption = 'Additional Cost (Base)';
            Description = 'Shows the value of the additional cost in the base currency.';
            ExternalAccess = Read;
            ExternalName = 'msdyn_additionalcost_base';
            ExternalType = 'Money';
        }
        field(15;msdyn_CalculatedUnitAmount;Decimal)
        {
            Caption = 'Calculated Unit Amount';
            Description = 'Shows the sale amount per unit calculated by the system considering the minimum charge, if applicable.';
            ExternalName = 'msdyn_calculatedunitamount';
            ExternalType = 'Money';
        }
        field(16;msdyn_calculatedunitamount_Bas;Decimal)
        {
            Caption = 'Calculated Unit Amount (Base)';
            Description = 'Shows the value of the calculated unit amount in the base currency.';
            ExternalAccess = Read;
            ExternalName = 'msdyn_calculatedunitamount_base';
            ExternalType = 'Money';
        }
        field(17;msdyn_CommissionCosts;Decimal)
        {
            Caption = 'Commission Costs';
            Description = 'Enter the commission costs associated with this service. The value is manually specified and isn''t automatically calculated.';
            ExternalName = 'msdyn_commissioncosts';
            ExternalType = 'Money';
        }
        field(18;msdyn_commissioncosts_Base;Decimal)
        {
            Caption = 'Commission Costs (Base)';
            Description = 'Shows the value of the commission costs in the base currency.';
            ExternalAccess = Read;
            ExternalName = 'msdyn_commissioncosts_base';
            ExternalType = 'Money';
        }
        field(19;msdyn_Description;BLOB)
        {
            Caption = 'Description';
            Description = 'Enter the description of the service as presented to the customer. The value defaults to the description defined on the service.';
            ExternalName = 'msdyn_description';
            ExternalType = 'Memo';
            SubType = Memo;
        }
        field(20;msdyn_DiscountAmount;Decimal)
        {
            Caption = 'Discount Amount';
            Description = 'Specify any discount amount on this service. Note: If you enter a discount amount you cannot enter a discount %';
            ExternalName = 'msdyn_discountamount';
            ExternalType = 'Money';
        }
        field(21;msdyn_discountamount_Base;Decimal)
        {
            Caption = 'Discount Amount (Base)';
            Description = 'Shows the value of the discount Amount in the base currency.';
            ExternalAccess = Read;
            ExternalName = 'msdyn_discountamount_base';
            ExternalType = 'Money';
        }
        field(22;msdyn_DiscountPercent;Decimal)
        {
            Caption = 'Discount %';
            Description = 'Specify any discount % on this service. Note: If you enter a discount % it will overwrite the discount $';
            ExternalName = 'msdyn_discountpercent';
            ExternalType = 'Double';
        }
        field(23;msdyn_Duration;Integer)
        {
            Caption = 'Duration';
            Description = 'Shows the actual duration of service.';
            ExternalName = 'msdyn_duration';
            ExternalType = 'Integer';
            MinValue = 0;
        }
        field(24;msdyn_DurationToBill;Integer)
        {
            Caption = 'Duration To Bill';
            Description = 'Enter the quantity you wish to bill the customer for. By default, this will default to the same value as "Quantity."';
            ExternalName = 'msdyn_durationtobill';
            ExternalType = 'Integer';
            MinValue = 0;
        }
        field(25;msdyn_EstimateCalculatedUnitAm;Decimal)
        {
            Caption = 'Estimate Calculated Unit Amount';
            Description = 'Shows the estimated sale amount per unit calculated by the system considering the initial charge (if applicable).';
            ExternalName = 'msdyn_estimatecalculatedunitamount';
            ExternalType = 'Money';
        }
        field(26;msdyn_estimatecalculatedunita1;Decimal)
        {
            Caption = 'Estimate Calculated Unit Amount (Base)';
            Description = 'Shows the value of the estimate calculated unit amount in the base currency.';
            ExternalAccess = Read;
            ExternalName = 'msdyn_estimatecalculatedunitamount_base';
            ExternalType = 'Money';
        }
        field(27;msdyn_EstimateDiscountAmount;Decimal)
        {
            Caption = 'Estimate Discount Amount';
            Description = 'Enter a discount amount on the subtotal amount. Note: If you enter a discount amount you cannot enter a discount %';
            ExternalName = 'msdyn_estimatediscountamount';
            ExternalType = 'Money';
        }
        field(28;msdyn_estimatediscountamount_B;Decimal)
        {
            Caption = 'Estimate Discount Amount (Base)';
            Description = 'Shows the value of the estimate discount amount in the base currency.';
            ExternalAccess = Read;
            ExternalName = 'msdyn_estimatediscountamount_base';
            ExternalType = 'Money';
        }
        field(29;msdyn_EstimateDiscountPercent;Decimal)
        {
            Caption = 'Estimate Discount %';
            Description = 'Enter a discount % on the subtotal amount. Note: If you enter a discount % it will overwrite the discount $';
            ExternalName = 'msdyn_estimatediscountpercent';
            ExternalType = 'Double';
        }
        field(30;msdyn_EstimateDuration;Integer)
        {
            Caption = 'Estimate Duration';
            Description = 'Enter the estimated duration of this service.';
            ExternalName = 'msdyn_estimateduration';
            ExternalType = 'Integer';
            MinValue = 0;
        }
        field(31;msdyn_EstimateSubtotal;Decimal)
        {
            Caption = 'Estimate Subtotal';
            Description = 'Shows the total amount for this service, excluding discounts.';
            ExternalName = 'msdyn_estimatesubtotal';
            ExternalType = 'Money';
        }
        field(32;msdyn_estimatesubtotal_Base;Decimal)
        {
            Caption = 'Estimate Subtotal (Base)';
            Description = 'Shows the value of the estimate subtotal in the base currency.';
            ExternalAccess = Read;
            ExternalName = 'msdyn_estimatesubtotal_base';
            ExternalType = 'Money';
        }
        field(33;msdyn_EstimateTotalAmount;Decimal)
        {
            Caption = 'Estimate Total Amount';
            Description = 'Shows the estimated total amount of this service, including discounts.';
            ExternalName = 'msdyn_estimatetotalamount';
            ExternalType = 'Money';
        }
        field(34;msdyn_estimatetotalamount_Base;Decimal)
        {
            Caption = 'Estimate Total Amount (Base)';
            Description = 'Shows the value of the estimate total amount in the base currency.';
            ExternalAccess = Read;
            ExternalName = 'msdyn_estimatetotalamount_base';
            ExternalType = 'Money';
        }
        field(35;msdyn_EstimateTotalCost;Decimal)
        {
            Caption = 'Estimate Total Cost';
            Description = 'Shows the estimated total cost of this service.';
            ExternalName = 'msdyn_estimatetotalcost';
            ExternalType = 'Money';
        }
        field(36;msdyn_estimatetotalcost_Base;Decimal)
        {
            Caption = 'Estimate Total Cost (Base)';
            Description = 'Shows the value of the estimate total cost in the base currency.';
            ExternalAccess = Read;
            ExternalName = 'msdyn_estimatetotalcost_base';
            ExternalType = 'Money';
        }
        field(37;msdyn_EstimateUnitAmount;Decimal)
        {
            Caption = 'Estimate Unit Amount';
            Description = 'Shows the estimated sale amount per unit.';
            ExternalName = 'msdyn_estimateunitamount';
            ExternalType = 'Money';
        }
        field(38;msdyn_estimateunitamount_Base;Decimal)
        {
            Caption = 'Estimate Unit Amount (Base)';
            Description = 'Shows the value of the estimate unit amount in the base currency.';
            ExternalAccess = Read;
            ExternalName = 'msdyn_estimateunitamount_base';
            ExternalType = 'Money';
        }
        field(39;msdyn_EstimateUnitCost;Decimal)
        {
            Caption = 'Estimate Unit Cost';
            Description = 'Shows the estimated cost amount per unit.';
            ExternalName = 'msdyn_estimateunitcost';
            ExternalType = 'Money';
        }
        field(40;msdyn_estimateunitcost_Base;Decimal)
        {
            Caption = 'Estimate Unit Cost (Base)';
            Description = 'Shows the value of the estimate unit cost in the base currency.';
            ExternalAccess = Read;
            ExternalName = 'msdyn_estimateunitcost_base';
            ExternalType = 'Money';
        }
        field(41;msdyn_InternalDescription;BLOB)
        {
            Caption = 'Internal Description';
            Description = 'Enter any internal notes you want to track on this service.';
            ExternalName = 'msdyn_internaldescription';
            ExternalType = 'Memo';
            SubType = Memo;
        }
        field(42;msdyn_InternalFlags;BLOB)
        {
            Caption = 'Internal Flags';
            Description = '';
            ExternalName = 'msdyn_internalflags';
            ExternalType = 'Memo';
            SubType = Memo;
        }
        field(43;msdyn_LineOrder;Integer)
        {
            Caption = 'Line Order';
            ExternalName = 'msdyn_lineorder';
            ExternalType = 'Integer';
        }
        field(44;msdyn_LineStatus;Option)
        {
            Caption = 'Line Status';
            Description = 'Enter the current status of the line, estimate or used.';
            ExternalName = 'msdyn_linestatus';
            ExternalType = 'Picklist';
            InitValue = Estimated;
            OptionCaption = 'Estimated,Used';
            OptionOrdinalValues = 690970000,690970001;
            OptionMembers = Estimated,Used;
        }
        field(45;msdyn_MinimumChargeAmount;Decimal)
        {
            Caption = 'Minimum Charge Amount';
            Description = 'Enter the amount charged as a minimum charge.';
            ExternalName = 'msdyn_minimumchargeamount';
            ExternalType = 'Money';
        }
        field(46;msdyn_minimumchargeamount_Base;Decimal)
        {
            Caption = 'Minimum Charge Amount (Base)';
            Description = 'Shows the value of the minimum charge amount in the base currency.';
            ExternalAccess = Read;
            ExternalName = 'msdyn_minimumchargeamount_base';
            ExternalType = 'Money';
        }
        field(47;msdyn_MinimumChargeDuration;Integer)
        {
            Caption = 'Minimum Charge Duration';
            Description = 'Enter the duration of up to how long the minimum charge applies.';
            ExternalName = 'msdyn_minimumchargeduration';
            ExternalType = 'Integer';
            MinValue = 0;
        }
        field(48;msdyn_Subtotal;Decimal)
        {
            Caption = 'Subtotal';
            Description = 'Enter the total amount excluding discounts.';
            ExternalName = 'msdyn_subtotal';
            ExternalType = 'Money';
        }
        field(49;msdyn_subtotal_Base;Decimal)
        {
            Caption = 'Subtotal (Base)';
            Description = 'Shows the value of the subtotal in the base currency.';
            ExternalAccess = Read;
            ExternalName = 'msdyn_subtotal_base';
            ExternalType = 'Money';
        }
        field(50;msdyn_Taxable;Boolean)
        {
            Caption = 'Taxable';
            Description = 'Specify if service is taxable. If you do not wish to charge tax set this field to No.';
            ExternalName = 'msdyn_taxable';
            ExternalType = 'Boolean';
        }
        field(51;msdyn_TotalAmount;Decimal)
        {
            Caption = 'Total Amount';
            ExternalName = 'msdyn_totalamount';
            ExternalType = 'Money';
        }
        field(52;msdyn_totalamount_Base;Decimal)
        {
            Caption = 'Total Amount (Base)';
            Description = 'Shows the value of the total amount in the base currency.';
            ExternalAccess = Read;
            ExternalName = 'msdyn_totalamount_base';
            ExternalType = 'Money';
        }
        field(53;msdyn_TotalCost;Decimal)
        {
            Caption = 'Total Cost';
            Description = 'Shows the total cost of this service. This is calculated by (Unit Cost * Units) + Additional Cost + Commission Costs.';
            ExternalName = 'msdyn_totalcost';
            ExternalType = 'Money';
        }
        field(54;msdyn_totalcost_Base;Decimal)
        {
            Caption = 'Total Cost (Base)';
            Description = 'Shows the value of the total cost in the base currency.';
            ExternalAccess = Read;
            ExternalName = 'msdyn_totalcost_base';
            ExternalType = 'Money';
        }
        field(55;msdyn_UnitAmount;Decimal)
        {
            Caption = 'Unit Amount';
            Description = 'Enter the amount you want to charge the customer per unit. By default, this is calculated based on the selected price list. The amount can be changed.';
            ExternalName = 'msdyn_unitamount';
            ExternalType = 'Money';
        }
        field(56;msdyn_unitamount_Base;Decimal)
        {
            Caption = 'Unit Amount (Base)';
            Description = 'Shows the value of the unit amount in the base currency.';
            ExternalAccess = Read;
            ExternalName = 'msdyn_unitamount_base';
            ExternalType = 'Money';
        }
        field(57;msdyn_UnitCost;Decimal)
        {
            Caption = 'Unit Cost';
            Description = 'Shows the actual cost per unit.';
            ExternalName = 'msdyn_unitcost';
            ExternalType = 'Money';
        }
        field(58;msdyn_unitcost_Base;Decimal)
        {
            Caption = 'Unit Cost (Base)';
            Description = 'Shows the value of the unit cost in the base currency.';
            ExternalAccess = Read;
            ExternalName = 'msdyn_unitcost_base';
            ExternalType = 'Money';
        }
        field(59;msdyn_WorkOrder;Guid)
        {
            Caption = 'Work Order';
            Description = 'The work order this service relates to';
            ExternalName = 'msdyn_workorder';
            ExternalType = 'Lookup';
            TableRelation = msdyn_workorder.msdyn_workorderId;
        }
        field(60;msdyn_WorkOrderName;Text[100])
        {
            CalcFormula = Lookup(msdyn_workorder.msdyn_name WHERE (msdyn_workorderId=FIELD(msdyn_WorkOrder)));
            ExternalAccess = Read;
            ExternalName = 'msdyn_workordername';
            ExternalType = 'String';
            FieldClass = FlowField;
        }
        field(61;rs_servicetype;Option)
        {
            Caption = 'Service Type';
            Description = '';
            ExternalName = 'rs_servicetype';
            ExternalType = 'Picklist';
            InitValue = " ";
            OptionCaption = ' ,Correspondence,Email,F2F,File,Phone,Support Meeting';
            OptionOrdinalValues = -1,1,2,3,4,5,6;
            OptionMembers = " ",Correspondence,Email,F2F,File,Phone,SupportMeeting;
        }
        field(62;rs_date;Date)
        {
            Caption = 'Date';
            Description = '';
            ExternalName = 'rs_date';
            ExternalType = 'DateTime';
        }
        field(63;rs_clientnumber;Text[100])
        {
            Caption = 'Client Number';
            Description = '';
            ExternalName = 'rs_clientnumber';
            ExternalType = 'String';
        }
        field(64;rs_ndisnumber;Text[100])
        {
            Caption = 'NDIS Number';
            Description = '';
            ExternalName = 'rs_ndisnumber';
            ExternalType = 'String';
        }
        field(65;rs_weeknumber;Text[100])
        {
            Caption = 'Week Number';
            Description = '';
            ExternalName = 'rs_weeknumber';
            ExternalType = 'String';
        }
        field(66;rs_planstartdate;Date)
        {
            Caption = 'Plan Start Date';
            Description = '';
            ExternalName = 'rs_planstartdate';
            ExternalType = 'DateTime';
        }
        field(67;rs_planreviewdate;Date)
        {
            Caption = 'Plan Review Date';
            Description = '';
            ExternalName = 'rs_planreviewdate';
            ExternalType = 'DateTime';
        }
        field(68;rs_agreement;Guid)
        {
            Caption = 'Agreement';
            Description = '';
            ExternalName = 'rs_agreement';
            ExternalType = 'Lookup';
            TableRelation = msdyn_agreement.msdyn_agreementId;
        }
        field(69;rs_agreementName;Text[100])
        {
            CalcFormula = Lookup(msdyn_agreement.msdyn_name WHERE (msdyn_agreementId=FIELD(rs_agreement)));
            ExternalAccess = Read;
            ExternalName = 'rs_agreementname';
            ExternalType = 'String';
            FieldClass = FlowField;
        }
        field(70;rs_agreementbooking;Guid)
        {
            Caption = 'Agreement Booking';
            Description = '';
            ExternalName = 'rs_agreementbooking';
            ExternalType = 'Lookup';
            TableRelation = msdyn_agreementbookingsetup.msdyn_agreementbookingsetupId;
        }
        field(71;rs_agreementbookingName;Text[100])
        {
            CalcFormula = Lookup(msdyn_agreementbookingsetup.msdyn_name WHERE (msdyn_agreementbookingsetupId=FIELD(rs_agreementbooking)));
            ExternalAccess = Read;
            ExternalName = 'rs_agreementbookingname';
            ExternalType = 'String';
            FieldClass = FlowField;
        }
        field(72;rs_purchaseinvoiceno;Text[100])
        {
            Caption = 'Purchase Invoice No';
            Description = '';
            ExternalName = 'rs_purchaseinvoiceno';
            ExternalType = 'String';
        }
        field(73;rs_salesinvoiceno;Text[100])
        {
            Caption = 'Sales Invoice No';
            Description = '';
            ExternalName = 'rs_salesinvoiceno';
            ExternalType = 'String';
        }
        field(150;ModifiedBy;Guid)
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
        key(Key1;msdyn_workorderserviceId)
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

