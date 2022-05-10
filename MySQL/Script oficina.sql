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
  
