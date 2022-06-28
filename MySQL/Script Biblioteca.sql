create database biblioteca;

USE biblioteca;

create table bibliotecario(

   idBibliotecario int NOT NULL auto_increment primary key,
   nomeBibliotecario varchar(45) NOT NULL,
   cpfBibliotecario varchar(45) NOT NULL,
   emailBibliotecario varchar(45) NOT NULL,
   login varchar(45) NOT NULL,
   senha varchar(45) NOT NULL
   
   );
   
create table endereco(

   idEndereco int NOT NULL auto_increment primary key,
   pais varchar(45) NOT NULL,
   estado varchar(45) NOT NULL,
   cidadeEndereco varchar(45) NOT NULL,
   bairro varchar(45) NOT NULL,
   rua varchar(45) NOT NULL
   
   );
   
create table usuario(

   idUsuario int NOT NULL auto_increment primary key,
   nomeUsuario varchar(45) NOT NULL,
   emailUsuario varchar(45) NOT NULL,
   matricula varchar(45) NOT NULL,
   rg varchar(45) NOT NULL,
   idEndereco int,
   constraint fk_idEndereco_usuario foreign key(idEndereco)
   references Endereco(idEndereco)
   
   );
   
create table autor(

   idAutor int NOT NULL auto_increment primary key,
   nomeAutor varchar(45) NOT NULL
   
   );
   
create table locacao(

   idLocacao int NOT NULL auto_increment primary key,
   dataLocacao varchar(45) NOT NULL,
   dataDevolucao varchar(45) NOT NULL,
   observacaoDevolucao varchar(45) NOT NULL,
   idUsuario int,
   idBibliotecario int,
   constraint fk_idUsuario_locacao foreign key(idUsuario)
   references Usuario(idUsuario),
   constraint fk_idBibliotecario_locacao foreign key(idBibliotecario)
   references Bibliotecario(idBibliotecario)
   
   );
   
create table telefone(

   idTelefone int NOT NULL auto_increment primary key,
   operadora varchar(45) NOT NULL,
   numero varchar(45) NOT NULL,
   idUsuario int,
   constraint fk_idUsuario_telefone foreign key(idUsuario)
   references Usuario(idUsuario)
   
   );
   
create table editora(

   idEditora int NOT NULL auto_increment primary key,
   nomeEditora varchar(45) NOT NULL,
   emailEditora varchar(45) NOT NULL,
   cidadeEditora varchar(45) NOT NULL,
   idTelefone int,
   constraint fk_idTelefone_editora foreign key(idTelefone)
   references Telefone(idTelefone)
   
   );
   
create table exemplar(

   idExemplar int NOT NULL auto_increment primary key,
   titulo varchar(45) NOT NULL,
   categoria varchar(45) NOT NULL,
   anoDePublicacao varchar(45) NOT NULL,
   idUsuario int,
   idEditora int,
   constraint fk_idUsuario_exemplar foreign key(idUsuario)
   references Usuario(idUsuario),
   constraint fk_idEditora_exemplar foreign key(idEditora)
   references Editora(idEditora)
   
   );
   
create table reserva(

   idReserva int NOT NULL auto_increment primary key,
   dataReserva varchar(45) NOT NULL,
   situacaoReserva varchar(45) NOT NULL,
   idUsuario int,
   idExemplar int,
   constraint fk_idUsuario_reserva foreign key(idUsuario)
   references Usuario(idUsuario),
   constraint fk_idExemplar foreign key(idExemplar)
   references Exemplar(idExemplar)
   
   );
   
create table obra(

   idAutor int NOT NULL,
   idExemplar int NOT NULL,
   constraint fk_idAutor_obra foreign key(idAutor)
   references Autor(idAutor),
   constraint fk_idExemplar_obra foreign key(idExemplar)
   references Exemplar(idExemplar),
   primary key(idAutor, idExemplar)
   
   );
   
                           -- INDEXES --
   
create index idx_idBibliotecario_id on Bibliotecario(idBibliotecario);
create index idx_idUsuario_id on Usuario(idUsuario);
create index idx_idEndereco_id on Endereco(idEndereco);
create index idx_idTelefone_id on Telefone(idTelefone);
create index idx_idExemplar_id on Exemplar(idExemplar);
create index idx_idEditora_id on Editora(idEditora);
create index idx_idAutor_id on Autor(idAutor);
create index idx_idLocacao_id on Locacao(idLocacao);
create index idx_idReserva_id on Reserva(idReserva);
create index idx_idAutor_id on Obra(idAutor);
create index idx_idExemplar_id on Obra(idExemplar);
                            
                            -- VALUES --
                            
