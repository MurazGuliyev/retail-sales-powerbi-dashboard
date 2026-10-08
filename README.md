# Retail Sales Analytics in Power BI

A retail analytics portfolio project built by **Muraz Quliyev** using **Power BI Desktop, Power Query and DAX**. The report supports sales monitoring, category analysis and weekday-by-hour analysis.

The model contains **312,406 sales transaction rows**, **9 imported Excel tables** and **8 active many-to-one relationships** connecting `Sales` to its dimensions.

## Work implemented

- Imported Excel sales and reference tables with Power Query.
- Promoted headers, assigned data types, removed unnecessary columns and removed duplicate records from reference tables.
- Built a fact-and-dimension model with date/time, product, category, brand, department, cashier, producer and supplier dimensions.
- Created DAX measures for signed sales amount, positive sales amount, average receipt value and distinct products sold.
- Built the **Overview / İcmal** page with sales KPI cards, a daily sales trend and category sales comparisons.
- Built the **Sales Rhythm / Satış ritmi** page with a weekday-by-hour sales matrix, hourly sales and weekday comparisons.
- Added date and department slicers and navigation between report pages.
- Added a weekday order column for chronological weekday presentation.

## Business questions

- How do sales change during the selected period?
- Which product categories contribute the most sales?
- Which weekdays and hours generate stronger sales?
- What is the average receipt value for positive sales transactions?

## Technical files

| Location | Contents |
| --- | --- |
| [dax/core-measures.dax](dax/core-measures.dax) | Four implemented analytical measure definitions |
| [dax/weekday-order.dax](dax/weekday-order.dax) | Weekday ordering calculated column |
| [power-query](power-query) | Nine M queries and a portable workbook-path parameter |
| [model/relationships.json](model/relationships.json) | Active model relationships |
| [model/schema.json](model/schema.json) | Imported table and column metadata |
| [docs/metrics.md](docs/metrics.md) | Metric definitions and their interpretation |
| [docs/model.md](docs/model.md) | Model structure and preparation steps |
| [docs/report-pages.md](docs/report-pages.md) | Report page scope and next additions |

## Reviewing the implementation

The DAX and M files document the implementation without requiring access to the original business workbook. The original dataset and PBIX are excluded from this public source package because they contain customer card identifiers, cashier names and transaction records.

To reproduce the model, use an anonymized workbook with the sheet names and source fields referenced by the M queries. Set `DataSourcePath` to that workbook, create each M query separately in Power BI Desktop, recreate the relationships in `model/relationships.json`, and add the DAX definitions separately. Source values, screenshots and the report layout are not bundled, so this package documents the implementation rather than reproducing the visual report in one click.

The original local workbook path has been replaced with a reusable `DataSourcePath` parameter for this public package. The remaining transformation steps and the exported DAX expressions are retained from the supplied model.

## Next additions

Expand the basket and card analysis and the dedicated returns-monitoring page. These are additional report sections and are not presented as completed analyses in this version.

## Author

[Muraz Quliyev on GitHub](https://github.com/MurazGuliyev) · [LinkedIn](https://www.linkedin.com/in/muraz-guliyev-338299204/)
