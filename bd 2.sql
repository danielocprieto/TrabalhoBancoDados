create database exercicios;

create table cliente (
  cpf varchar(20) primary key,
  nome varchar(100) not null,
  dt_nasc date,
  email varchar(50)
);

create table produto (
  codigo serial primary key,
  nome varchar(50) not null,
  preco decimal(10,2),
  preco_unitario decimal(10,2)
);

create table categoria (
  codigo serial primary key,
  nome varchar(50) not null
);

create table pedido (
  numero serial primary key,
  data date,
  status varchar(20),
  cpf varchar(20),
  constraint fk_pedido_cliente foreign key (cpf) references cliente(cpf)
);

create table endereco (
  codigo serial primary key,
  rua varchar(50),
  cep varchar(9),
  cidade varchar(100),
  estado varchar(2),
  cpf varchar(20),
  constraint fk_endereco_cliente foreign key (cpf) references cliente(cpf)
);

create table item_pedido (
  codigo serial primary key,
  qtd int,
  total decimal(10,2),
  codigo_produto bigint unsigned,
  numero_pedido bigint unsigned,
  constraint fk_item_produto foreign key (codigo_produto) references produto(codigo),
  constraint fk_item_pedido foreign key (numero_pedido) references pedido(numero)
);

create table produto_categoria (
  codigo serial primary key,
  codigo_produto bigint unsigned,
  codigo_categoria bigint unsigned,
  constraint fk_prodcat_produto foreign key (codigo_produto) references produto(codigo),
  constraint fk_prodcat_categoria foreign key (codigo_categoria) references categoria(codigo)
);

insert into cliente (cpf, nome, dt_nasc, email) values
('11111111111', 'junior ferreira', '1990-05-10', 'juniorferreira@email.com');

insert into produto (nome, preco, preco_unitario) values
('notebook', 3500.00, 3500.00);

insert into categoria (nome) values
('informática');

insert into pedido (data, status, cpf) values
('2025-01-01', 'aberto', '11111111111');

insert into endereco (rua, cep, cidade, estado, cpf) values
('rua a, 123', '12345-000', 'são paulo', 'sp', '11111111111');

insert into item_pedido (qtd, total, codigo_produto, numero_pedido) values
(1, 3500.00, 1, 1);

insert into produto_categoria (codigo_produto, codigo_categoria) values
(1, 1);


ALTER TABLE cliente
ADD COLUMN telefone VARCHAR(20);

UPDATE cliente
SET telefone = '(11) 99999-9999'
WHERE cpf = '11111111111';

DELETE FROM item_pedido
WHERE codigo = 1;

SELECT p.numero AS numero_pedido, p.data, p.status, c.nome AS nome_cliente
FROM pedido p
INNER JOIN cliente c ON p.cpf = c.cpf;

SELECT c.nome, p.numero AS numero_pedido, p.status
FROM cliente c
LEFT JOIN pedido p ON c.cpf = p.cpf;

SELECT c.nome, p.numero AS numero_pedido, p.status
FROM cliente c
RIGHT JOIN pedido p ON c.cpf = p.cpf;



