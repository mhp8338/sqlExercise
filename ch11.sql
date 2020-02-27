# 使用数据处理函数
# 函数的可移植性差一些

# 文本处理函数
SELECT vend_name,UPPER(vend_name) AS vend_name_upcase
FROM vendors
ORDER BY vend_name

# 常见的文本处理函数
# Left() 返回串左边的字符
# Length() 返回串的长度
# Locate() 找出串的一个子串
# Lower() 将串转换为小写
# LTrim() 去掉串左边的空格
# Right() 返回串右边的字符
# RTrim() 去掉串右边的空格
# Soundex() 返回串的SOUNDEX值
# SubString() 返回子串的字符
# Upper() 将串转换为大写

# Soundex()
SELECT cust_name,cust_contact
FROM customers
WHERE cust_contact = 'Y.Lie';
SELECT cust_name,cust_contact
FROM customers
WHERE SOUNDEX(cust_contact) = SOUNDEX('Y.Lie');

# 日期和时间处理函数
SELECT cust_id,order_num
FROM orders
WHERE order_date = '2005-09-01';
SELECT cust_id,order_num
FROM orders
WHERE DATE(order_date) = '2005-09-01';
# 检索出2005年9月下的所有订单
SELECT cust_id,order_num
FROM orders
WHERE DATE(order_date) BETWEEN '2005-09-01' AND '2005-09-30';
SELECT cust_id,order_num
FROM orders
WHERE YEAR(order_date) = 2005 AND MONTH(order_date)=9;

# 数值处理函数
# Abs() 返回一个数的绝对值
# Cos() 返回一个角度的余弦
# Exp() 返回一个数的指数值
# Mod() 返回除操作的余数
# Pi() 返回圆周率
# Rand() 返回一个随机数
# Sin() 返回一个角度的正弦
# Sqrt() 返回一个数的平方根
# Tan() 返回一个角度的正切


