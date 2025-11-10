DROP TABLE aluno;
DROP TABLE disciplina;
DROP TABLE alunodisciplina;
DROP TABLE USUARIO;

CREATE TABLE aluno(
rgm INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50),
dt_nasc DATE NOT NULL );

CREATE TABLE disciplina(
codigo INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50),
numero_creditos INT NOT NULL);

CREATE TABLE alunodisciplina(
rgm INT NOT NULL,
codigo INT NOT NULL,
p1 INT,
p2 INT,
media DECIMAL(4,2),
faltas INT NOT NULL,
PRIMARY KEY(rgm,codigo),
CONSTRAINT fk_rgm_aluno FOREIGN KEY(rgm) REFERENCES aluno(rgm),
CONSTRAINT fk_codigo_disciplina FOREIGN KEY(codigo) REFERENCES disciplina(codigo)
);



INSERT INTO aluno(nome, dt_nasc) VALUES
('Ana Silva', '2001-05-12'),
('Bruno Costa', '2000-11-23'),														
('Carla Souza', '2002-03-15'),
('Diego Lima', '2001-08-30'),
('Elisa Rocha', '2000-12-05');
    
INSERT INTO disciplina(nome,numero_creditos) VALUES
('Matemática', 4),
('Física', 3),
('Química', 4),
('História', 2),
('Inglês', 3);
    
INSERT INTO alunodisciplina (rgm, codigo, p1, p2, media, faltas) VALUES
(1, 1, 8, 8, NULL, 2),  
(2, 2, 9, 9, NULL, 1),
(3, 3, 8, 9, NULL, 0),  
(4, 4, 5, 5, NULL, 3),  
(5, 5, 6, 6, NULL, 2);  


UPDATE alunodisciplina SET media=(p1+p2)/2 where rgm>=0;
select media from alunodisciplina;


ALTER TABLE aluno MODIFY nome VARCHAR(50) NOT NULL;


SELECT nome,numero_creditos FROM disciplina ORDER BY numero_creditos DESC,nome ASC;

ALTER TABLE disciplina DROP numero_creditos;

ALTER TABLE aluno ADD telefone BIGINT NOT NULL;

UPDATE aluno SET telefone="11948688286" WHERE rgm=1;
UPDATE aluno SET telefone="11948688286" WHERE rgm=2;
UPDATE aluno SET telefone="11948688286" WHERE rgm=3;
UPDATE aluno SET telefone="11948688286" WHERE rgm=4;
UPDATE aluno SET telefone="11948688286" WHERE rgm=5;

ALTER TABLE aluno change dt_nasc nascimento DATE NOT NULL;

select nascimento from aluno;

CREATE TABLE usuario(
rgm INT NOT NULL,
id_usuario CHAR(36) PRIMARY KEY NOT NULL,
login VARCHAR(50)NOT NULL,
senha VARCHAR(16) NOT NULL,
nivel_acesso ENUM("1","2","3") NOT NULL,
CONSTRAINT fk_codigo_aluno FOREIGN KEY (rgm) references aluno(rgm));


INSERT INTO usuario (rgm, id_usuario, login, senha, nivel_acesso)VALUES
(1, UUID(), 'anasilva', 'aninha123', '1'),
(2, UUID(), 'brunocosta', '75920163', '3'),
(3, UUID(), 'carlasouza', '48392017', '2'),
(4, UUID(), 'diego lima', 'diego020202', '1'),
(5, UUID(), 'elisarocha', '18473650', '1');

SELECT rgm,login FROM usuario WHERE nivel_acesso ='3' ORDER BY RGM ASC;



SELECT d.nome as nome_disciplina, count(ad.rgm) as alunos_quantidade
from disciplina d
join alunodisciplina ad on d.codigo=ad.codigo
group by d.nome
order by d.nome;

SELECT d.nome AS nome_disciplina, FORMAT(AVG(ad.media),2) AS notas_media
FROM disciplina d
JOIN alunodisciplina ad ON d.codigo=ad.codigo
GROUP BY d.nome
ORDER BY d.nome;

DELETE FROM usuario WHERE nivel_acesso='1';

SELECT nome, telefone FROM aluno ORDER BY nome

SET SQL_SAFE_UPDATES = 0;


select*from disciplina;


select*from alunodisciplina;

select*from usuario;

DROP TABLE aluno,disciplina,alunodisciplina,usuario;

SELECT nome, telefone FROM aluno ORDER BY nome;
