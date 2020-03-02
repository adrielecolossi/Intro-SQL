--CREATE DATABASE aula1
--quando selecionamos com o mouse ele executa somente uma parte
--pgAdmin é o cliente

CREATE TABLE  Departamento 
(	CODDEPARTAMENTO serial, 
	NOME VARCHAR(100), 
	 CONSTRAINT "DepartamentoPK" PRIMARY KEY (CODDEPARTAMENTO)
) ;
CREATE TABLE Funcionario
(
	codFuncionario serial,
	codDepartamento integer,
	CPF varchar(15) UNIQUE, 
	Nome varchar(50) NOT NULL,
	Salario numeric(7,2) NOT NULL ,
	DataNascimento date,
	Sexo varchar(1),
	CONSTRAINT "FuncionarioPK" PRIMARY KEY (codFuncionario),
	CONSTRAINT "CheckSexo" CHECK (Sexo = 'M' or Sexo = 'F'),
	CONSTRAINT "FuncionarioFKDepartamento" FOREIGN KEY (codDepartamento)
		REFERENCES Departamento (codDepartamento)
		on delete set null
		on update cascade
);
SELECT * FROM departamento

--

INSERT INTO departamento(nome,coddepartamento)
 VALUES ('ensino',3)

--VALUES são as tuplas(linhas), elas sempre estão entre parênteses
--Se não disponibilizarmos valor, o próprio banco cria um valor com indificação unica(chave primaria)
-- Esse valor inicia com 1 e vai aumentando
--Quando chegar no 3, vai dar erro pois o valor ja existe 

INSERT INTO departamento (nome)
 VALUES ('pesquisa')

--LISTA DE EXERCICIOS

--QUESTÃO 1- Inserir 4 departamentos: TI, RH, Administração e Almox.

INSERT INTO departamento (nome)
  VALUES('TI'), ('RH'), ('Administração'), ('Almox')

--QUESTÃO 2- Insira um funcionário com nome João Matias, cpf 01243565478 e que nasceu em 28/5/1995. Ele deve trabalhar no departamento TI.

SELECT * FROM funcionario

--Há algumas com NOT NULL, então não podemos deixar vazio

--Se não tivermos um codFuncionario para específicarmos, basta não colocar isso entre os parênteses
--nem nos parênteses dentro do Values, ele vai acreditar que você deixou "null", mas como essa parte 
--já foi dito la em cima que é "not null", ele vai com um valor de default, que é o que falamos la no
--inicio 

INSERT INTO funcionario (codDepartamento, CPF, Nome, Salario, DataNascimento, Sexo)
  VALUES (4, '01243565478', 'João Matias', 1080,  '28/5/1995', 'M')

--QUESTÃO 3- Insira 3 funcionários (com dados diferentes) em cada departamento criado no exercício 1.

--Ensino era o de teste!
INSERT INTO funcionario (codDepartamento, CPF, Nome, Salario, DataNascimento, Sexo)
  VALUES (5, '01243565678', 'Adriele Colossi', 1081,  '04/07/2003', 'F')

INSERT INTO funcionario (codDepartamento, CPF, Nome, Salario, DataNascimento, Sexo)
  VALUES (6, '01243585678', 'Sabrina Freitas', 1082,  '03/03/2003', 'F')


INSERT INTO funcionario (codDepartamento, CPF, Nome, Salario, DataNascimento, Sexo)
  VALUES (7, '01243583678', 'Marina Fernandes', 1083,  '07/07/2002', 'F')

--QUESTÃO 4- Crio o departamento "P&D" e após aloque João Matias no P&D.

INSERT INTO departamento (nome)
VALUES('P&D')

--DELETE FROM funcionario WHERE sexo= 'M'

UPDATE funcionario SET codDepartamento=8
WHERE codDepartamento=4 

--DELETE FROM funcionario WHERE CPF= '01243584678'

   SELECT * FROM funcionario


--QUESTÃO 5- Altere o nome do departamento "Almox" para "Almoxarifado".

SELECT * FROM departamento

UPDATE departamento SET nome='Almoxarifado' WHERE nome='Almox'


--QUESTÃO 6- Em todos departamentos concatene a palavra "Depto " com o seu nome.


UPDATE departamento SET nome='Depto ' || nome 

--QUESTÃO 7- Mostre todos funcionários homens que trabalham no departamento de TI ou RH.

SELECT nome FROM funcionario WHERE sexo='M'

--QUESTÃO 8- Mostre apenas o nome e cpf dos funcionários com salários entre 2000 e 10000.

SELECT nome,  CPF FROM funcionario WHERE Salario>=2000 AND Salario<=10000

--QUESTÃO 9- Liste o nome e idade de todos funcionários.

SELECT nome, extract(year from age(datanascimento)) FROM funcionario

-- o extract e o year são para pegarmos apenas o ano, não os meses nem os dias junto.


--QUESTÃO 10- Mostre todos os funcionários do departamento 03.

UPDATE funcionario SET codDepartamento=3
WHERE codDepartamento=6 
SELECT nome FROM funcionario WHERE codDepartamento=3


--QUESTÃO 11- Exclua todos funcinários com mais de 50 anos.


INSERT INTO funcionario (codDepartamento, CPF, Nome, Salario, DataNascimento, Sexo)
  VALUES (3, '03253584678', 'Veio da Havan', 1000,  '01/10/1962', 'M')

SELECT nome, extract(YEAR FROM age(DataNascimento)) FROM funcionario

DELETE FROM funcionario WHERE EXTRACT(YEAR FROM age(DataNascimento))>= 50

--QUESTÃO 12- Faça um aumento de 10% para todas a mulheres.

UPDATE funcionario SET salario= salario*1.1 WHERE sexo= 'F'

-----OBSERVAÇÕES
SELECT age(date '05/07/1986')
--Pega o tempo atual e diminui a data considerada de nascimento, achando assim a idade
SELECT date_part('year', age(date '05/07/1986'))
--Indica apenas os anos, nesse caso 33 anos de diferença


--to_char converte data para string 
--to_date converte string pra data
--todos eles tem "máscaras", pattern, então temos HH, HH12, HH24, SSSS, US, YYYY (por exemplo, é o ano com 4 digitos)

SELECT to_char(date '05/07/1986', 'dd, mon yyyy')















