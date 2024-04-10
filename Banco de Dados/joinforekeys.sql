create database sisa;
use sisa;

create table empresa (
idEmpresa int primary key auto_increment,
nome varchar(45),
responsavel varchar(45)
);

insert into empresa values
(default, 'STEFANINI', 'DANIELA'),
(default, 'C6BANK', 'VANESSA');

SELECT * FROM empresa;

create table aluno(
ra char(8) primary key,
nome varchar(45),
bairro varchar(45),
fkEmpresa int not null,
constraint fkAlunoEmpresa foreign key (fkEmpresa)
	references empresa(idEmpresa));
    
desc aluno;

insert into aluno values 
('03241069', 'Kauã', 'Vila Industrial', 2),
('03241068', 'Mônica', 'Tamanduateí', 1),
('03241053', 'Pedro Vinicius', 'São Mateus', 2);

select * from aluno;

-- PRIMEIRO JOIN
-- EXIBIR ALUNOS E SUAS RESPECTIVAS EMPRESAS

select * from aluno inner join empresa
	on fkEmpresa = idEmpresa;
    
select bairro, responsavel from aluno inner join empresa
	on idEmpresa = fkEmpresa;
    
select aluno.nome, empresa.nome from aluno join empresa
	on idEmpresa = fkEmpresa;
    
select aluno.nome as NomeAluno,
	empresa.nome as NomeEmpresa
	from aluno join empresa
	on idEmpresa = fkEmpresa;

select a.nome as 'Nome do Aluno',
	e.nome as 'Nome da Empresa'
	from aluno as a join empresa as e
	on e.idEmpresa = a.fkEmpresa
    where e.nome = 	'STEFANINI';
    
