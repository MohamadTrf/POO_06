drop table users;
CREATE TABLE users(
    cd_user Integer not null  GENERATED Always as identity (START WITH 1, INCREMENT BY 1),
    nm_user varchar(50) not null,
    nm_senha varchar(50) not null,
    nm_cargo varchar(20) not null,
    cd_nivel_permissao Integer not null,
    CONSTRAINT pk_cd_user PRIMARY KEY(cd_user)
);
select * from users;
INSERT into users(nm_user,nm_senha,nm_cargo,cd_nivel_permissao) VALUES ('Teste','12345678','Gerente',1);

drop table ponto;
create table ponto(
   cd_ponto Integer not null primary key GENERATED Always as identity (START WITH 1, INCREMENT BY 1),
   dt_ponto Date,
   hr_entrada time,
   hr_saida time,
   cd_user integer not null,
   constraint fk_cd_user FOREIGN KEY (CD_USER) references users
);

select * from ponto;
insert into ponto(dt_ponto,hr_entrada,hr_saida,cd_user) values('2019-04-10', '12:00:00','15:10:10',1);

create table cliente(
    cd_cliente Integer not null primary key GENERATED Always as identity (START WITH 1, INCREMENT BY 1),
    nm_cliente varchar(200) not null,
    nm_endereco varchar(210) not null,
    cd_cpf varchar(11) not null,
    nm_email varchar(80) not null
);

insert into cliente(nm_cliente,nm_endereco,cd_cpf,nm_email) values('Teste','TesteEnd','12345678911','teste@teste');

drop table fornecedor;
create table fornecedor(
    cd_fornecedor Integer not null primary key GENERATED Always as identity (START WITH 1, INCREMENT BY 1),
    nm_fornecedor varchar(200) not null ,
    nm_endereco varchar(210) not null
);

insert into fornecedor (nm_fornecedor,nm_endereco) values('Pinhal','SSP');


create table produto(
    cd_produto Integer not null primary key GENERATED Always as identity (START WITH 1, INCREMENT BY 1),
    nm_produto varchar(200) not null,
    qt_produto Integer not null,
    vl_custo Double  not null,
    vl_venda Double  not null,
    cd_fornecedor integer not null,
    constraint fk_cd_fornecedor FOREIGN KEY(cd_fornecedor) references fornecedor
);

insert into produto(nm_produto,qt_produto,vl_custo,vl_venda,cd_fornecedor) values('Porta',3,10.20,20.50,1);

drop table pedido;
create table pedido(
    cd_pedido Integer not null primary key GENERATED Always as identity (START WITH 1, INCREMENT BY 1),    
    dt_pedido Date,
    vl_total_pedido Double  not null,
    dt_entrega Date,
    cd_cliente integer not null,
    constraint fk_cliente_cd_cliente FOREIGN KEY (cd_cliente) references cliente
);

insert into pedido(dt_pedido,vl_total_pedido,dt_entrega,cd_cliente) values ('2017-04-10',12.40,'2019-08-10',1);

select * from pedido;
