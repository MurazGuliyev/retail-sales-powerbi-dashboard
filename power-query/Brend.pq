let
    Source = Excel.Workbook(File.Contents(DataSourcePath), null, true),
    Brend_Sheet = Source{[Item="Brend",Kind="Sheet"]}[Data],
    #"Changed Type" = Table.TransformColumnTypes(Brend_Sheet,{{"Column1", type text}, {"Column2", type text}}),
    #"Removed Duplicates" = Table.Distinct(#"Changed Type"),
    #"Promoted Headers" = Table.PromoteHeaders(#"Removed Duplicates", [PromoteAllScalars=true]),
    #"Changed Type1" = Table.TransformColumnTypes(#"Promoted Headers",{{"Brend_id", type text}, {"Brend_name", type text}})
in
    #"Changed Type1"
