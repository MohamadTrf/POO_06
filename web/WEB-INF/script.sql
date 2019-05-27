-- USUARIO
-- DROP TABLE usuario;
CREATE TABLE usuario(
    cd_usuario INTEGER NOT NULL GENERATED Always as identity (START WITH 1, INCREMENT BY 1),
    nm_usuario VARCHAR(50) NOT NULL,
    nm_senha VARCHAR(50) NOT NULL,
    nm_cargo VARCHAR(20) NOT NULL,
    cd_nivel_permissao INTEGER NOT NULL,
    CONSTRAINT pk_cd_usuario PRIMARY KEY(cd_usuario)
);
INSERT INTO  usuario(nm_usuario,nm_senha,nm_cargo,cd_nivel_permissao) VALUES ('Teste','12345678','Gerente',1);
-- 

-- PONTO
-- DROP TABLE ponto;
CREATE TABLE ponto(
   cd_ponto INTEGER NOT NULL PRIMARY KEY GENERATED Always as identity (START WITH 1, INCREMENT BY 1),
   dt_ponto DATE,
   hr_entrada TIME,
   hr_saida TIME,
   cd_usuario integer NOT NULL,
   CONSTRAINT fk_cd_usuario FOREIGN KEY (cd_usuario) references usuario
);
INSERT INTO ponto(dt_ponto,hr_entrada,hr_saida,cd_usuario) VALUES('2019-04-10', '12:00:00','15:10:10',1);
-- 

-- CLIENTE
CREATE TABLE cliente(
    cd_cliente INTEGER NOT NULL PRIMARY KEY GENERATED Always as identity (START WITH 1, INCREMENT BY 1),
    nm_cliente VARCHAR(200) NOT NULL,
    nm_endereco VARCHAR(210) NOT NULL,
    cd_cpf VARCHAR(11) NOT NULL,
    nm_email VARCHAR(80) NOT NULL
);
INSERT INTO cliente(nm_cliente,nm_endereco,cd_cpf,nm_email) VALUES('Teste','TesteEnd','12345678911','teste@teste');
-- 

-- FORNECEDOR
-- DROP TABLE fornecedor;
create table fornecedor(
    cd_fornecedor INTEGER NOT NULL PRIMARY KEY GENERATED Always as identity (START WITH 1, INCREMENT BY 1),
    nm_fornecedor VARCHAR(200) NOT NULL ,
    nm_endereco VARCHAR(210) NOT NULL
);
insert into fornecedor (nm_fornecedor,nm_endereco) values('Pinhal','SSP');
-- 

-- PRODUTO
CREATE TABLE produto(
    cd_produto INTEGER NOT NULL PRIMARY KEY GENERATED Always as identity (START WITH 1, INCREMENT BY 1),
    nm_produto VARCHAR(200) NOT NULL,
    qt_produto INTEGER NOT NULL,
    vl_custo DOUBLE  NOT NULL,
    vl_venda DOUBLE  NOT NULL,
    cd_fornecedor integer NOT NULL,
    CONSTRAINT fk_cd_fornecedor FOREIGN KEY(cd_fornecedor) references fornecedor
);
INSERT INTO produto(nm_produto,qt_produto,vl_custo,vl_venda,cd_fornecedor) values('Porta',3,10.20,20.50,1);
-- 

-- PEDIDO
-- DROP TABLE pedido;
CREATE TABLE pedido(
    cd_pedido INTEGER NOT NULL PRIMARY KEY GENERATED Always as identity (START WITH 1, INCREMENT BY 1),    
    dt_pedido DATE,
    vl_total_pedido DOUBLE  NOT NULL,
    dt_entrega DATE,
    cd_cliente integer NOT NULL,
    CONSTRAINT fk_cliente_cd_cliente FOREIGN KEY (cd_cliente) references cliente
);
INSERT INTO pedido(dt_pedido,vl_total_pedido,dt_entrega,cd_cliente) values ('2017-04-10',12.40,'2019-08-10',1);
-- 