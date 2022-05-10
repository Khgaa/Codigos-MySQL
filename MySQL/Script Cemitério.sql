
create database cemiterio;

USE cemiterio;

create table proprietario(

   idProprietario int NOT NULL auto_increment primary key,
   nomeProprietario varchar(45) NOT NULL,
   cpfProprietario varchar(45) NOT NULL
   
   );
   
create index idx_idProprietario_id on Proprietario(idProprietario);
   
create table quadra(

   idQuadra int NOT NULL auto_increment primary key,
   nomeQuadra varchar(45) NOT NULL,
   numeroQuadra varchar(45) NOT NULL,
   metragem varchar(45) NOT NULL
   
   );
   
create index idx_idQuadra_id on Quadra(idQuadra);
   
create table lote(

   idLote int NOT NULL auto_increment primary key,
   nomeLote varchar(45) NOT NULL,
   statusLote varchar(45) NOT NULL,
   statusCompra varchar(45) NOT NULL,
   idProprietario int,
   constraint fk_idProprietario_lote foreign key(idProprietario)
   references Proprietario(idProprietario)
   
   );
   
create index idx_idLote_id on Lote(idLote);
   
create table jazigo(

   idJazigo int NOT NULL auto_increment primary key,
   nomeJazigo varchar(45) NOT NULL,
   statusJazigo varchar(45) NOT NULL,
   dataObito varchar(45) NOT NULL,
   dataEnterro varchar(45) NOT NULL,
   dataNascimento varchar(45) NOT NULL,
   grauParentesco varchar(45) NOT NULL,
   idQuadra int,
   idLote int,
   idProprietario int,
   constraint fk_idProprietario_jazigo foreign key(idProprietario)
   references Proprietario(idProprietario),
   constraint fk_idQuadra_jazigo foreign key(idQuadra)
   references Quadra(idQuadra),
   constraint fk_idLote_jazigo foreign key(idLote)
   references Lote(idLote)
   
   );
   
create index idx_idJazigo_id on Jazigo(idJazigo);
