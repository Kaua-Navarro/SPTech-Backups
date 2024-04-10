use sprint2;

-- Exercicio 1
create table Pais(
idPais int primary key auto_increment,
nome varchar(30),
capital varchar(30));

insert into Pais values
(default, 'Russia', 'Moscow'),
(default, 'Brasil', 'Brasilia'),
(default, 'Suiça', 'Berna'),
(default, 'Japão', 'Tokyo');

create table Atleta(
idAtleta int primary key auto_increment,
nome varchar(30),
modalidade varchar(40),
qtdMedalha int,
fkPais int not null,
	constraint fkAtletaPais foreign key (fkPais)
    references Pais(idPais));
    
insert into Atleta values
(default, 'Mônica', 'Natação', '56', 1),
(default, 'Kauã', 'Skate', '98', 1),
(default, 'Pedro Vini', 'Vôlei', '1', 2),
(default, 'Samuel', 'Skate', '87', 4),
(default, 'Eduardo Azedo', 'Vôlei', '9', 1),
(default, 'Yasmin', 'Natação', '58', 3);

update Atleta set fkPais = 4
where idAtleta = 1;

update Atleta set fkPais = 4
where idAtleta = 2;

update Atleta set fkPais = 4
where idAtleta = 6;

update Atleta set fkPais = 3
where idAtleta = 3;

update Atleta set fkPais = 2
where idAtleta = 4;

update Atleta set fkPais = 2
where idAtleta = 5;

select * from Atleta inner join Pais
on fkPais = idPais;

select a.nome as 'Nome do Atleta',
	p.nome as 'Nome do País'
	from Atleta as a join Pais as p
	on p.idPais = a.fkPais;
    
select Atleta.*, Pais.nome from Atleta join Pais
	on Pais.idPais = Atleta.fkPais
    where capital = 'Tokyo';
    
-- Exercício 2

create table Album(
idAlbum int primary key auto_increment,
nome varchar(45),
tipo char(8),
dtLancamento date);

insert into album values
(default, 'Dos Prédios Deluxe', 'Trap', '2023-03-25'),
(default, 'Bocas Ordinárias', 'Rock', '1995-04-20');

select * from album;

create table Musica(
idMusica int primary key auto_increment,
titulo varchar(40),
artista varchar(40),
genero varchar(40),
fkAlbum int,
constraint fkMusicaAlbum foreign key (fkAlbum)
references album(idAlbum));

alter table musica modify column fkAlbum int not null;

insert into musica values
(default, 'Mandraka pt2', 'Veigh', 'Trap', 1),
(default, 'Eu e meus manos', 'Veigh', 'Trap', 1),
(default, 'Bandana pt2', 'Veigh', 'Trap', 1),
(default, 'Como Tudo Deve Ser', 'CBJR', 'Rock', 2),
(default, 'Hoje sou eu quem não mais te quero', 'CBJR', 'Rock', 2),
(default, 'Samba triste', 'CBJR', 'Rock', 2);

select * from album;
select * from musica;

update Musica set fkAlbum = 2
where idMusica in (1,2,3);

update Musica set fkAlbum = 1
where idMusica in (4,5,6);

select * from musica join Album
on idAlbum = fkAlbum;

select Musica.titulo, Album.nome from musica join Album
on idAlbum = fkAlbum;

select Musica.*, Album.nome from musica join Album
on idAlbum = fkAlbum;