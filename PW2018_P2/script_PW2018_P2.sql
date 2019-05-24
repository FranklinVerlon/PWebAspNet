use server;
drop table usuario;
create table usuario(
	codigo Integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome varchar(50),
    email varchar(100),
    senha varchar(20)
); 

drop table cliente;
create table cliente(
codigo Integer 
NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome varchar(45),
dt_nascto varchar(11),
cpf varchar(11),
cidade varchar(30),
uf varchar(30),
telefone char(13),
celular varchar(14),
email varchar(100),
senha varchar(20),
conf_senha varchar(20)
);

insert into cliente values(1,'Lavinia Dias','1955-10-26','93313827152','Uberlândia','Minas Gerais','(31)97652615','(31)93458-7463','laviniacunhadias@gmail.com','261355','261355');
insert into usuario values(1,'Lavinia Dias','laviniacunhadias@gmail.com','261355');
insert into cliente values(2,'Eduardo Rocha','1984-04-26','95949399404','Ipatinga','Minas Gerais','(31)7869-3371','(31)93442-8431','eduardocunharocha@yahoo.com','250484','250484');
insert into usuario values(2,'Eduardo Rocha','eduardocunharocha@yahoo.com','250484');
insert into cliente values(3,'Calvin Lynam','1972-05-17','22554349975','Rio de Janeiro','Rio de Janeiro','(21)6355-9442','(21)94732-2732','calvinholyy@live.com','190572','190572');
insert into usuario values(3,'Calvin Lynam','calvinholyy@live.com','190572');
insert into cliente values(4,'Eduarda Araujo','2001-03-12','10237731800','Vila Velha','Espirito Santo','(27)2038-6460','(27)92038-3780','eduardarodriguesaraujo@hotmail.com','120301','120301');
insert into usuario values(4,'Eduarda Araujo','eduardarodriguesaraujo@hotmail.com','120301');
insert into cliente values(5,'Guilherme Dias','1972-07-30','41004537522','Formosa','Goias','(61)4684-7187','(61)92365-4564','fatecpwAds2016@outlook.com','300772','300772');
insert into usuario values(5,'Guilherme Dias','fatecpwAds2016@outlook.com','300772');

drop table uf;
create table uf(
	codigo INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	estado varchar(30)
);
insert into uf values(1,'Acre');
insert into uf values(2,'Alagoas');
insert into uf values(3,'Amapá');
insert into uf values(4,'Amazonas');
insert into uf values(5,'Bahia');
insert into uf values(6,'Ceará');
insert into uf values(7,'Distrito federal');
insert into uf values(8,'Espirito Santo');
insert into uf values(9,'Goias');
insert into uf values(10,'Maranhão');
insert into uf values(11,'Mato Grosso');
insert into uf values(12,'Mato Grosso do Sul');
insert into uf values(13,'Minas Gerais');
insert into uf values(14,'Paraiba');
insert into uf values(15,'Paraná');
insert into uf values(16,'Pernambuco');
insert into uf values(17,'Piauí');
insert into uf values(18,'Rio de Janeiro');
insert into uf values(19,'Rio Grande do Norte');
insert into uf values(21,'Rio Grande do Sul');
insert into uf values(22,'Rondônia');
insert into uf values(23,'Roraima');
insert into uf values(24,'Santa Catarina');
insert into uf values(25,'São Paulo');
insert into uf values(26,'Sergipe');
insert into uf values(27,'Tocantins');


select * from usuario;
select * from cliente;
select * from uf;
