# 17章 组 合 查 询
# 17.1 组合查询
# 多个查询（多条SELECT语句），并将结果作为单个
# 查询结果集返回。这些组合查询通常称为并（ union） 或复合查询
# （ compound query）
# 17.2 创建组合查询
# 17.2.1 使用UNION
SELECT vend_id, prod_id, prod_price
FROM products
WHERE prod_price <= 5
UNION
SELECT vend_id, prod_id, prod_price
FROM products
WHERE vend_id IN (1001, 1002);

SELECT vend_id, prod_id, prod_price
FROM products
WHERE prod_price <= 5
   OR vend_id IN (1001, 1002);

# 17.2.3 包含或取消重复的行
SELECT vend_id, prod_id, prod_price
FROM products
WHERE prod_price <= 5
UNION ALL
SELECT vend_id, prod_id, prod_price
FROM products
WHERE vend_id IN (1001, 1002);

# 17.2.4 对组合查询结果排序
# ORDER BY 仅有一行
SELECT vend_id, prod_id, prod_price
FROM products
WHERE prod_price <= 5
UNION ALL
SELECT vend_id, prod_id, prod_price
FROM products
WHERE vend_id IN (1001, 1002)
ORDER BY vend_id,prod_price;