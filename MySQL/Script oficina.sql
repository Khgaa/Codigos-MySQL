CREATE database oficina;
USE oficina;

create table empresa(

    idEmpresa int NOT NULL auto_increment primary key,
    nomeEmpresa varchar(120) NOT NULL,
    tipo varchar(45)
    
    );
    
    
create table departamento(
 
  idDepartamento int NOT NULL auto_increment primary key,
  nomeDepartamento varchar(45) NOT NULL,
  descricaoDepartamento varchar(100) NOT NULL,
  idEmpresa int NOT NULL,
  constraint fk_idEmpresa_departamento foreign key(idEmpresa)
  references Empresa(idEmpresa)
  
  );
  
  
create table endereco(

  idEndereco int NOT NULL auto_increment primary key,
  pais varchar(50) NOT NULL,
  estado varchar(50) NOT NULL,
  cidade varchar(50) NOT NULL,
  bairro varchar(50) NOT NULL,
  rua varchar(100) NOT NULL
  
  );
  
  
create table cliente(
   
   idCliente int NOT NULL auto_increment primary key,
   nomeCliente varchar(120) NOT NULL,
   cpfCliente varchar(11) NOT NULL,
   idEndereco int NOT NULL,
   constraint fk_idEndereco_cliente foreign key(idEndereco)
   references Endereco(idEndereco)
   
   );
   
   
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
  
  
create table servico(
   
   idServico int NOT NULL auto_increment primary key,
   nomeServico varchar(120) NOT NULL,
   recursos varchar(200) NOT NULL
   
   );
   
   
create table itens_OS(


    idOS int NOT NULL,
    idServico int NOT NULL,
    constraint fk_idOS_itens foreign key(idOS)
    references OS(idOS),
    constraint fk_idServico_itens foreign key(idServico)
    references Servico(idServico),
    primary key(idOS, idServico)
    
    );
    


							       -- INDEXES --

create index idx_idempresa_id on Empresa(idEmpresa);
create index idx_iddepartamento_id on Departamento(idDepartamento);
create index idx_idendereco_id on Endereco(idEndereco);
create index idx_idCliente_id on Cliente(idCliente);
create index idx_idfuncionario_id on Funcionario(idFuncionario);
create index idx_idtelefone_id on Telefone(idTelefone);
create index idx_idOS_id on OS(idOS);
create index idx_idServico_id on Servico(idServico);
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
  ("Brazil","Minas Gerais","Montes Claros","Centro","743-5961 Ac St."),
  ("Brazil","Pernambuco","Jaboatão dos Guararapes","Centro","670-4124 Est. Ave"),
  ("Brazil","Minas Gerais","Ipatinga","Centro","409-9804 Diam Ave"),
  ("Brazil","Maranhão","Timon","Centro","Ap #537-1597 Habitant Avenue"),
  ("Brazil","Paraíba","Campina Grande","Centro","837 Tempor Ave");

  
  INSERT INTO Funcionario (nomeFuncionario,cpfFuncionario,idEndereco,idDepartamento)
VALUES
  ("Rae Holmes",50223861907,1,1),
  ("Claudia Anthony",75823468874,1,1),
  ("Logan Lambert",39355260635,1,1),
  ("Jordan Franklin",99105162316,1,1),
  ("Madeson Valdez",70121329041,1,1);
  
  INSERT INTO Cliente (nomeCliente,cpfCliente,idEndereco)
VALUES
  ("Jennifer Bradford",34491918214,1),
  ("Karen Bernard",88718190327,1),
  ("Dieter Holt",44946181246,1),
  ("Whoopi Mcleod",59199868549,1),
  ("Aristotle Rich",16334356846,1);

  
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

                                     -- JOIN --

select s.nomeServico, d.nomeDepartamento, o.resposta from Servico s inner join Itens_OS i on (i.idServico = s.idServico) inner join OS o on (o.idOS = i.idOS) inner join departamento d on (d.idDepartamento = o.idDepartamento) and d.idDepartamento = 1;
select s.nomeServico, f.nomeFuncionario from Servico s INNER JOIN ITENS_OS i ON (i.idServico = s.idServico) INNER JOIN OS o ON (o.idOS = i.idOS) INNER JOIN Funcionario f ON (f.idFuncionario = o.idFuncionario);  
select s.nomeServico, c.nomeCliente from Servico s INNER JOIN ITENS_OS i ON (i.idServico = s.idServico) INNER JOIN OS o ON (o.idOS = i.idOS) INNER JOIN Cliente c ON (c.idCliente = o.idCliente);  
 
                                       -- FUNÇÕES --
                                       
SELECT
  count(numero)
FROM
  telefone
WHERE
  idCliente = 1 ;  
  
SELECT
  count(numero)
FROM
  telefone
GROUP BY
  idCliente = 1   
