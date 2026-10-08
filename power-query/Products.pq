let
    Source = Excel.Workbook(File.Contents(DataSourcePath), null, true),
    Products_Sheet = Source{[Item="Products",Kind="Sheet"]}[Data],
    #"Promoted Headers" = Table.PromoteHeaders(Products_Sheet, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"Product_id", Int64.Type}, {"Product_name", type text}, {"Unit", type text}, {"Special_code2", type any}, {"Special_code3", type text}, {"Special_code4", type text}, {"Special_code5", type text}, {"VAT_Department_No", Int64.Type}}),
    #"Removed Columns" = Table.RemoveColumns(#"Changed Type",{"Special_code2", "Special_code3", "Special_code4", "Special_code5", "VAT_Department_No"}),
    #"Removed Duplicates" = Table.Distinct(#"Removed Columns")
in
    #"Removed Duplicates"
