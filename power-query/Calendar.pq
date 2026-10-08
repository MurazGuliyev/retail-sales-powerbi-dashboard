let
    Source = Excel.Workbook(File.Contents(DataSourcePath), null, true),
    Calendar_Sheet = Source{[Item="Calendar",Kind="Sheet"]}[Data],
    #"Promoted Headers" = Table.PromoteHeaders(Calendar_Sheet, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"Date", type datetime}, {"Time", type datetime}}),
    #"Removed Columns" = Table.RemoveColumns(#"Changed Type",{"Time"}),
    #"Removed Duplicates" = Table.Distinct(#"Removed Columns"),
    #"Inserted Date" = Table.AddColumn(#"Removed Duplicates", "Date.1", each DateTime.Date([Date]), type date),
    #"Inserted Day of Week" = Table.AddColumn(#"Inserted Date", "Day of Week", each Date.DayOfWeek([Date.1]), Int64.Type),
    #"Inserted Days in Month" = Table.AddColumn(#"Inserted Day of Week", "Days in Month", each Date.DaysInMonth([Date.1]), Int64.Type),
    #"Removed Columns1" = Table.RemoveColumns(#"Inserted Days in Month",{"Days in Month"}),
    #"Inserted Day Name" = Table.AddColumn(#"Removed Columns1", "Day Name", each Date.DayOfWeekName([Date]), type text),
    #"Inserted Days in Month1" = Table.AddColumn(#"Inserted Day Name", "Days in Month", each Date.DaysInMonth([Date.1]), Int64.Type),
    #"Removed Columns2" = Table.RemoveColumns(#"Inserted Days in Month1",{"Days in Month", "Day of Week"}),
    #"Inserted Day" = Table.AddColumn(#"Removed Columns2", "Day", each Date.Day([Date.1]), Int64.Type),
    #"Inserted Hour" = Table.AddColumn(#"Inserted Day", "Hour", each Time.Hour([Date]), Int64.Type)
in
    #"Inserted Hour"
