# 更新删除数据
SELECT *
FROM customers
WHERE cust_id = 10006;
UPDATE customers
SET cust_email = 'mhp@8888.com'
WHERE cust_id = 10003;
UPDATE customers
SET cust_email = 'AAA@AAA.COM',
    cust_city = 'aaaa@aaa.com'
WHERE cust_id = 10003;

# 20.2 删除数据
DELETE FROM customers
WHERE cust_id = 10006;