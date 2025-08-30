

create database trabalho;
drop database trabalho;

create table cidades(
	id_cidade int auto_increment primary key,
    cidade varchar(50)not null
);
    
create table fornecedores(
	id_fornecedor int auto_increment primary key,
    nome_fornecedor varchar(50)not null,
    id_cidade int,
    foreign key(id_cidade) references cidades(id_cidade)
);

create table encomendas(
	id_encomenda int auto_increment primary key,
    data_encomenda date not null,
    id_fornecedor int,
    foreign key(id_fornecedor) references fornecedores(id_fornecedor)
);
    
create table produtos(
	id_produto int auto_increment primary key,
    produto varchar(50)
);

create table produtosEncomendas(
	id_encomenda int,
    id_produto int,
    quantidade int,
    primary key(id_encomenda,id_produto),
    foreign key(id_encomenda) references encomendas(id_encomenda),
    foreign key(id_produto) references produtos(id_produto)
);


insert into cidades(id_cidade,cidade)values
(1, 'São Paulo'),
(2, 'Rio de Janeiro'),
(3, 'Belo Horizonte'),
(4, 'Salvador'),
(5, 'Fortaleza'),
(6, 'Curitiba'),
(7, 'Manaus'),
(8, 'Recife'),
(9, 'Porto Alegre'),
(10, 'Brasília'),
(11, 'Goiânia'),
(12, 'Belém'),
(13, 'Campinas'),
(14, 'Vitória'),
(15, 'Natal');

insert into produtos(id_produto,produto)values
(1, 'Notebook HP'),
(2, 'Teclado Gamer'),
(3, 'Mouse Óptico'),
(4, 'Monitor 24"'),
(5, 'Cadeira Gamer'),
(6, 'Mesa Escritório'),
(7, 'Smartphone X'),
(8, 'Fone Bluetooth'),
(9, 'Impressora'),
(10, 'Pen Drive 64GB'),
(11, 'Webcam HD'),
(12, 'Roteador WiFi'),
(13, 'SSD 1TB'),
(14, 'HD Externo 2TB'),
(15, 'Câmera Digital');

insert into fornecedores(id_fornecedor,nome_fornecedor,id_cidade)values
(1, 'Casa do Papel', 1),
(2, 'TecnoStore', 2),
(3, 'Alimentos Bom Sabor', 1),
(4, 'ConstruMais', 3),
(5, 'Moda & Cia', 2),
(6, 'SuperMóveis', 4),
(7, 'Farmácia Vida', 3),
(8, 'EletroFácil', 5),
(9, 'AutoPeças Brasil', 6),
(10, 'Brinquedos & Cia', 7),
(11, 'Livraria Saber', 5),
(12, 'TecFashion', 6),
(13, 'Doces & Companhia', 1),
(14, 'Papelaria Criativa', 2),
(15, 'Bebidas e Cia', 7);

insert into encomendas(id_encomenda,data_encomenda,id_fornecedor)values
(1, '2025-08-01', 1),
(2, '2025-08-01', 2),
(3, '2025-08-02', 1),
(4, '2025-08-03', 3),
(5, '2025-08-03', 4),
(6, '2025-08-04', 2),
(7, '2025-08-05', 5),
(8, '2025-08-05', 6),
(9, '2025-08-06', 1),
(10, '2025-08-06', 7),
(11, '2025-08-07', 3),
(12, '2025-08-07', 8),
(13, '2025-08-08', 9),
(14, '2025-08-08', 10),
(15, '2025-08-09', 2);

insert into produtosencomendas(id_produto,id_encomenda,quantidade)values
(1, 1, 10),
(2, 1, 5),
(3, 2, 12),
(4, 2, 8),
(5, 3, 7),
(6, 3, 15),
(7, 4, 20),
(8, 5, 12),
(9, 5, 10),
(10, 6, 14),
(11, 7, 9),
(12, 8, 11),
(13, 9, 16),
(14, 10, 5),
(15, 11, 8);

DESCRIBE cidades;
DESCRIBE fornecedores;
DESCRIBE produtos;
DESCRIBE encomendas;
DESCRIBE produtosEncomendas;

SELECT * FROM cidades;
SELECT * FROM fornecedores;
SELECT * FROM produtos;
SELECT * FROM encomendas;
SELECT * FROM produtosEncomendas;









