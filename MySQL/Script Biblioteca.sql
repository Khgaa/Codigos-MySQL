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