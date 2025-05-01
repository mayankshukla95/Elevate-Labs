# Basic Sales Summary from a Tiny SQLite Database using Python

# Tools :-
1. Python (with sqlite3, pandas, matplotlib).
2. SQLite (built into Python — no setup!).
3. Jupyter Notebook.

# Deliverables :-
1.  import sqlite3, conn = sqlite3.connect("sales_data.db").
2.  query = "SELECT product, SUM(quantity) AS total_qty, SUM(quantity * price) AS
revenue FROM sales GROUP BY product".
3.  import pandas as pd, Sales_df = pd.read_sql_query(query, conn).
4.  Print results: print(Sales_df).
5.  Plot simple bar chart: Sales_df.plot(kind='bar', x='product', y='revenue').
6.  Save chart if needed: plt.savefig("sales_chart.png")
