create database oficina;

USE oficina;

create table empresa(

    idEmpresa int NOT NULL auto_increment primary key,
    nomeEmpresa varchar(120) NOT NULL,
    tipo varchar(45)
    
    );
    
create index idx_idempresa_id on Empresa(idEmpresa);
    
create table departamento(
 
  idDepartamento int NOT NULL auto_increment primary key,
  nomeDepartamento varchar(45) NOT NULL,
  descricaoDepartamento varchar(100) NOT NULL,
  idEmpresa int NOT NULL,
  constraint fk_idEmpresa_departamento foreign key(idEmpresa)
  references Empresa(idEmpresa)
  
  );
  
create index idx_iddepartamento_id on Departamento(idDepartamento);
  
create table endereco(

  idEndereco int NOT NULL auto_increment primary key,
  pais varchar(50) NOT NULL,
  estado varchar(50) NOT NULL,
  cidade varchar(50) NOT NULL,
  bairro varchar(50) NOT NULL,
  rua varchar(100) NOT NULL
  
  );
  
create index idx_idendereco_id on Endereco(idEndereco);
  
create table cliente(
   
   idCliente int NOT NULL auto_increment primary key,
   nomeCliente varchar(120) NOT NULL,
   cpfCliente varchar(11) NOT NULL,
   idEndereco int NOT NULL,
   constraint fk_idEndereco_cliente foreign key(idEndereco)
   references Endereco(idEndereco)
   
   );
   
create index idx_idCliente_id on Cliente(idCliente);
   
create table funcionario(
   
   idFuncionario int NOT NULL auto_increment primary key,
   nomeFuncionario varchar(120) NOT NULL,
   cpfFuncionario varchar(11) NOT NULL,
   idEndereco int NOT NULL,
   idDepartamento int NOT NULL,
   constraint fk_idDepartamento_funcionario foreign key(idDepartamento)
   references Departamento(idDepartamento),
   constraint fk_idEndereco_funcionario foreign key(idEndereco)
   references Endereco(idEndereco)
   
   );
   
create index idx_idfuncionario_id on Funcionario(idFuncionario);
  
create table telefone(

  idTelefone int NOT NULL auto_increment primary key,
  operadora varchar(50) NOT NULL,
  numero varchar(13) NOT NULL,
  idFuncionario int,
  idCliente int,
  constraint fk_idFuncionario_Telefone foreign key(idFuncionario)
  references Funcionario(idFuncionario),
  constraint fk_idCliente_Telefone foreign key(idCliente)
  references Cliente(idCliente)
  );
  
create index idx_idtelefone_id on Telefone(idTelefone);
   
  
create table OS(
   
   idOS int NOT NULL auto_increment primary key,
   dataSolicitacao varchar(10) NOT NULL,
   dataPrevisao varchar(10) NOT NULL,
   resposta varchar(45) NOT NULL,
   idFuncionario int NOT NULL,
   idDepartamento int NOT NULL,
   idCliente int NOT NULL,
   constraint fk_idFuncionario_OS foreign key(idFuncionario)
   references Funcionario(idFuncionario),
   constraint fk_idDepartamento_OS foreign key(idDepartamento)
   references Departamento(idDepartamento),
   constraint fk_idCliente_OS foreign key(idCliente)
   references Cliente(idCliente)
   
  
  );
  
create index idx_idOS_id on OS(idOS);
  
create table servico(
   
   idServico int NOT NULL auto_increment primary key,
   nomeServico varchar(120) NOT NULL,
   recursos varchar(200) NOT NULL
   
   );
   
create index idx_idServico_id on Servico(idServico);
   
create table itens_OS(


    idOS int NOT NULL,
    idServico int NOT NULL,
    constraint fk_idOS_itens foreign key(idOS)
    references OS(idOS),
    constraint fk_idServico_itens foreign key(idServico)
    references Servico(idServico),
    primary key(idOS, idServico)
    
    );
    
create index idx_idOS_id on Itens_OS(idOS);
create index idx_idservico_id on Itens_OS(idServico);


									-- VALUES --


INSERT INTO empresa (idEmpresa, nomeEmpresa, tipo) values (1, "PlanosCia", "Ar");
INSERT INTO departamento (idDepartamento, nomeDepartamento, descricaoDepartamento, idEmpresa) values (1, "Planos", "Reserve seus planos", 1);
INSERT INTO endereco (idEndereco, pais, estado, cidade, bairro, rua) values (1, "Brasil", "Bahia", "Salvador", "Limoeiro", "Rua do pão");
INSERT INTO endereco (idEndereco, pais, estado, cidade, bairro, rua) values (2, "Brasil", "São Paulo", "São Paulo", "Macieira", "Rua do grão");
INSERT INTO cliente (idCliente, nomeCliente, cpfCliente, idEndereco) values (1, "Juninho", "111.111.111-11", 1);
INSERT INTO funcionario (idFuncionario, nomeFuncionario, cpfFuncionario, idEndereco, idDepartamento) values (1, "Rogério", "222.222.222-22", 2, 1);
INSERT INTO telefone (operadora, numero, idCliente) values ("oi", "1111-1111", 1);
INSERT INTO OS (idOS, dataSolicitacao, dataPrevisao, resposta, idFuncionario, idDepartamento, idCliente) values (1, "1/2/2009", "18/9/3021", "não", 1, 1, 1);
INSERT INTO servico (idServico, nomeServico, recursos) values (1, "Planos para ti", "coisas");
INSERT INTO itens_OS (idOS, idServico) values (1, 1);


