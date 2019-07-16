// report 16035411 "NDIA Claimable Jobs List"
// {
//     // version CAREPOINT1.00

//     // CAREPOINT1.00 2017-01-01: Object created
//     DefaultLayout = RDLC;
//     RDLCLayout = './NDIA Claimable Jobs List.rdlc';

//     Caption = 'NDIA Claimable Jobs List';

//     dataset
//     {
//         dataitem(DataItem8019; "Job")
//         {
//             DataItemTableView = SORTING ("No.")
//                                 WHERE ("NDIA Claim" = CONST (true));
//             PrintOnlyIfDetail = true;
//             RequestFilterFields = "No.", "Posting Date Filter", "Planning Date Filter";
//             column(TodayFormatted; FORMAT(TODAY, 0, 4))
//             {
//             }
//             column(CompanyName; COMPANYNAME)
//             {
//             }
//             column(JobtableCaptJobFilter; TABLECAPTION + ': ' + JobFilter)
//             {
//             }
//             column(JobFilter; JobFilter)
//             {
//             }
//             column(JobTasktableCaptFilter; DataItem2969.TABLECAPTION + ': ' + JobTaskFilter)
//             {
//             }
//             column(JobTaskFilter; JobTaskFilter)
//             {
//             }
//             column(No_Job; "No.")
//             {
//             }
//             column(CurrReportPageNoCaption; CurrReportPageNoCaptionLbl)
//             {
//             }
//             column(JobAnalysisCapt; JobAnalysisCaptLbl)
//             {
//             }
//             dataitem(DataItem2969; "Job Task")
//             {
//                 DataItemLink = "Job No." = FIELD ("No.");
//                 DataItemTableView = SORTING ("Job No.", "Job Task No.");
//                 RequestFilterFields = "Job Task No.";
//                 column(HeadLineText8; HeadLineText[8])
//                 {
//                 }
//                 column(HeadLineText7; HeadLineText[7])
//                 {
//                 }
//                 column(HeadLineText6; HeadLineText[6])
//                 {
//                 }
//                 column(HeadLineText5; HeadLineText[5])
//                 {
//                 }
//                 column(HeadLineText4; HeadLineText[4])
//                 {
//                 }
//                 column(HeadLineText3; HeadLineText[3])
//                 {
//                 }
//                 column(HeadLineText2; HeadLineText[2])
//                 {
//                 }
//                 column(HeadLineText1; HeadLineText[1])
//                 {
//                 }
//                 column(Description_Job; DataItem8019.Description)
//                 {
//                 }
//                 column(DescriptionCaption; DescriptionCaptionLbl)
//                 {
//                 }
//                 column(JobTaskNoCapt; JobTaskNoCaptLbl)
//                 {
//                 }
//                 dataitem(BlankLine; "Integer")
//                 {
//                     DataItemTableView = SORTING (Number);

//                     trigger OnPreDataItem()
//                     begin
//                         SETRANGE(Number, 1, DataItem2969."No. of Blank Lines");
//                     end;
//                 }
//                 dataitem(DataItem5444; "Integer")
//                 {
//                     DataItemTableView = SORTING (Number)
//                                         WHERE (Number = CONST (1));
//                     column(JobTaskNo_JobTask; DataItem2969."Job Task No.")
//                     {
//                     }
//                     column(Indentation_JobTask; PADSTR('', 2 * DataItem2969.Indentation) + DataItem2969.Description)
//                     {
//                     }
//                     column(ShowIntBody1; DataItem2969."Job Task Type" IN [DataItem2969."Job Task Type"::Heading, DataItem2969."Job Task Type"::"Begin-Total"])
//                     {
//                     }
//                     column(Amt1; Amt[1])
//                     {
//                     }
//                     column(Amt2; Amt[2])
//                     {
//                     }
//                     column(Amt3; Amt[3])
//                     {
//                     }
//                     column(Amt4; Amt[4])
//                     {
//                     }
//                     column(Amt5; Amt[5])
//                     {
//                     }
//                     column(Amt6; Amt[6])
//                     {
//                     }
//                     column(Amt7; Amt[7])
//                     {
//                     }
//                     column(Amt8; Amt[8])
//                     {
//                     }
//                     column(ShowIntBody2; DataItem2969."Job Task Type" IN [DataItem2969."Job Task Type"::Total, DataItem2969."Job Task Type"::"End-Total"])
//                     {
//                     }
//                     column(ShowIntBody3; (DataItem2969."Job Task Type" IN [DataItem2969."Job Task Type"::Posting]) AND PrintSection)
//                     {
//                     }

