# 12.1 聚集函数
# AVG() 返回某列的平均值
# COUNT() 返回某列的行数
# MAX() 返回某列的最大值
# MIN() 返回某列的最小值
# SUM() 返回某列值之和

# 12.1.1 AVG()函数
# 返回products表中所有产品的平均价格：
SELECT AVG(prod_price) AS avg_price
FROM products;
# 返回特定供应商所提供产品的平均价格：
SELECT AVG(prod_price) AS avg_price_1003
FROM products
WHERE vend_id = 1003;

# 12.1.2 COUNT()函数
# COUNT()函数有两种使用方式。
#  - 使用COUNT(*)对表中行的数目进行计数，不管表列中包含的是空
# 值（ NULL）还是非空值。
#  - 使用COUNT(column)对特定列中具有值的行进行计数，忽略
# NULL值

# customers表中客户的总数
SELECT COUNT(*) AS num_cost
FROM customers;
# 只对具有电子邮件地址的客户计数：
SELECT COUNT(cust_email) AS cust_email_num
FROM customers;

# 12.1.3 MAX()函数
# 返回products表中最贵的物品的价格。
SELECT MAX(prod_price) AS max_prod_price
FROM products;

# 12.1.4 MIN()函数
SELECT MIN(prod_price) AS min_prod_price
FROM products;

# 12.1.5 SUM()函数
# orderitems表包含订单中实际的物品，每个物品
# 有相应的数量（ quantity）。可如下检索所订购物品的总数（所有
# quantity值之和）
SELECT SUM(quantity) AS sum
FROM orderitems
WHERE order_num = 20005;

# 合计计算值
SELECT SUM(item_price * quantity) AS total_price
FROM orderitems
WHERE order_num = 20005;

# 12.2 聚集不同值
# 平均值只考虑各个不同的价格：
SELECT AVG(DISTINCT prod_price) AS avg_price
FROM products
WHERE vend_id=1003;

# 12.3 组合聚集函数
SELECT COUNT(*) AS num_items,
       MIN(prod_price) AS price_min,
       MAX(prod_price) AS price_max,
       AVG(prod_price) AS price_avg
FROM products;