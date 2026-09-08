CREATE OR REPLACE EXTERMAL TABLE `sprint3-analytics-alexregueira.sprint3_bronze.transactions_raw`
OPTIONS(
  format = 'CSV',
  uris = ['gs://bootcamp-data-analytics-public/ERP/transactions.csv'],
  field_delimiter = ';',
  skip_leading_rows = 1
);