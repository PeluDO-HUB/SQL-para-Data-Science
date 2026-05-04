 CREATE DATABASE dbAula01;
USE dbAula01;

-- 🔹 Tabela tipoProduto
CREATE TABLE tipoProduto(
    idTipoProduto INT AUTO_INCREMENT PRIMARY KEY,
    tipoProduto VARCHAR(25) NOT NULL
);

-- 🔹 Tabela cliente
CREATE TABLE cliente(
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nomeCliente VARCHAR(50) NOT NULL
);

-- 🔹 Tabela produto
CREATE TABLE produto(
    idProduto INT AUTO_INCREMENT PRIMARY KEY,
    nomeProduto VARCHAR(50) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    fkTipoProduto INT,
    FOREIGN KEY (fkTipoProduto) REFERENCES tipoProduto(idTipoProduto)
);

-- 🔹 Tabela venda
CREATE TABLE venda(
    idVenda INT AUTO_INCREMENT PRIMARY KEY,
    dataCompra DATETIME NOT NULL,
    quantidade INT NOT NULL,
    fkProduto INT,
    fkCliente INT,
    FOREIGN KEY (fkProduto) REFERENCES produto(idProduto),
    FOREIGN KEY (fkCliente) REFERENCES cliente(idCliente)
);

-- 🔥 INSERTS

-- tipoProduto (15)
INSERT INTO tipoProduto (tipoProduto) VALUES
('Frutas'),
('Verduras'),
('Legumes'),
('Temperos'),
('Grãos'),
('Orgânicos'),
('Frutas Secas'),
('Hortaliças'),
('Tubérculos'),
('Ervas'),
('Cogumelos'),
('Minimamente Processados'),
('Sucos Naturais'),
('Polpas de Fruta'),
('Cestas Hortifruti');

-- cliente (15)
INSERT INTO cliente (nomeCliente) VALUES
('João Silva'),
('Maria Oliveira'),
('Carlos Souza'),
('Ana Santos'),
('Pedro Costa'),
('Juliana Lima'),
('Rafael Alves'),
('Fernanda Rocha'),
('Bruno Martins'),
('Camila Ribeiro'),
('Lucas Pereira'),
('Patrícia Gomes'),
('Gabriel Carvalho'),
('Aline Fernandes'),
('Ricardo Barros');

-- produto (15)
INSERT INTO produto (nomeProduto, preco, fkTipoProduto) VALUES
('Banana', 6.50, 1),
('Maçã', 8.00, 1),
('Alface', 3.00, 2),
('Couve', 4.00, 2),
('Tomate', 7.50, 3),
('Cenoura', 5.00, 3),
('Alho', 20.00, 4),
('Feijão', 9.00, 5),
('Arroz Integral', 12.00, 5),
('Batata Doce', 6.00, 9),
('Mandioca', 5.50, 9),
('Salsinha', 2.50, 10),
('Champignon', 18.00, 11),
('Suco de Laranja', 10.00, 13),
('Cesta Hortifruti', 50.00, 15);

-- venda (15)
INSERT INTO venda (dataCompra, quantidade, fkProduto, fkCliente) VALUES
('2026-04-01 08:00:00', 3, 1, 1),
('2026-04-01 09:30:00', 2, 2, 2),
('2026-04-02 10:00:00', 1, 3, 3),
('2026-04-02 11:15:00', 2, 4, 4),
('2026-04-03 12:40:00', 5, 5, 5),
('2026-04-03 14:20:00', 4, 6, 6),
('2026-04-04 08:50:00', 1, 7, 7),
('2026-04-04 10:10:00', 2, 8, 8),
('2026-04-05 11:45:00', 3, 9, 9),
('2026-04-05 13:30:00', 2, 10, 10),
('2026-04-06 15:00:00', 4, 11, 11),
('2026-04-06 16:20:00', 1, 12, 12),
('2026-04-07 09:10:00', 2, 13, 13),
('2026-04-07 10:40:00', 3, 14, 14),
('2026-04-08 07:30:00', 1, 15, 15);

SELECT * FROM (

    SELECT 
        c.nomeCliente,
        p.nomeProduto,
        t.tipoProduto,
        v.quantidade,
        p.preco,
        (v.quantidade * p.preco) AS total,
        v.dataCompra
    FROM venda v
    JOIN cliente c ON v.fkCliente = c.idCliente
    JOIN produto p ON v.fkProduto = p.idProduto
    JOIN tipoProduto t ON p.fkTipoProduto = t.idTipoProduto

    UNION ALL

    SELECT 
        'TOTAL',
        '',
        '',
        NULL,
        NULL,
        SUM(v.quantidade * p.preco),
        NULL
    FROM venda v
    JOIN produto p ON v.fkProduto = p.idProduto

) AS resultado

ORDER BY 
    dataCompra IS NULL,   -- joga o TOTAL pro final
    dataCompra ASC;


select * from cliente limit 0,7;
