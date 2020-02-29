# 16章 创建高级联结
# 16.1 使用表别名
# 16.2 使用不同类型的联结
# 16.2.1 自联结
SELECT prod_id, prod_name
FROM products
WHERE vend_id = (
    SELECT vend_id
    FROM products
    WHERE prod_id = 'DTNTR'
);

SELECT p1.prod_id, p1.prod_name
FROM products AS p1,
     products AS p2
WHERE p1.vend_id = p2.vend_id
  AND p2.prod_id = 'DTNTR';

# 16.2.2 自然联结
SELECT c.*,
       o.order_num,
       o.order_date,
       oi.prod_id,
       oi.quantity,
       oi.item_price
FROM customers AS c,
     orders AS o,
     orderitems AS oi
WHERE c.cust_id = o.cust_id
  AND oi.order_num = o.order_num;

# 16.2.3 外部联结
#  对每个客户下了多少订单进行计数，包括那些至今尚未下订单的
# 客户；
#  列出所有产品以及订购数量，包括没有人订购的产品；
#  计算平均销售规模，包括那些至今尚未下订单的客户。
SELECT customers.cust_id, orders.order_num
FROM customers
         INNER JOIN orders
                    ON customers.cust_id = orders.cust_id;

SELECT customers.cust_id, orders.order_num
FROM customers
         LEFT OUTER JOIN orders
                         ON customers.cust_id = orders.cust_id;

# 16.3 使用带聚集函数的联结
# 检索所有客户及每个客户所下的订单数
SELECT customers.cust_name, customers.cust_id, COUNT(orders.order_num) AS ord_num
FROM customers
         RIGHT OUTER JOIN orders
                    ON customers.cust_id = orders.cust_id
GROUP BY customers.cust_id;