let
    Source = Excel.Workbook(File.Contents(DataSourcePath), null, true),
    Producer_Sheet = Source{[Item="Producer",Kind="Sheet"]}[Data],
    #"Promoted Headers" = Table.PromoteHeaders(Producer_Sheet, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"producer_id", type any}, {"producer_name", type text}}),
    #"Removed Duplicates" = Table.Distinct(#"Changed Type")
in
    #"Removed Duplicates"
