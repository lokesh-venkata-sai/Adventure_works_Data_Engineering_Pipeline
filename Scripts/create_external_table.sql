-- CREATE MASTER KEY ENCRYPTION BY PASSWORD ='lokesh@99'

CREATE DATABASE SCOPED CREDENTIAL cred_lokesh
WITH 
    IDENTITY = 'Managed Identity';


CREATE EXTERNAL DATA SOURCE source_silver
WITH 
(
    LOCATION = 'https://lmamidiawstorage.dfs.core.windows.net/silver',
    CREDENTIAL = cred_lokesh
);


CREATE EXTERNAL DATA SOURCE source_gold
WITH 
(
    LOCATION = 'https://lmamidiawstorage.dfs.core.windows.net/gold',
    CREDENTIAL = cred_lokesh
);

CREATE EXTERNAL FILE FORMAT format_parquet
WITH
(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
);


CREATE EXTERNAL TABLE gold.extsales
WITH
(
    LOCATION = 'extsales',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
) 
AS
SELECT * from gold.sales;


SELECT * FROM gold.extsales;