INSERT INTO Departamento (nomeDepartamento,descricaoDepartamento,idEmpresa)
VALUES
  ("in lobortis","Aliquam rutrum lorem ac risus.",1),
  ("egestas, urna","orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi",1),
  ("enim. Sed","quam dignissim pharetra. Nam ac nulla. In tincidunt",1),
  ("accumsan neque","velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum",1),
  ("consectetuer adipiscing","erat eget ipsum. Suspendisse",1),
  ("vitae, orci.","nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit",1),
  ("nisi sem","risus. Nulla eget metus eu erat semper",1),
  ("eu neque","id, blandit at, nisi. Cum",1),
  ("ipsum primis","lobortis augue scelerisque mollis. Phasellus libero",1),
  ("nulla. Integer","sapien. Nunc pulvinar arcu et pede. Nunc sed orci",1);
  
INSERT INTO Endereco (pais,estado,cidade,bairro,rua)
VALUES
  ("Praesent","orci. Phasellus dapibus quam quis","tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris.","ipsum","dui, nec tempus mauris"),
  ("eros turpis non enim. Mauris quis turpis vitae purus gravida","diam at pretium aliquet,","varius orci, in consequat enim diam vel arcu. Curabitur","nibh. Donec","consectetuer rhoncus. Nullam"),
  ("rhoncus. Nullam velit dui, semper et,","lorem. Donec elementum, lorem ut aliquam iaculis, lacus","dolor elit, pellentesque a, facilisis non, bibendum","arcu. Sed eu nibh vulputate mauris","fermentum metus. Aenean sed"),
  ("Fusce fermentum fermentum arcu. Vestibulum","erat volutpat. Nulla dignissim. Maecenas","habitant morbi tristique senectus","Quisque nonummy ipsum non arcu.","Cras interdum."),
  ("libero mauris, aliquam eu, accumsan sed, facilisis vitae,","Curabitur ut odio vel est","semper rutrum. Fusce dolor quam, elementum at,","fames","tristique senectus et netus et malesuada fames ac turpis"),
  ("quam. Pellentesque habitant morbi tristique senectus et","commodo auctor velit. Aliquam","laoreet posuere,","id ante dictum cursus. Nunc mauris elit,","enim. Curabitur massa. Vestibulum accumsan neque"),
  ("et pede. Nunc sed orci lobortis augue scelerisque mollis.","non magna. Nam","Duis a mi fringilla mi lacinia mattis.","nec, cursus a,","dis parturient montes, nascetur ridiculus"),
  ("augue eu tellus. Phasellus","in aliquet lobortis, nisi","habitant morbi tristique","Suspendisse aliquet,","ultrices posuere"),
  ("est mauris, rhoncus id, mollis nec,","tortor nibh sit amet orci. Ut sagittis lobortis","condimentum. Donec at arcu. Vestibulum ante ipsum primis","at auctor ullamcorper, nisl","mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla,"),
  ("sit amet,","mattis velit justo nec ante.","mollis non, cursus non, egestas a, dui. Cras pellentesque.","ut cursus luctus, ipsum leo elementum sem, vitae","egestas, urna justo faucibus lectus, a sollicitudin orci sem");
  
  INSERT INTO Funcionario (nomeFuncionario,cpfFuncionario,idEndereco,idDepartamento)
VALUES
  ("eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum",49639549749,1,1),
  ("diam. Proin dolor. Nulla semper tellus",27312017297,1,1),
  ("elit, dictum eu, eleifend",59586905135,1,1),
  ("metus sit amet ante. Vivamus non lorem vitae odio",54497665593,1,1),
  ("neque sed sem egestas blandit. Nam nulla",62061330118,1,1),
  ("eleifend vitae, erat. Vivamus nisi. Mauris",96670688598,1,1),
  ("nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus",82816986489,1,1),
  ("dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer",31272995859,1,1),
  ("Ut tincidunt vehicula risus. Nulla",51091731687,1,1),
  ("tempus",94523641392,1,1);
  
                                   -- SELECTS --
  
select * from Departamento;
select * from Empresa;
select * from Endereco;
select * from Telefone;
select * from Funcionario;
select * from Cliente;
select * from Servico;
select * from Itens_OS;
select * from OS;
select f.nomeFuncionario, o.dataSolicitacao, o.dataPrevisao, o.resposta from Funcionario f, OS o WHERE o.idFuncionario = f.idFuncionario;


                                   -- DROPS --
                                   
drop table Departamento;   
drop table Empresa;  
drop table Endereco;
drop table Telefone;
drop table Funcionario;
drop table Cliente;
drop table Servico;
drop table Itens_OS;
drop table OS;                                
