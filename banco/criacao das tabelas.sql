CREATE TABLE aluno(
	id integer NOT NULL,
	nome varchar(200) NOT NULL,
	cpf varchar(11),
	sexo char(1),
	data_nascimento date,
	email varchar(300),
	serie integer
);

ALTER TABLE aluno ADD CONSTRAINT pk_aluno PRIMARY KEY(id);

CREATE generator aluno_id;

CREATE OR ALTER TRIGGER aluno_bi FOR aluno
BEFORE INSERT POSITION 0
AS 
BEGIN 
	NEW.id = gen_id("ALUNO_ID", 1);
END


CREATE TABLE professor(
	id integer NOT NULL,
	nome varchar(200) NOT NULL,
	cpf varchar(14),
	sexo char(1),
	data_nascimento date,
	email varchar(300),
	disciplina varchar(50)
)

ALTER TABLE professor ADD CONSTRAINT pk_professor PRIMARY KEY(id);

CREATE generator professor_id;

CREATE OR ALTER TRIGGER professor_bi FOR professor
BEFORE INSERT POSITION 0
AS 
BEGIN 
	NEW.id = gen_id("PROFESSOR_ID", 1);
END


CREATE TABLE professor_aluno(
	id_professor integer NOT NULL,
	id_aluno integer NOT NULL,
	ano integer,
	nota_primeiro_bimestre double PRECISION,
	nota_segunda_bimestre double PRECISION,
	nota_terceiro_bimestre double PRECISION,
	nota_quarto_bimestre double precision
)

ALTER TABLE professor_aluno ADD CONSTRAINT pk_professor_aluno PRIMARY KEY(id_professor, id_aluno);

ALTER TABLE professor_aluno ADD CONSTRAINT fk_aluno FOREIGN KEY(id_aluno) REFERENCES aluno(id);
ALTER TABLE professor_aluno ADD CONSTRAINT fk_professor FOREIGN KEY(id_professor) REFERENCES professor(id)
