report 50511 AGT_Report_G
{
    RDLCLayout = './salesHeadre.rdl';
    DefaultLayout = RDLC;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'SalesheaderG';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = sorting("No.") where("Document Type" = filter(Order));
            RequestFilterFields = "No.";

            column(OrderNo; "No.") { }
            column(CustomerName; "Sell-to Customer Name") { }
            column(External_Document_No_; "External Document No.") { }

            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document Type" = field("Document Type"),
                               "Document No." = field("No.");

                column(Line_No; "Line No.") { }
                column(Item_No_; "No.") { }
                column(Description; Description) { }
                column(Quantity; Quantity) { }
                column(UnitPrice; "Unit Price") { }
                column(ShippedQty; ShippedQty) { }
                column(InvoicedQty; InvoicedQty) { }
                column(ShippedAmount; ShippedAmount) { }
                column(InvoicedAmount; InvoicedAmount) { }

                trigger OnAfterGetRecord()
                begin

                    ShippedQty := 0;
                    InvoicedQty := 0;
                    ShippedAmount := 0;
                    InvoicedAmount := 0;


                    SalesShptLine.Reset();
                    SalesShptLine.SetRange("Order No.", "Sales Line"."Document No.");
                    SalesShptLine.SetRange("No.", "Sales Line"."No.");
                    if SalesShptLine.FindSet() then
                        repeat
                            ShippedQty += SalesShptLine.Quantity;
                        until SalesShptLine.Next() = 0;


                    SalesInvLine.Reset();
                    SalesInvLine.SetRange("Order No.", "Sales Line"."Document No.");
                    SalesInvLine.SetRange("No.", "Sales Line"."No.");
                    if SalesInvLine.FindSet() then
                        repeat
                            InvoicedQty += SalesInvLine.Quantity;
                            InvoicedAmount := InvoicedQty * "Unit Price";
                        until SalesInvLine.Next() = 0;


                    ShippedAmount := ShippedQty * "Unit Price";

                end;
            }
        }
    }

    var
        ShippedQty: Decimal;
        InvoicedQty: Decimal;
        ShippedAmount: Decimal;
        InvoicedAmount: Decimal;
        SalesShptLine: Record "Sales Shipment Line";
        SalesInvLine: Record "Sales Invoice Line";
}
