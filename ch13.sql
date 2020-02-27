# 13 分 组 数 据
# 13.1 数据分组
# 分组允许把数据分为多个逻辑组，以便能对每个组进行聚集计算。

# 13.2 创建分组
SELECT vend_id,COUNT(*) AS num_prods
FROM products
GROUP BY vend_id;

#  GROUP BY子句可以包含任意数目的列。这使得能对分组进行嵌套，
# 为数据分组提供更细致的控制。
#  如果在GROUP BY子句中嵌套了分组，数据将在最后规定的分组上
# 进行汇总。换句话说，在建立分组时，指定的所有列都一起计算
# （所以不能从个别的列取回数据）。
#  GROUP BY子句中列出的每个列都必须是检索列或有效的表达式
# （但不能是聚集函数）。如果在SELECT中使用表达式，则必须在
# GROUP BY子句中指定相同的表达式。不能使用别名。
#  除聚集计算语句外， SELECT语句中的每个列都必须在GROUP BY子
# 句中给出。
#  如果分组列中具有NULL值，则NULL将作为一个分组返回。如果列
# 中有多行NULL值，它们将分为一组。
#  GROUP BY子句必须出现在WHERE子句之后， ORDER BY子句之前。
SELECT vend_id,COUNT(*) AS num_prods
FROM products
GROUP BY vend_id WITH ROLLUP ;

# 13.3 过滤分组
# WHERE过滤指定的是行而不是分组。事实上， WHERE没有分组的概念
# WHERE过滤行，而HAVING过滤分组。
SELECT cust_id,COUNT(*) AS orders_num
FROM orders
GROUP BY cust_id
HAVING orders_num>=2;

# 具有2个（含）以上、价格为10（含）以上的产品的供应商：
SELECT vend_id,COUNT(*) AS num_prods
FROM products
WHERE prod_price>=10
GROUP BY vend_id
HAVING num_prods>=2;

# 13.4 分组和排序
# 检索总计订单价格大于等于50的订单的订单号和总计订单价格：
SELECT order_num,SUM(quantity*item_price) AS total_price
FROM orderitems
GROUP BY order_num
HAVING total_price>50;
# 按总计订单价格排序输出
SELECT order_num,SUM(quantity*item_price) AS total_price
FROM orderitems
GROUP BY order_num
HAVING total_price>50
ORDER BY total_price;

# 13.5 SELECT子句顺序
