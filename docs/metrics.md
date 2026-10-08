# Metric definitions

The expressions in `dax/core-measures.dax` come from the supplied model.

| Measure | Meaning | Calculation |
| --- | --- | --- |
| `Satış` | Signed sales amount, including negative quantities in the current filter context | Sum of `Quantity * product_price` using `SUMX` |
| `Müsbət satış` | Sales amount restricted to positive-quantity rows | `CALCULATE` and `KEEPFILTERS` applied to `Satış` |
| `Ort_Sebet` | Average receipt value for positive sales rows | Positive sales amount divided by `DISTINCTCOUNT(Cek)` for positive rows |
| `Satılan mehsul sayi` | Number of distinct products sold in positive transactions | `DISTINCTCOUNT(Product_id)` for positive-quantity rows |

`Satılan mehsul sayi` counts distinct products. It does not sum units sold. Receipt identifiers are counted within the current filter context. Date and department slicers affect these measures through active model relationships.

`Calendar[Həftə günü sırası]` uses `WEEKDAY(Calendar[Date.1], 2)`, assigning Monday 1 through Sunday 7.
