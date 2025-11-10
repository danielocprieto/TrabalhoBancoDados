

CREATE DATABASE penultimo_trabalho_mysql;

CREATE TABLE estado(
id_estado INT AUTO_INCREMENT PRIMARY KEY,
estado VARCHAR(50)
);

CREATE TABLE cidade (
id_cidade INT AUTO_INCREMENT PRIMARY KEY,
cidade VARCHAR(100),
id_estado INT,
CONSTRAINT fk_id_estado FOREIGN KEY (id_estado) REFERENCES estado(id_estado)
);

CREATE TABLE produtos (
id_produto INT AUTO_INCREMENT PRIMARY KEY,
nome_produto VARCHAR(100),
valor_produto DECIMAL(10,2),
data_compra DATE,
id_cidade INT,
CONSTRAINT fk_id_cidade FOREIGN KEY (id_cidade) REFERENCES cidade (id_cidade)

);


INSERT INTO estado (estado) VALUES
('São Paulo'),
('Rio de Janeiro'),
('Minas Gerais'),
('Bahia'),
('Paraná'),
('Santa Catarina'),
('Rio Grande do Sul'),
('Pernambuco'),
('Ceará'),
('Pará'),
('Goiás'),
('Maranhão'),
('Espírito Santo'),
('Paraíba'),
('Amazonas'),
('Mato Grosso'),
('Mato Grosso do Sul'),
('Rio Grande do Norte'),
('Alagoas'),
('Piauí'),
('Sergipe'),
('Rondônia'),
('Tocantins'),
('Acre'),
('Roraima');

INSERT INTO cidade (cidade,id_estado) VALUES
('São Paulo', 1),
('Campinas', 1),
('Rio de Janeiro', 2),
('Niterói', 2),
('Belo Horizonte', 3),
('Uberlândia', 3),
('Salvador', 4),
('Feira de Santana', 4),
('Curitiba', 5),
('Londrina', 5),
('Florianópolis', 6),
('Joinville', 6),
('Porto Alegre', 7),
('Caxias do Sul', 7),
('Recife', 8),
('Olinda', 8),
('Fortaleza', 9),
('Caucaia', 9),
('Belém', 10),
('Ananindeua', 10),
('Goiânia', 11),
('Aparecida de Goiânia', 11),
('Vitória', 13),
('Vila Velha', 13),
('São Luís', 12);

INSERT INTO produtos(nome_produto,valor_produto,data_compra,id_cidade) VALUES
('Notebook', 3500.50, '2025-11-01', 1),
('Smartphone', 1999.99, '2025-11-02', 2),
('Teclado', 250.75, '2025-11-03', 3),
('Mouse', 120.00, '2025-11-01', 4),
('Monitor', 980.30, '2025-11-04', 5),
('Impressora', 600.00, '2025-11-05', 6),
('Cadeira', 450.50, '2025-11-02', 7),
('Mesa', 850.00, '2025-11-03', 8),
('Copo', 15.90, '2025-11-01', 9),
('Garrafa', 35.00, '2025-11-02', 10),
('Fone de ouvido', 199.99, '2025-11-03', 11),
('Cabo USB', 29.90, '2025-11-04', 12),
('SSD', 450.00, '2025-11-05', 13),
('HD externo', 550.50, '2025-11-01', 14),
('Ventilador', 300.00, '2025-11-02', 15),
('Ar-condicionado', 2500.00, '2025-11-03', 16),
('Geladeira', 3200.00, '2025-11-04', 17),
('Fogão', 1800.00, '2025-11-05', 18),
('Micro-ondas', 800.00, '2025-11-01', 19),
('Liquidificador', 250.00, '2025-11-02', 20),
('Batedeira', 350.00, '2025-11-03', 21),
('Cafeteira', 450.00, '2025-11-04', 22),
('Televisão', 3000.00, '2025-11-05', 23),	
('Roteador', 150.00, '2025-11-01', 24),
('Switch', 200.00, '2025-11-02', 25);


CREATE UNIQUE INDEX idx_estado ON estado(estado);

CREATE INDEX idx_cidade ON cidade(cidade);

CREATE INDEX idx_produtos on produtos(nome_produto);

SHOW INDEX FROM estado;

SELECT nome_produto,valor_produto FROM produtos WHERE valor_produto>2000;

UPDATE produtos SET valor_produto = valor_produto * 0.90 WHERE id_produto>=0;

CREATE VIEW view_produtos AS SELECT  nome_produto,valor_produto FROM produtos WHERE valor_produto >2000;

select * from view_produtos;

drop view view_produtos;


drop database penultimo_trabalho_mysql;

