# 触发器用CREATE TRIGGER语句创建
CREATE TRIGGER newproduct
    AFTER INSERT
    ON products
    FOR EACH ROW SELECT 'Productadd'
                 INTO @aa;

INSERT INTO products(prod_id, vend_id, prod_name, prod_price)
VALUES ('AB', 1001, 'APPLES', 98.11);
SELECT @aa;

DROP TRIGGER newproduct;

DROP TRIGGER neworder;
CREATE TRIGGER neworder
    AFTER INSERT
    ON orders
    FOR EACH ROW SELECT NEW.order_num
                 INTO @ee;


INSERT INTO customers(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact,
                      cust_email)
VALUES (100001, 'MMMMM', 'ASD', 'ASD', 'ASD', 'ASD', 'ASD', 'ASD', 'ASDAS');
INSERT INTO orders(order_date, cust_id)
VALUES (NOW(), 100001);


SELECT @ee;

CREATE TABLE IF NOT EXISTS archive_orders
(
    order_num  INT,
    order_date DATETIME,
    cust_id    INT
);
CREATE TRIGGER delete_order
    BEFORE DELETE
    ON orders
    FOR EACH ROW
BEGIN
    INSERT INTO archive_orders(order_num, order_date, cust_id)
    VALUES (OLD.order_num, OLD.order_date, OLD.cust_id);
end;