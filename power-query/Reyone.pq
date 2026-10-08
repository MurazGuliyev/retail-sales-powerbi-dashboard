let
    Source = Excel.Workbook(File.Contents(DataSourcePath), null, true),
    Reyone_Sheet = Source{[Item="Reyone",Kind="Sheet"]}[Data],
    #"Promoted Headers" = Table.PromoteHeaders(Reyone_Sheet, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"Reyone_id", Int64.Type}, {"Reyone_name", type text}}),
    #"Removed Duplicates" = Table.Distinct(#"Changed Type")
in
    #"Removed Duplicates"
