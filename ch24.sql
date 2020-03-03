# 24.2.1 创建游标
# 定义了名为ordernumbers的游标，使用了可以检索所有订单的SELECT语句。
CREATE PROCEDURE processorder()
BEGIN
    -- DECLARE LOCAL VARIABLES
    DECLARE done BOOLEAN DEFAULT 0;
    DECLARE o INT;
    DECLARE t DECIMAL(8, 2);

    -- DECLARE CURSOR
    DECLARE ordernumbers CURSOR FOR
        SELECT order_num FROM orders;

    -- DECLARE CONTINUE HANDLE
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;

    CREATE TABLE IF NOT EXISTS ordertotals
    (
        order_number INT,
        total       DECIMAL(8, 2)
    );

    # open cursor
    OPEN ordernumbers;

    REPEAT
        FETCH ordernumbers INTO o;
        CALL ordertotal(o, 1, t);
        INSERT INTO ordertotals(order_number, total) VALUES (o, t);
    UNTIL done END REPEAT;
    CLOSE ordernumbers;

    SELECT * FROM ordertotals;
END;

