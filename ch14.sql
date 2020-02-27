# 14 使用子查询
# 列出订购物品TNT2的所有客户
# (1) 检索包含物品TNT2的所有订单的编号。
# (2) 检索具有前一步骤列出的订单编号的所有客户的ID。
# (3) 检索前一步骤返回的所有客户ID的客户信息。
SELECT cust_name, cust_contact
FROM customers
WHERE cust_id IN (
    SELECT cust_id
    FROM orders
    WHERE order_num IN (
        SELECT order_num
        FROM orderitems
        WHERE prod_id = 'TNT2'
    )
);
# 14.3 作为计算字段使用子查询
# 显示customers表中每个客户的订单总数。
# 订单与相应的客户ID存储在orders表中。
SELECT cust_id,
       cust_state,
       (
           SELECT COUNT(*)
           FROM orders
           WHERE orders.cust_id = customers.cust_id
       ) AS total_order
FROM customers
ORDER BY cust_name;

