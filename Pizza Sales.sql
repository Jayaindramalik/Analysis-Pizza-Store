use `Project Portofolio`;

--Mengambil Data Dari Tabel Pizza
SELECT *
FROM pizza_sales;

--Menggabungkan Kolom Order Date dan Order Time
SELECT 
    concat(order_date,'',order_time)as Order_datetime
FROM 
    pizza_sales;

--Menambahkan Kolom Order_Datetime pada tabel
alter table 
pizza_sales ADD Order_datetime DATETIME;

--Menambahkan Data Pada Column Order_Datetime
update 
    pizza_sales
set 
    Order_datetime = concat(order_date,' ',order_time);

--Merubah Type Column Pada Order_Datetime dari String Menjadi Date
update 
    pizza_sales
set 
    Order_datetime = STR_TO_DATE(order_date,'%Y-%m-%D');

--Menghapus Column order_date
ALTER TABLE 
    pizza_sales
drop 
    column order_date;

--Menghapus Column Order_time
ALTER TABLE 
    pizza_sales
drop 
    column order_time;

--Menentukan Total Penjualan
SELECT 
    SUM(total_price)
from 
    pizza_sales;

--Menentukan Total Item Terjual
SELECT 
    SUM(quantity)
from 
    pizza_sales;

--Menentukan Total Transaksi
SELECT 
    COUNT(order_id)
from 
    pizza_sales;

--Menentukan Total Penjualan Berdasarkan Kategori
SELECT 
    pizza_category,
    sum(total_price) as total_sale
from 
    pizza_sales
GROUP BY 
    pizza_category
ORDER BY 
total_sale DESC;

--Menentukan Total Penjualan Berdasarkan Harga Produk
SELECT
    unit_price,
    sum(total_price) Total_Sale
from 
    pizza_sales
GROUP BY 
    unit_price
order BY 
    Total_Sale DESC
LIMIT 10;

--Menentukan Total Penjualan Berdasarkan Ukuran Produk
SELECT 
    pizza_size,
    SUM(total_price) AS Total_Sale,
    ROUND(SUM(total_price) * 100.0 / (
        SELECT SUM(total_price) FROM pizza_sales
    ), 2) AS Persentase
FROM 
    pizza_sales
GROUP BY 
    pizza_size;

--Menentukan Penjualan Berdasarkan Nama Produk 
SELECT 
    pizza_name,
    sum(total_price) as Total_Sale
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY Total_Sale DESC
LIMIT 11;