# 全文本搜索
# 18.2 使用全文本搜索
# 18.2.1 启用全文本搜索支持
# CREATE TABLE product_notes
# (
#     node_id   INT      NOT NULL AUTO_INCREMENT,
#     prod_id   CHAR(10) NOT NULL,
#     node_data DATETIME NOT NULL,
#     node_text TEXT     NULL,
#     PRIMARY KEY (node_id),
#     FULLTEXT (node_text)
# ) ENGINE = MyISAM;

SELECT note_text
FROM productnotes
WHERE MATCH(note_text) AGAINST('rabbit');

SELECT note_text
FROM productnotes
WHERE note_text LIKE '%RABBIT%';

SELECT note_text, MATCH(note_text) AGAINST('rabbit')
FROM productnotes;

# 18.2.3 使用查询扩展
SELECT note_text
FROM productnotes
WHERE MATCH(note_text) AGAINST('anvils' WITH QUERY EXPANSION );

# 18.2.4 布尔文本搜索
SELECT note_text
FROM productnotes
WHERE MATCH(note_text) AGAINST('heavy -rope*' IN BOOLEAN MODE );

SELECT note_text
FROM productnotes
WHERE MATCH(note_text) AGAINST('+rabbit +bait');

SELECT note_text
FROM productnotes
WHERE MATCH(note_text) AGAINST('rabbit bait');