//                     trigger OnAfterGetRecord()
//                     begin
//                         PrintSection := TRUE;
//                         IF ExcludeJobTask THEN BEGIN
//                             PrintSection := FALSE;
//                             FOR I := 1 TO 8 DO
//                                 IF (Amt[I] <> 0) AND (AmountField[I] <> AmountField[I] ::" ") THEN
//                                     PrintSection := TRUE;
//                         END;
//                     end;
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     CLEAR(JobCalcStatistics);
//                     JobCalcStatistics.ReportAnalysis(DataItem8019, DataItem2969, Amt, AmountField, CurrencyField, FALSE);
//                 end;
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 JobCalcStatistics.GetHeadLineText(AmountField, CurrencyField, HeadLineText, DataItem8019);
//             end;
//         }
//     }

//     requestpage
//     {
//         SaveValues = true;

//         layout
//         {
//             area(content)
//             {
//                 group(Options)
//                 {
//                     Caption = 'Options';
//                     field(AmountField[1];AmountField[1])
//                     {
//                         ApplicationArea = Jobs;
//                         Caption = 'Amount Field 1 ';
//                         OptionCaption = ' ,Budget Price,Usage Price,Billable Price,Invoiced Price,Budget Cost,Usage Cost,Billable Cost,Invoiced Cost,Budget Profit,Usage Profit,Billable Profit,Invoiced Profit';
//                         ToolTip = 'Specifies that you want to use a combination of the available Amount fields to create your own analysis. For each field, select one of the following prices, costs, or profit values: Budget, Usage, Billable, and Invoiced.';
//                     }
//                     field(CurrencyField[1];CurrencyField[1])
//                     {
//                         ApplicationArea = Jobs;
//                         Caption = 'Currency Field 1';
//                         OptionCaption = 'Local Currency,Foreign Currency';
//                         ToolTip = 'Specifies if the currency is specified in the local currency or in a foreign currency.';
//                     }
//                     field(AmountField[2];AmountField[2])
//                     {
//                         ApplicationArea = Jobs;
//                         Caption = 'Amount Field 2';
//                         OptionCaption = ' ,Budget Price,Usage Price,Billable Price,Invoiced Price,Budget Cost,Usage Cost,Billable Cost,Invoiced Cost,Budget Profit,Usage Profit,Billable Profit,Invoiced Profit';
//                         ToolTip = 'Specifies an Amount field that you use to create your own analysis. For each field, select one of the following prices, costs, or profit values: Budget, Usage, Billable, and Invoiced.';
//                     }
//                     field(CurrencyField[2];CurrencyField[2])
//                     {
//                         ApplicationArea = Jobs;
//                         Caption = 'Currency Field 2';
//                         OptionCaption = 'Local Currency,Foreign Currency';
//                         ToolTip = 'Specifies if the currency is specified in the local currency or in a foreign currency.';
//                     }
//                     field(AmountField[3];AmountField[3])
//                     {
//                         ApplicationArea = Jobs;
//                         Caption = 'Amount Field 3';
//                         OptionCaption = ' ,Budget Price,Usage Price,Billable Price,Invoiced Price,Budget Cost,Usage Cost,Billable Cost,Invoiced Cost,Budget Profit,Usage Profit,Billable Profit,Invoiced Profit';
//                         ToolTip = 'Specifies an Amount field that you use to create your own analysis. For each field, select one of the following prices, costs, or profit values: Budget, Usage, Billable, and Invoiced.';
//                     }
//                     field(CurrencyField[3];CurrencyField[3])
//                     {
//                         ApplicationArea = Jobs;
//                         Caption = 'Currency Field 1';
//                         OptionCaption = 'Local Currency,Foreign Currency';
//                         ToolTip = 'Specifies if the currency is specified in the local currency or in a foreign currency.';
//                     }
//                     field(AmountField[4];AmountField[4])
//                     {
//                         ApplicationArea = Jobs;
//                         Caption = 'Amount Field 4';
//                         OptionCaption = ' ,Budget Price,Usage Price,Billable Price,Invoiced Price,Budget Cost,Usage Cost,Billable Cost,Invoiced Cost,Budget Profit,Usage Profit,Billable Profit,Invoiced Profit';
//                         ToolTip = 'Specifies an Amount field that you use to create your own analysis. For each field, select one of the following prices, costs, or profit values: Budget, Usage, Billable, and Invoiced.';
//                     }
//                     field(CurrencyField[4];CurrencyField[4])
//                     {
//                         ApplicationArea = Jobs;
//                         Caption = 'Currency Field 2';
//                         OptionCaption = 'Local Currency,Foreign Currency';
//                         ToolTip = 'Specifies if the currency is specified in the local currency or in a foreign currency.';
//                     }
//                     field(AmountField[5];AmountField[5])
//                     {
//                         ApplicationArea = Jobs;
//                         Caption = 'Amount Field 5';
//                         OptionCaption = ' ,Budget Price,Usage Price,Billable Price,Invoiced Price,Budget Cost,Usage Cost,Billable Cost,Invoiced Cost,Budget Profit,Usage Profit,Billable Profit,Invoiced Profit';
//                         ToolTip = 'Specifies an Amount field that you use to create your own analysis. For each field, select one of the following prices, costs, or profit values: Budget, Usage, Billable, and Invoiced.';
//                     }
//                     field(CurrencyField[5];CurrencyField[5])
//                     {
//                         ApplicationArea = Jobs;
//                         Caption = 'Currency Field 1';
//                         OptionCaption = 'Local Currency,Foreign Currency';
//                         ToolTip = 'Specifies if the currency is specified in the local currency or in a foreign currency.';
//                     }
//                     field(AmountField[6];AmountField[6])
//                     {
//                         ApplicationArea = Jobs;
//                         Caption = 'Amount Field 6';
//                         OptionCaption = ' ,Budget Price,Usage Price,Billable Price,Invoiced Price,Budget Cost,Usage Cost,Billable Cost,Invoiced Cost,Budget Profit,Usage Profit,Billable Profit,Invoiced Profit';
//                         ToolTip = 'Specifies an Amount field that you use to create your own analysis. For each field, select one of the following prices, costs, or profit values: Budget, Usage, Billable, and Invoiced.';
//                     }
//                     field(CurrencyField[6];CurrencyField[6])
//                     {
//                         ApplicationArea = Jobs;
//                         Caption = 'Currency Field 2';
//                         OptionCaption = 'Local Currency,Foreign Currency';
//                         ToolTip = 'Specifies if the currency is specified in the local currency or in a foreign currency.';
//                     }
//                     field(AmountField[7];AmountField[7])
//                     {
//                         ApplicationArea = Jobs;
//                         Caption = 'Amount Field 7';
//                         OptionCaption = ' ,Budget Price,Usage Price,Billable Price,Invoiced Price,Budget Cost,Usage Cost,Billable Cost,Invoiced Cost,Budget Profit,Usage Profit,Billable Profit,Invoiced Profit';
//                         ToolTip = 'Specifies an Amount field that you use to create your own analysis. For each field, select one of the following prices, costs, or profit values: Budget, Usage, Billable, and Invoiced.';
//                     }
//                     field(CurrencyField[7];CurrencyField[7])
//                     {
//                         ApplicationArea = Jobs;
//                         Caption = 'Currency Field 1';
//                         OptionCaption = 'Local Currency,Foreign Currency';
//                         ToolTip = 'Specifies if the currency is specified in the local currency or in a foreign currency.';
//                     }
//                     field(AmountField[8];AmountField[8])
//                     {
//                         ApplicationArea = Jobs;
//                         Caption = 'Amount Field 8';
//                         OptionCaption = ' ,Budget Price,Usage Price,Billable Price,Invoiced Price,Budget Cost,Usage Cost,Billable Cost,Invoiced Cost,Budget Profit,Usage Profit,Billable Profit,Invoiced Profit';
//                         ToolTip = 'Specifies an Amount field that you use to create your own analysis. For each field, select one of the following prices, costs, or profit values: Budget, Usage, Billable, and Invoiced.';
//                     }
//                     field(CurrencyField[8];CurrencyField[8])
//                     {
//                         ApplicationArea = Jobs;
//                         Caption = 'Currency Field 2';
//                         OptionCaption = 'Local Currency,Foreign Currency';
//                         ToolTip = 'Specifies if the currency is specified in the local currency or in a foreign currency.';
//                     }
//                     field(ExcludeJobTask;ExcludeJobTask)
//                     {
//                         ApplicationArea = Jobs;
//                         Caption = 'Exclude Zero-Lines';
//                         MultiLine = true;
//                         ToolTip = 'Specifies that lines with zero content are excluded from the view.';
//                     }
//                 }
//             }
//         }

