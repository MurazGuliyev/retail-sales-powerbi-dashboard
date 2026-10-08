let
    Source = Excel.Workbook(File.Contents(DataSourcePath), null, true),
    Cashiers_Sheet = Source{[Item="Cashiers",Kind="Sheet"]}[Data],
    #"Promoted Headers" = Table.PromoteHeaders(Cashiers_Sheet, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"Cashier_code", Int64.Type}, {"Cashier_name", type text}}),
    #"Removed Duplicates" = Table.Distinct(#"Changed Type")
in
    #"Removed Duplicates"
