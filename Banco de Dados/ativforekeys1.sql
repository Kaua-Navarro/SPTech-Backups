create database atividadefk;

use atividadefk;

create table projeto (
idProjeto int primary key auto_increment,
nome varchar(45),
descricao varchar(120)
);

create table aluno (
raAluno int primary key,
nome varchar(45),
telefone char(12),
fkRepresentante int,
constraint fkAlunoRep foreign key (fkRepresentante)
references aluno(raAluno),
fkProjeto int not null,
constraint fkAlunoPro foreign key (fkProjeto)
references projeto(idProjeto));

drop table aluno;

insert into projeto values 
(default, "Projeto-IT", "Um projeto que monitora a temperatura de seus medicamentos."),
(default, "Freezeway", "Um projeto que monitora a temperatura de suas carnes."),
(default, "AMW", "Um projeto que monitora a umidade em ambientes como museus de arte ou história.");



insert into aluno values 
('3241069', 'Kauã Medrado', '11954811239', null, 1),
('3241073', 'Matheus Fermoselle', '11943211987', '3241069', 1),
('3241034', 'Diego Duran', '11987659087', '3241069', 1);

insert into aluno values 
('3241065', 'Mônica Leamari', '11956781134', null, 3),
('3241045', 'Pedro Vinicius', '11958292430', '3241065', 3),
('3241089', 'Felipe Leme', '11976547865', '3241065', 3);

insert into aluno values
('3241004', 'Carol Jaouiche', '11986541890', null, 2),
('3241001', 'Betina Goulart', '11953218721', '3241004', 2),
('3241012', 'Kauê Souza', '11978911990', '3241004', 2);



select * from projeto;
select * from aluno;

select aluno.*, projeto.* from aluno join projeto
on idProjeto = fkProjeto;

select raAluno,nome,telefone,fkRepresentante from aluno;

select aluno.*, projeto.* from aluno join projeto
on idProjeto = fkProjeto
where fkProjeto = 1;