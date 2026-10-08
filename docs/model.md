# Data model

Sales is the transaction fact table. Eight active many-to-one relationships connect it to reference tables with single-direction filtering.

| Dimension | Sales key | Dimension key |
| --- | --- | --- |
| Brend | `Brend_id` | `Brend_id` |
| Category | `Category_id` | `Category_id` |
| Cashiers | `Cashier_code` | `Cashier_code` |
| Producer | `producer_id` | `producer_id` |
| Products | `Product_id` | `Product_id` |
| Reyone | `Reyone_id` | `Reyone_id` |
| Suppliers | `Supplier_code1` | `Supplier_code1` |
| Calendar | `Date` | `Date` |

The nine imported Excel queries contain 312,406 rows in Sales. Power Query sets data types, removes unused fields and deduplicates reference tables. Calendar derives date, weekday name, day-of-month and hour from source timestamps. The active Sales relationship uses the original datetime Date field.

## Custom helper tables

- Tarix Seçimi contains three predefined April 2026 date-range labels and an order field.
- Çek aralıqları contains the five receipt-value bands, lower and upper bounds, and an order field. Its disconnected structure allows the measure to calculate receipt counts while retaining current Sales filters.

Power BI-generated local date tables are outside the custom schema listing.

The public source includes model fields and expressions, not cached business rows. The report-layout JSON was checked for source customer-card and cashier-name literals before packaging. No such literals were found.
