-- APAGAR O BANCO CASO EXISTA
DROP DATABASE IF EXISTS imobiliaria;

-- CRIAR O BANCO
CREATE DATABASE imobiliaria;

-- USAR O BANCO
USE imobiliaria;

-- =====================================================
-- TABELA TIPOCLIENTE
-- =====================================================
CREATE TABLE TipoCliente (
    idTipoCliente INT PRIMARY KEY AUTO_INCREMENT,
    tipoCliente ENUM(
        'vendedor',
        'comprador',
        'locador',
        'locatario'
    ) NOT NULL
);

-- =====================================================
-- TABELA TIPOIMOVEL
-- =====================================================
CREATE TABLE TipoImovel (
    idTipoImovel INT PRIMARY KEY AUTO_INCREMENT,
    tipoImovel ENUM(
        'apartamento',
        'casa',
        'sobrado',
        'galpao',
        'sala comercial',
        'casa condominio'
    ) NOT NULL
);

-- =====================================================
-- TABELA CLIENTE
-- =====================================================
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nomeCliente VARCHAR(100) NOT NULL,
    emailCliente VARCHAR(100) NOT NULL,
    enderecoCliente VARCHAR(150) NOT NULL,
    fkTipoCliente INT,

    CONSTRAINT fk_cliente_tipo
    FOREIGN KEY (fkTipoCliente)
    REFERENCES TipoCliente(idTipoCliente)
);

-- =====================================================
-- TABELA IMOVEL
-- =====================================================
CREATE TABLE Imovel (
    idImovel INT PRIMARY KEY AUTO_INCREMENT,
    enderecoImovel VARCHAR(150) NOT NULL,
    descricaoImovel VARCHAR(255) NOT NULL,
    valorImovel DECIMAL(12,2) NOT NULL,
    fkTipoImovel INT,
    tipoNegocio ENUM(
        'venda',
        'locacao'
    ) NOT NULL,

    CONSTRAINT fk_imovel_tipo
    FOREIGN KEY (fkTipoImovel)
    REFERENCES TipoImovel(idTipoImovel)
);

-- =====================================================
-- INSERTS TIPOCLIENTE (15 REGISTROS)
-- =====================================================
INSERT INTO TipoCliente (tipoCliente) VALUES
('vendedor'),
('comprador'),
('locador'),
('locatario'),
('vendedor'),
('comprador'),
('locador'),
('locatario'),
('vendedor'),
('comprador'),
('locador'),
('locatario'),
('vendedor'),
('comprador'),
('locador');

-- =====================================================
-- INSERTS TIPOIMOVEL (15 REGISTROS)
-- =====================================================
INSERT INTO TipoImovel (tipoImovel) VALUES
('apartamento'),
('casa'),
('sobrado'),
('galpao'),
('sala comercial'),
('casa condominio'),
('apartamento'),
('casa'),
('sobrado'),
('galpao'),
('sala comercial'),
('casa condominio'),
('apartamento'),
('casa'),
('sobrado');

-- =====================================================
-- INSERTS CLIENTE (15 REGISTROS)
-- =====================================================
INSERT INTO Cliente
(nomeCliente, emailCliente, enderecoCliente, fkTipoCliente)
VALUES
('Carlos Silva', 'carlos1@email.com', 'Rua A, 101', 1),
('Mariana Souza', 'mariana2@email.com', 'Rua B, 102', 2),
('Joao Pereira', 'joao3@email.com', 'Rua C, 103', 3),
('Fernanda Lima', 'fernanda4@email.com', 'Rua D, 104', 4),
('Ricardo Alves', 'ricardo5@email.com', 'Rua E, 105', 5),
('Patricia Gomes', 'patricia6@email.com', 'Rua F, 106', 6),
('Lucas Rocha', 'lucas7@email.com', 'Rua G, 107', 7),
('Juliana Martins', 'juliana8@email.com', 'Rua H, 108', 8),
('Bruno Costa', 'bruno9@email.com', 'Rua I, 109', 9),
('Amanda Ribeiro', 'amanda10@email.com', 'Rua J, 110', 10),
('Felipe Santos', 'felipe11@email.com', 'Rua K, 111', 11),
('Camila Oliveira', 'camila12@email.com', 'Rua L, 112', 12),
('Eduardo Mendes', 'eduardo13@email.com', 'Rua M, 113', 13),
('Larissa Barbosa', 'larissa14@email.com', 'Rua N, 114', 14),
('Gabriel Ferreira', 'gabriel15@email.com', 'Rua O, 115', 15);

-- =====================================================
-- INSERTS IMOVEL (15 REGISTROS)
-- =====================================================
INSERT INTO Imovel
(
    enderecoImovel,
    descricaoImovel,
    valorImovel,
    fkTipoImovel,
    tipoNegocio
)
VALUES
(
    'Av. Central, 1001',
    'Apartamento moderno com 2 quartos e varanda',
    350000.00,
    1,
    'venda'
),
(
    'Av. Paulista, 1002',
    'Casa ampla com garagem para 2 carros',
    2500.00,
    2,
    'locacao'
),
(
    'Rua das Flores, 1003',
    'Sobrado com churrasqueira e piscina',
    480000.00,
    3,
    'venda'
),
(
    'Rua das Palmeiras, 1004',
    'Galpao industrial com amplo espaco interno',
    3200.00,
    4,
    'locacao'
),
(
    'Rua Alfa, 1005',
    'Sala comercial no centro empresarial',
    1500000.00,
    5,
    'venda'
),
(
    'Rua Beta, 1006',
    'Casa em condominio fechado com seguranca',
    4500.00,
    6,
    'locacao'
),
(
    'Rua Gama, 1007',
    'Apartamento com vista panoramica',
    390000.00,
    7,
    'venda'
),
(
    'Rua Delta, 1008',
    'Casa com quintal amplo e jardim',
    2800.00,
    8,
    'locacao'
),
(
    'Rua Epsilon, 1009',
    'Sobrado reformado proximo ao metro',
    520000.00,
    9,
    'venda'
),
(
    'Rua Zeta, 1010',
    'Galpao para armazenamento e distribuicao',
    6000.00,
    10,
    'locacao'
),
(
    'Rua Omega, 1011',
    'Sala comercial mobiliada',
    870000.00,
    11,
    'venda'
),
(
    'Rua Horizonte, 1012',
    'Casa condominio com area gourmet',
    3500.00,
    12,
    'locacao'
),
(
    'Rua Imperial, 1013',
    'Apartamento compacto para solteiros',
    410000.00,
    13,
    'venda'
),
(
    'Rua Veneza, 1014',
    'Casa residencial em bairro tranquilo',
    2900.00,
    14,
    'locacao'
),
(
    'Rua Aurora, 1015',
    'Sobrado luxuoso com 4 suites',
    760000.00,
    15,
    'venda'
);
select * from cliente order by nomeCliente;

select * from imovel order by valorImovel desc;


select * from imovel where descricaoImovel like "%Garagem%";

select * from cliente where idcliente=8;

select * from imovel where valorImovel<100000;

select* from imovel where valorImovel>740000;