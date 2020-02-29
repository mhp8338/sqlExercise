# 23.使用存储过程
# 23.3 使用存储过程
# 23.3.1 执行存储过程
# CALL productpriceing(
#     @pricelow
#     @pricehigh
#     @priceaverage
#     );

# 创建存储过程
CREATE PROCEDURE productpricing()
BEGIN
    SELECT AVG(prod_price) AS priceavergae
    FROM products;
END;

CALL productpricing();

# 删除存储过程
DROP PROCEDURE productpricing;

# 创建带参数的存储过程
CREATE PROCEDURE productpricing(OUT pl DECIMAL(8, 2),
                                OUT ph DECIMAL(8, 2),
                                OUT pa DECIMAL(8, 2))
BEGIN
    SELECT MIN(prod_price)
    INTO pl
    FROM products;
    SELECT MAX(prod_price)
    INTO ph
    FROM products;
    SELECT AVG(prod_price)
    INTO pa
    FROM products;
end;

#
CALL productpricing(@price_low, @price_high, @price_avg);

SELECT @price_low, @price_high, @price_avg;

# IN OUT使用
CREATE PROCEDURE ordertotal(IN input_num INT,
                            OUT ouput_total DECIMAL(8, 2))
BEGIN
    SELECT SUM(item_price * quantity)
    FROM orderitems
    WHERE order_num = input_num
    INTO ouput_total;
end;

CALL ordertotal(20005, @total);

SELECT @total;

CALL ordertotal(20009, @total);
SELECT @total;

# 23.3.5 建立智能存储过程
DROP PROCEDURE ordertotal;
CREATE PROCEDURE ordertotal(IN or_number INT,
                            IN taxable BOOLEAN,
                            OUT out_total DECIMAL(8, 2))
    COMMENT 'Obtain order total,optionally adding tax'
BEGIN
    -- Declare variable from total
    DECLARE total DECIMAL(8, 2);
-- Declare variable taxrate
    DECLARE taxrate INT DEFAULT 6;
# GET ORDER TOTAL
    SELECT SUM(item_price * quantity)
    FROM orderitems
    WHERE order_num = or_number
    INTO total;
# TAXABLE
    IF taxable THEN
        SELECT total + (total / 100) * taxrate INTO total;
    END IF;
#    TOTAL -> OUT TOTAL
    SELECT total INTO out_total;
END;

CALL ordertotal(20005, 0, @total);
SELECT @total;
CALL ordertotal(20005, 1, @total);
SELECT @total;

# 23.3.6 检查存储过程
SHOW CREATE PROCEDURE ordertotal;
SHOW PROCEDURE STATUS LIKE 'ordertotal';
