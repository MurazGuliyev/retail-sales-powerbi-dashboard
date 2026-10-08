# Retail Sales Analytics in Power BI

A four-page retail analytics portfolio project by **Muraz Quliyev**, built with **Power BI Desktop, Power Query and DAX**. The report covers sales performance, weekday and hourly patterns, customer card segments, receipt-value distribution and returns monitoring.

The model contains **312,406 transaction rows**, **9 imported Excel tables**, **8 active many-to-one relationships** and **2 custom calculated helper tables**.

## Report pages

| Page | Implemented analysis |
| --- | --- |
| **Overview / İcmal** | Sales KPI cards, average receipt value, distinct products, daily sales trend and top-selling categories |
| **Sales Rhythm / Satış Ritmi** | Weekday-by-hour matrix, hourly sales and weekday comparisons |
| **Basket and Cards / Səbət və Kartlar** | Card and non-card receipt comparisons, average receipt values, sales shares, receipt-value bands and a receipt-type slicer |
| **Returns / Qaytarmalar** | Return amount, return ratio, return row and receipt counts, daily return trend, top five return categories and top three returned products |

Date and department slicers support the report pages. Page navigation provides access to the four analyses.

## Work implemented

- Imported sales and reference tables from Excel with Power Query.
- Assigned text, numeric, currency and datetime types, removed unnecessary columns and removed duplicate reference records.
- Connected the Sales fact table to date/time, product, category, brand, department, cashier, producer and supplier dimensions.
- Built analytical DAX measures using `SUMX`, `CALCULATE`, `KEEPFILTERS`, `DISTINCTCOUNT`, `DIVIDE`, `SELECTEDVALUE`, `VALUES`, `ADDCOLUMNS`, `COUNTROWS`, `FILTER` and `ABS`.
- Classified transactions into card and non-card receipt types with a calculated column.
- Created five receipt-value bands: below 5, 5 to below 10, 10 to below 20, 20 to below 50, and 50 or above.
- Added a weekday order column and configured report slicers and page navigation.

## Business questions

- How do sales change across the selected period and departments?
- Which categories contribute the most sales?
- Which weekdays and hours have stronger sales?
- How do card and non-card purchases differ in receipt size and sales share?
- How are receipt amounts distributed across value bands?
- Which categories and products account for the largest return amounts?

## Technical files

| Location | Contents |
| --- | --- |
| [dax/core-measures.dax](dax/core-measures.dax) | Eleven analytical definitions used by the report |
| [dax/weekday-order.dax](dax/weekday-order.dax) | Weekday ordering calculated column |
| [dax/receipt-type.dax](dax/receipt-type.dax) | Card and non-card classification column |
| [dax/helper-tables.dax](dax/helper-tables.dax) | Date-selection and receipt-band calculated tables |
| [power-query](power-query) | Nine M queries and a portable workbook-path parameter |
| [model/relationships.json](model/relationships.json) | Eight active model relationships |
| [model/schema.json](model/schema.json) | Imported and custom calculated table metadata |
| [model/measure-inventory.json](model/measure-inventory.json) | Source inventory of all eighteen model measures, including labels and unused definitions |
| [model/report-layout.json](model/report-layout.json) | Four-page report configuration, including visuals and filters |
| [model/report-pages.json](model/report-pages.json) | Page sizes and visual type counts |
| [docs/metrics.md](docs/metrics.md) | Calculation definitions and interpretation |
| [docs/model.md](docs/model.md) | Data model and preparation steps |
| [docs/report-pages.md](docs/report-pages.md) | Detailed report page scope |

## Reviewing the project

The source files document the final submitted model and report configuration. The original business workbook and PBIX are excluded from this public package because they contain customer card identifiers, cashier names and transaction-level business data. No data rows are included in these files.

To reproduce the model, use an anonymized workbook with the source sheets and fields referenced by the M queries. Create `DataSourcePath`, import each M query, add the calculated helper tables and columns, create each analytical measure separately, and recreate the relationships. The report layout JSON is a configuration reference, not a one-click Power BI import. Screenshots and an anonymized PBIX can be added separately to demonstrate the report visually.

For portability, the original local workbook path has been replaced with `DataSourcePath`. The remaining Power Query transformations and exported DAX definitions are retained from the submitted model.

## Author

[Muraz Quliyev on GitHub](https://github.com/MurazGuliyev) · [LinkedIn](https://www.linkedin.com/in/muraz-guliyev-338299204/)
