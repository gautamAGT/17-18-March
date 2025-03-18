// reportextension 50501 "AGT_Gautam" extends "Standard Sales - Invoice"
// {
//     RDLCLayout = './triggerExtension.rdl';
//     dataset
//     {
//         // Add changes to dataitems and columns here
//         add(header)
//         {
//             column(TotalAmount; TotalAmount)
//             {
//                 Caption = 'Total Amount';
//             }
//         }
//         modify(header)
//         {

//             trigger OnBeforePreDataItem()
//             var
//                 myInt: Integer;
//             begin
//                 Message('OnBeforePreDataItem Report');
//             end;

//             trigger OnAfterPreDataItem()
//             var
//                 myInt: Integer;
//             begin
//                 Message('OnAfterPreDataItem Report');
//             end;

//             trigger OnAfterAfterGetRecord()
//             var
//                 myInt: Integer;
//             begin
//                 Message('OnAfterAfterGetRecord Report');
//             end;

//             trigger OnBeforeAfterGetRecord()
//             var
//                 myInt: Integer;
//             begin
//                 Message('OnBeforeAfterGetRecord Report');
//             end;


//             trigger OnBeforePostDataItem()
//             var
//                 myInt: Integer;
//             begin
//                 Message('OnBeforePostDataItem Report');
//             end;


//             trigger OnAfterPostDataItem()
//             var
//                 myInt: Integer;
//             begin
//                 Message('OnAfterPostDataItem Report');
//             end;



//         }
//     }

//     trigger OnPostReport()
//     var
//         myInt: Integer;
//     begin
//         Message(('Post Report'));
//     end;


//     trigger OnPreReport()
//     var
//         myInt: Integer;
//     begin
//         Message(('Pre Report'));
//     end;
// }