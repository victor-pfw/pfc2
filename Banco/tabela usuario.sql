CREATE TABLE usuario
(
  id_usuario serial NOT NULL,
  email varchar(30) NOT NULL,
  login varchar(10) NOT NULL,
  senha varchar(10)  NOT NULL,
  perfil varchar(20)  NOT NULL,
  ativo boolean,
  CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario)
);



CREATE TABLE reserva 
(
id_reserva serial NOT NULL,

nome varchar(30) NOT NULL,
email VARCHAR(30) NOT NULL,
telefone VARCHAR(20) NOT NULL,
data_reserva date   NOT NULL,
hora_reserva time NOT NULL,
quantidade_pessoa varchar(10) NOT NULL,
ativo boolean,

Fk_key int,


CONSTRAINT reserva_pkey PRIMARY KEY(id_reserva),
CONSTRAINT FK_reserva_pkey FOREIGN KEY (Fk_key) REFERENCES usuario(id_usuario)

);


CREATE TABLE lugares
(
id_lugares serial NOT NULL,
quantidade int,
CONSTRAINT lugares_pkey PRIMARY KEY (id_lugares)
);



select*from usuario
select*from reserva
select*from lugares


insert into lugares (quantidade) values (0)
insert into usuario (email,login,senha,perfil,ativo)values('victor-pfw@hotmail.com','pfc','123456','ADMINISTRADOR',true);

drop table usuario cascade
drop table comentario
drop table reserva
drop table lugares

delete  from usuario cascade
delete  from reserva