//         actions
//         {
//         }
//     }

//     labels
//     {
//     }

//     trigger OnPreReport()
//     begin
//         JobFilter := Job.GETFILTERS;
//         JobTaskFilter := DataItem2969.GETFILTERS;
//     end;

//     var
//         JobCalcStatistics: Codeunit "Job Calculate Statistics";
//         HeadLineText: array [8] of Text[50];
//         Amt: array [8] of Decimal;
//         AmountField: array [8] of Option " ","Budget Price","Usage Price","Billable Price","Invoiced Price","Budget Cost","Usage Cost","Billable Cost","Invoiced Cost","Budget Profit","Usage Profit","Billable Profit","Invoiced Profit";
//         CurrencyField: array [8] of Option "Local Currency","Foreign Currency";
//         JobFilter: Text;
//         JobTaskFilter: Text;
//         ExcludeJobTask: Boolean;
//         PrintSection: Boolean;
//         I: Integer;
//         CurrReportPageNoCaptionLbl: Label 'Page';
//         JobAnalysisCaptLbl: Label 'Job Analysis';
//         DescriptionCaptionLbl: Label 'Description';
//         JobTaskNoCaptLbl: Label 'Job Task No.';

//     procedure InitializeRequest(NewAmountField: array [8] of Option " ","Budget Price","Usage Price","Billable Price","Invoiced Price","Budget Cost","Usage Cost","Billable Cost","Invoiced Cost","Budget Profit","Usage Profit","Billable Profit","Invoiced Profit";NewCurrencyField: array [8] of Option "Local Currency","Foreign Currency";NewExcludeJobTask: Boolean)
//     begin
//         AmountField[1] := NewAmountField[1];
//         CurrencyField[1] := NewCurrencyField[1];
//         AmountField[2] := NewAmountField[2];
//         CurrencyField[2] := NewCurrencyField[2];
//         AmountField[3] := NewAmountField[3];
//         CurrencyField[3] := NewCurrencyField[3];
//         AmountField[4] := NewAmountField[4];
//         CurrencyField[4] := NewCurrencyField[4];
//         AmountField[5] := NewAmountField[5];
//         CurrencyField[5] := NewCurrencyField[5];
//         AmountField[6] := NewAmountField[6];
//         CurrencyField[6] := NewCurrencyField[6];
//         AmountField[7] := NewAmountField[7];
//         CurrencyField[7] := NewCurrencyField[7];
//         AmountField[8] := NewAmountField[8];
//         CurrencyField[8] := NewCurrencyField[8];
//         ExcludeJobTask := NewExcludeJobTask;
//     end;
// }

