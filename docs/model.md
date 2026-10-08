# Data model

`Sales` is the transaction fact table. Eight active many-to-one relationships link it to reference tables. All exported relationships use single-direction filtering.

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

The imported model has nine Excel source queries. Power Query sets text, numeric, currency and datetime types, removes unused fields, and deduplicates reference tables. The Calendar query derives date, weekday name, day-of-month and hour fields from the source timestamps. Its relationship to Sales uses the original datetime `Date` field.

The model also contains a disconnected `Tarix Seçimi` table and Power BI-generated date tables. They are outside the nine imported source tables documented here.

Customer card and cashier column names appear in the schema as model metadata. No customer identifiers, employee names or transaction rows are included in this source package.
