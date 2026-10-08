let
    Source = Excel.Workbook(File.Contents(DataSourcePath), null, true),
    Sales_Sheet = Source{[Item="Sales",Kind="Sheet"]}[Data],
    #"Promoted Headers" = Table.PromoteHeaders(Sales_Sheet, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"transaction_type", type text}, {"producer_id", type any}, {"Category_id", type text}, {"Brend_id", type text}, {"Reyone_id", Int64.Type}, {"Product_id", Int64.Type}, {"Date", type datetime}, {"Time", type datetime}, {"Barcode", Int64.Type}, {"Cek", Int64.Type}, {"Quantity", type number}, {"product_cost", type number}, {"product_price", type number}, {"Special_code", type text}, {"Supplier_code1", type any}, {"Supplier_code2", type any}, {"Customer_Card_No", type any}, {"Cashier_code", Int64.Type}}),
    #"Changed Type1" = Table.TransformColumnTypes(#"Changed Type",{{"Barcode", type text}, {"Cek", type text}, {"product_cost", Currency.Type}, {"product_price", Currency.Type}}),
    #"Removed Columns1" = Table.RemoveColumns(#"Changed Type1",{"Special_code"}),
    #"Changed Type2" = Table.TransformColumnTypes(#"Removed Columns1",{{"Customer_Card_No", type text}}),
    #"Removed Columns" = Table.RemoveColumns(#"Changed Type2",{"Time", "Supplier_code2"})
in
    #"Removed Columns"
