# 22.2.1 利用视图简化复杂的联结
CREATE VIEW product_customers AS
SELECT cust_contact, cust_name, prod_id
FROM customers,
     orders,
     orderitems
WHERE orders.cust_id = customers.cust_id
  AND orders.order_num = orderitems.order_num;

SELECT *
FROM product_customers
WHERE prod_id = 'TNT2';

# 22.2.2 用视图重新格式化检索出的数据
SELECT CONCAT(RTRIM(vend_name), '(', vend_country, ')') AS vender_title
FROM vendors
ORDER BY vend_name;

CREATE VIEW vendor_location AS
SELECT CONCAT(RTRIM(vend_name), '(', vend_country, ')') AS vender_title
FROM vendors
ORDER BY vend_name;

SELECT *
FROM vendor_location;

# 22.2.3 用视图过滤不想要的数据
# 过滤没有电子邮件地址的客户
CREATE VIEW customer_email_list AS
    SELECT cust_id,cust_name,cust_email
FROM customers
WHERE cust_email IS NOT NULL;

SELECT *
FROM customer_email_list;

# 使用存储过程
