let
    Source = Excel.Workbook(File.Contents(DataSourcePath), null, true),
    Category_Sheet = Source{[Item="Category",Kind="Sheet"]}[Data],
    #"Changed Type" = Table.TransformColumnTypes(Category_Sheet,{{"Column1", type text}, {"Column2", type text}}),
    #"Promoted Headers" = Table.PromoteHeaders(#"Changed Type", [PromoteAllScalars=true]),
    #"Changed Type1" = Table.TransformColumnTypes(#"Promoted Headers",{{"Category_id", type text}, {"Category_name", type text}}),
    #"Removed Duplicates" = Table.Distinct(#"Changed Type1")
in
    #"Removed Duplicates"
