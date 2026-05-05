-- 🔹 Criar banco
CREATE DATABASE IF NOT EXISTS ferragensferreira;
USE ferragensferreira;

-- 🔹 Tabela produto
CREATE TABLE produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(100),
    qtd INT,
    preco DECIMAL(10,2)
);

-- 🔹 Inserir 5 produtos
INSERT INTO produto (nome, descricao, qtd, preco) VALUES
('Martelo', 'Martelo de aço', 20, 35.50),
('Chave de Fenda', 'Chave média', 50, 12.00),
('Parafuso', 'Parafuso 10mm', 200, 0.50),
('Furadeira', 'Furadeira elétrica', 10, 250.00),
('Serrote', 'Serrote manual', 15, 45.90);

-- 🔹 Tabela funcionario 
CREATE TABLE funcionario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cargo VARCHAR(30)
);

-- 🔹 Inserir 5 funcionários
INSERT INTO funcionario (nome, cargo) VALUES
('João Silva', 'Vendedor'),
('Maria Souza', 'Caixa'),
('Carlos Lima', 'Gerente'),
('Ana Costa', 'Estoquista'),
('Pedro Alves', 'Auxiliar');

-- 🔹 Tabela fornecedor
CREATE TABLE fornecedor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    endereco VARCHAR(100),
    email VARCHAR(50),
    cep VARCHAR(10)
);

-- 🔹 Inserir 5 fornecedores
INSERT INTO fornecedor (nome, endereco, email, cep) VALUES
('Ferragens Brasil', 'Rua A, 100', 'contato@ferragensbrasil.com', '01000-000'),
('Metal Forte', 'Av B, 200', 'vendas@metalforte.com', '02000-000'),
('ConstruMax', 'Rua C, 300', 'contato@construmax.com', '03000-000'),
('Parafusos União', 'Av D, 400', 'suporte@uniaoparafusos.com', '04000-000'),
('Tools Center', 'Rua E, 500', 'contato@toolscenter.com', '05000-000');

ALTER TABLE funcionario ADD qtdDependente INT;
ALTER TABLE funcionario ADD sexo VARCHAR(10);

UPDATE funcionario
SET qtdDependente = 2, sexo = 'Masculino'
WHERE id = 1;

UPDATE funcionario
SET qtdDependente = 1, sexo = 'Feminino'
WHERE id = 2;

UPDATE funcionario
SET qtdDependente = 3, sexo = 'Masculino'
WHERE id = 3;

UPDATE funcionario
SET qtdDependente = 0, sexo = 'Feminino'
WHERE id = 4;

UPDATE funcionario
SET qtdDependente = 1, sexo = 'Masculino'
WHERE id = 5;

SELECT * FROM produto;
SELECT * FROM funcionario;
SELECT * FROM fornecedor;