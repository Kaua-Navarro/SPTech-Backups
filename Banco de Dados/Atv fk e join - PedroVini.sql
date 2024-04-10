create database sprint22;
use sprint22;

create table album (
idAlbum int primary key auto_increment,
nome varchar(45),
tipo varchar(45),
dtLancamento date);

create table musica (
idMusica int primary key auto_increment,
titulo varchar(40),
artista varchar(40),
genero varchar(40),
fkAlbum int,
constraint fkMusicaAlbum foreign key (fkAlbum)
references album (idAlbum)
);

insert into musica values
(default, 'astrothunder', 'travis scott', 'trap',4),
(default, 'mafia', 'travis scott', 'trap', 5),
(default, '5 minutes alone', 'pantera', 'rock',6);

alter table album add constraint chkTipo
check (tipo in ('digital', 'fisico'));

insert into album values
(default, 'astroworld', 'digital', '2018-08-03'),
(default, 'escape plan', 'fisico', '2015-04-12'),
(default, 'far beyond driver', 'fisico', '1994-05-23');

select * from musica inner join album
on idAlbum = fkAlbum;

update musica set fkAlbum = 5
where idMusica = 1;

update musica set fkAlbum = 6
where idMusica = 2;

update musica set fkAlbum = 4
where idMusica = 3;

select * from musica inner join album
on idAlbum = fkAlbum;

select titulo from musica inner join album
on idAlbum = fkAlbum;

select Musica.titulo, Album.nome from musica inner join album
on idAlbum = fkAlbum;

select Musica.*, Album.nome from musica inner join album
on idAlbum = fkAlbum;

