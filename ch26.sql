# 管理事务处理
SELECT * FROM ordertotals;

# 事务开始
START TRANSACTION;
DELETE FROM ordertotals;
SELECT * FROM ordertotals;
ROLLBACK;

SELECT * FROM ordertotals;

# 26.2.2 使用COMMIT
START TRANSACTION;
DELETE FROM orderitems WHERE order_num=20010;
DELETE FROM orders WHERE order_num=20010;
COMMIT ;

SELECT * FROM orders WHERE order_num=20010;

# 26.2.3 使用保留点
# 26.2.4 更改默认的提交行为