INSERT INTO Bibliotecario (nomeBibliotecario,cpfBibliotecario,emailBibliotecario,login,senha)
VALUES
  ("Shad Espinoza",70223070073,"shadespinoza1472@gmail.com","arcu.",783870),
  ("Sylvester Russo",28957761045,"sylvesterrusso7429@hotmail.com","ac",352839),
  ("Yvette Pollard",62766873009,"yvettepollard8444@hotmail.com","cursus",446759),
  ("Bell Fleming",37975803984,"bellfleming@yahoo.com","imperdiet",806684),
  ("Brielle Dawson",76440402945,"brielledawson8336@hotmail.com","Quisque",502682);
  
  INSERT INTO Endereco (pais,estado,cidadeEndereco,bairro,rua)
VALUES
  ("Brazil","Pernambuco","Paulista","Centro","P.O. Box 562, 1337 Neque Av."),
  ("Brazil","Paraná","Curitiba","Centro","5948 Ac Av."),
  ("Brazil","Santa Catarina","São José","Centro","2880 Augue St."),
  ("Brazil","Maranhão","Timon","Centro","P.O. Box 993, 2110 Et Rd."),
  ("Brazil","Goiás","Águas Lindas de Goiás","Centro","Ap #994-3085 Purus Ave");
  
  INSERT INTO Usuario (nomeUsuario,emailUsuario,matricula,rg,idEndereco)
VALUES
  ("Ramona Wolfe","ramonawolfe@hotmail.com",87693734,4292426906,1),
  ("Isaiah Crane","isaiahcrane4654@gmail.com",62115619,6171588864,2),
  ("Kadeem Rich","kadeemrich@yahoo.com",83774250,7013375708,3),
  ("Samuel Herrera","samuelherrera@yahoo.com",38599516,4933215271,4),
  ("Kaseem Callahan","kaseemcallahan@hotmail.com",91656874,6406841310,5);
  
  INSERT INTO Autor (nomeAutor)
VALUES
  ("Ifeoma Rodgers"),
  ("Carl Alford"),
  ("Hope Tucker"),
  ("Danielle Carson"),
  ("Rhiannon Mckenzie");
  
  INSERT INTO Locacao (dataLocacao,dataDevolucao,observacaoDevolucao,idUsuario,idBibliotecario)
VALUES
  ("23 Jun 2021","30 Jul 2021","No prazo",1,1),
  ("2 Jun 2021","21 Jul 2021","No prazo",2,2),
  ("27 Jun 2021","25 Jul 2021","No prazo",3,3),
  ("20 Jun 2021","13 Jul 2021","No prazo",4,4),
  ("16 Jun 2021","17 Jul 2021","No prazo",5,5);

INSERT INTO Telefone (operadora,numero,idUsuario)
VALUES
  ("Tim","(060) 98731-4878",1),
  ("Oi","(028) 90320-2228",2),
  ("Tim","(029) 93386-7813",3),
  ("Claro","(077) 91702-4716",4),
  ("Claro","(049) 92563-9836",5),
  ("Vivo","(075) 94604-5568"),
  ("Vivo","(021) 96293-4547"),
  ("Oi","(089) 94515-1325"),
  ("Oi","(054) 96624-5132"),
  ("Claro","(064) 93036-2755");
  
  INSERT INTO Editora (nomeEditora,emailEditora,cidadeEditora,idTelefone)
VALUES
  ("Tempus PC","dolor.sit.amet@yahoo.com","Cajazeiras",6),
  ("Et Industries","enim.mauris@hotmail.com","Açailândia",7),
  ("Quisque Corporation","erat.vitae.risus@hotmail.com","Guarapuava",8),
  ("Nec Orci PC","semper.tellus@hotmail.com","Itajaí",9),
  ("Ac Ipsum Ltd","tellus.lorem.eu@yahoo.com","Ribeirão Preto",10);
  
  INSERT INTO Exemplar (titulo,categoria,anoDePublicacao,idUsuario,idEditora)
VALUES
  ("A Máquina","Ficção","2016",1,1),
  ("Napoleão,","História","2018",2,2),
  ("O Beijo","Romance","2016",3,3),
  ("O Tesouro Perdido","Aventura","2019",4,4),
  ("Erros de Português","Português","2019",5,5);
  
  INSERT INTO Reserva (dataReserva,situacaoReserva,idUsuario,idExemplar)
VALUES
  ("23 Jun 2022","Em Reserva",1,1),
  ("9 Jun 2022","Em Reserva",2,2),
  ("12 Jun 2022","Em Reserva",3,3),
  ("20 Jun 2022","Em Reserva",4,4),
  ("16 Jun 2022","Em Reserva",5,5);

INSERT INTO Obra (idAutor,idExemplar)
VALUES
  (1,1),
  (2,2),
  (3,3),
  (4,4),
  (5,5);
  
                                 -- SELECTS --
                                 
select * from Bibliotecario;
select * from Endereco;
select * from Usuario;
select * from Telefone;
select * from Editora;
select * from Exemplar;
select * from Reserva;
select * from Autor;
select * from Obra;
select * from Locacao;

                                   -- DROPS --
                                   
drop table Bibliotecario;
drop table Endereco;
drop table Usuario;
drop table Telefone;
drop table Editora;
drop table Exemplar;
drop table Reserva;
drop table Autor;
drop table Obra;
drop table Locacao;
