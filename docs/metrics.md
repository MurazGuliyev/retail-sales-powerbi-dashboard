# Metric definitions

The source listing in `dax/core-measures.dax` contains the analytical measures used by the four report pages.

| Measure | Interpretation |
| --- | --- |
| `Satış` | Signed sales amount: sum of Quantity multiplied by product_price in the current filter context. Negative quantities affect this amount. |
| `Müsbət satış` | Sales amount restricted to positive-quantity transaction rows. |
| `Ort_Sebet` | Positive sales amount divided by the distinct receipt count for positive-quantity rows. |
| `Satılan mehsul sayi` | Distinct product count for positive-quantity rows; this does not sum units sold. |
| `Qaytarma` | Signed sales expression used with the report visual's return transaction filter. |
| `Kartlı orta səbət` | Average receipt value with non-NULL, nonblank customer card identifiers. |
| `Kartli Satis Payi` | Signed card sales amount divided by total signed sales in the current context. |
| `Kartsiz Satis Payi` | Signed sales with NULL or blank card identifiers divided by total signed sales in the current context. |
| `Aralıq üzrə çek sayı` | Counts receipts whose positive sales amount falls within the selected value band. |
| `Menfisiz_Qaytarma` | Absolute return amount for transaction_type equal to İade. |
| `Qaytarma Faizi` | Absolute return amount divided by signed sales amount in the current context. The saved denominator is `Satış`. |

The non-card average receipt card uses `Ort_Sebet` with a visual-level `Customer_Card_No = "NULL"` filter. The unused `Kartlsiz orta səbət` definition is retained only in the complete source inventory and is not part of the analytical listing.

Sales shares use signed sales, while average receipt and receipt-band calculations use positive sales. They therefore have different transaction scopes. DIVIDE-based ratios return the alternate value specified in the source expression when the denominator is zero.

## Calculated columns

`Calendar[Həftə günü sırası]` maps Monday to 1 through Sunday to 7 using WEEKDAY with return type 2.

`Sales[Çek növü]` trims the card identifier and classifies an empty value or the literal NULL as Kartsız; other values are Kartlı. It supports the receipt-type slicer.

## Receipt value bands

The lower limit is inclusive and the upper limit is exclusive. The first band has no lower bound, and the last band has no upper bound. `Çek aralıqları` is disconnected; the measure reads its bounds using SELECTEDVALUE and evaluates the receipt amounts within the current Sales filter context.
