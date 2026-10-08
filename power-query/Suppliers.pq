let
    Source = Excel.Workbook(File.Contents(DataSourcePath), null, true),
    Suppliers_Sheet = Source{[Item="Suppliers",Kind="Sheet"]}[Data],
    #"Promoted Headers" = Table.PromoteHeaders(Suppliers_Sheet, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"Supplier_code1", type any}, {"Supplier_name1", type text}, {"Supplier_code2", type any}, {"Supplier_name2", type text}}),
    #"Removed Columns" = Table.RemoveColumns(#"Changed Type",{"Supplier_code2", "Supplier_name2"}),
    #"Removed Duplicates" = Table.Distinct(#"Removed Columns")
in
    #"Removed Duplicates"
