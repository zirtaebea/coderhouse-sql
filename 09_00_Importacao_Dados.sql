use sakila;

CREATE TABLE produtos (
	id int not null auto_increment primary key,
    nome varchar(40) not null,
    existencia int not null default '0',
    preco float not null default '0',
    preco_compra float not null default '0'
);

select * from produtos;