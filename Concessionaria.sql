create database concessionaria;
use concessionaria;

create table fabricante(
idFabricante int auto_increment primary key,
nomeFabricante varchar(25) not null
);

create table cliente(
idCliente int auto_increment primary key,
nomeCliente varchar(50) not null,
endereco varchar(50) not null,
telefone varchar(20)
);

create table carro(
idCarro int auto_increment primary key,
modelo varchar(20) not null,
cor varchar(20) not null,
carroceria varchar(20) not null,
preco double not null,
opcionais varchar(100),
fkFabricante int,
foreign key(fkFabricante) references fabricante(idFabricante),
fkCliente int,
foreign key(fkCliente) references cliente(idCliente)
);

INSERT INTO fabricante (nomeFabricante) VALUES
('Toyota'),
('Honda'),
('Ford'),
('Chevrolet'),
('Volkswagen'),
('Hyundai'),
('Nissan'),
('Renault'),
('Peugeot'),
('Fiat'),
('Jeep'),
('BMW'),
('Mercedes-Benz'),
('Audi'),
('Kia');

INSERT INTO cliente (nomeCliente, endereco, telefone) VALUES
('João Silva', 'Rua A, 123', '11999990001'),
('Maria Oliveira', 'Rua B, 456', '11999990002'),
('Carlos Souza', 'Rua C, 789', '11999990003'),
('Ana Santos', 'Rua D, 321', '11999990004'),
('Pedro Costa', 'Rua E, 654', '11999990005'),
('Juliana Lima', 'Rua F, 987', '11999990006'),
('Rafael Alves', 'Rua G, 111', '11999990007'),
('Fernanda Rocha', 'Rua H, 222', '11999990008'),
('Bruno Martins', 'Rua I, 333', '11999990009'),
('Camila Ribeiro', 'Rua J, 444', '11999990010'),
('Lucas Pereira', 'Rua K, 555', '11999990011'),
('Patrícia Gomes', 'Rua L, 666', '11999990012'),
('Gabriel Carvalho', 'Rua M, 777', '11999990013'),
('Aline Fernandes', 'Rua N, 888', '11999990014'),
('Ricardo Barros', 'Rua O, 999', '11999990015');

INSERT INTO carro (modelo, cor, carroceria, preco, opcionais, fkFabricante, fkCliente) VALUES
('Corolla', 'Prata', 'Sedan', 120000, 'Ar, Direção, Multimídia', 1, 1),
('Civic', 'Preto', 'Sedan', 130000, 'Teto solar, Multimídia', 2, 2),
('Focus', 'Branco', 'Hatch', 90000, 'Ar, Sensor ré', 3, 3),
('Onix', 'Vermelho', 'Hatch', 80000, 'Multimídia, Câmera ré', 4, 4),
('Golf', 'Cinza', 'Hatch', 150000, 'Teto solar, GPS', 5, 5),
('HB20', 'Azul', 'Hatch', 75000, 'Ar, Direção', 6, 6),
('Sentra', 'Preto', 'Sedan', 110000, 'Multimídia, Couro', 7, 7),
('Sandero', 'Branco', 'Hatch', 70000, 'Ar, Vidro elétrico', 8, 8),
('208', 'Amarelo', 'Hatch', 85000, 'Multimídia', 9, 9),
('Argo', 'Vermelho', 'Hatch', 78000, 'Sensor ré', 10, 10),
('Compass', 'Preto', 'SUV', 180000, '4x4, Multimídia', 11, 11),
('320i', 'Branco', 'Sedan', 250000, 'Couro, GPS', 12, 12),
('C180', 'Prata', 'Sedan', 260000, 'Teto solar, Couro', 13, 13),
('A3', 'Cinza', 'Sedan', 240000, 'Multimídia, Sensor', 14, 14),
('Sportage', 'Azul', 'SUV', 170000, 'Multimídia, Câmera', 15, 15);


select * from(
	SELECT 
    c.nomeCliente,
    f.nomeFabricante,
    ca.modelo,
    ca.carroceria,
    ca.cor,
    ca.opcionais,
    ca.preco
FROM carro ca
JOIN cliente c ON ca.fkCliente = c.idCliente
JOIN fabricante f ON ca.fkFabricante = f.idFabricante

union ALL

    SELECT 
        'Total',
        '',
        '',
        NULL,
        NULL,
		NULL,
        sum(ca.preco)
       
	FROM carro ca
	JOIN cliente c ON ca.fkCliente = c.idCliente
	JOIN fabricante f ON ca.fkFabricante = f.idFabricante
    
    union ALL

    SELECT 
        'Menor Preço',
        '',
        '',
        NULL,
        NULL,
		NULL,
        min(ca.preco)
       
	FROM carro ca
	JOIN cliente c ON ca.fkCliente = c.idCliente
	JOIN fabricante f ON ca.fkFabricante = f.idFabricante
    
       union ALL

    SELECT 
        'Media',
        '',
        '',
        NULL,
        NULL,
		NULL,
		avg(ca.preco)
       
	FROM carro ca
	JOIN cliente c ON ca.fkCliente = c.idCliente
	JOIN fabricante f ON ca.fkFabricante = f.idFabricante
    
    union ALL

    SELECT 
        'Maior Preço',
        '',
        '',
        NULL,
        NULL,
		NULL,
        max(ca.preco)
       
	FROM carro ca
	JOIN cliente c ON ca.fkCliente = c.idCliente
	JOIN fabricante f ON ca.fkFabricante = f.idFabricante
    
 
    )as resultado;



