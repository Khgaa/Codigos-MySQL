create database escola;

USE escola;

create table endereco(

   idEndereco int NOT NULL auto_increment primary key,
   pais varchar(45) NOT NULL,
   estado varchar(45) NOT NULL,
   cidade varchar(45) NOT NULL,
   bairro varchar(45) NOT NULL,
   rua varchar(45) NOT NULL
   
   );
   
create table professor(

   idProfessor int NOT NULL auto_increment primary key,
   nomeProfessor varchar(45) NOT NULL,
   cpfProfessor varchar(45) NOT NULL
   
   );
   
create table campus(

   idCampus int NOT NULL auto_increment primary key,
   nomeCampus varchar(45) NOT NULL,
   tipo varchar(45) NOT NULL,
   idEndereco int,
   constraint fk_idEndereco_campus foreign key(idEndereco)
   references Endereco(idEndereco)
   
   );
   
create table curso(

   idCurso int NOT NULL auto_increment primary key,
   nomeCurso varchar(45) NOT NULL,
   idCampus int,
   constraint fk_idCampus_curso foreign key(idCampus)
   references Campus(idCampus)
   
   );
   
create table aluno(

   idAluno int NOT NULL auto_increment primary key,
   nomeAluno varchar(45) NOT NULL,
   rg varchar(45) NOT NULL,
   matricula varchar(45) NOT NULL,
   idCurso int,
   idEndereco int,
   constraint fk_idCurso_aluno foreign key(idCurso)
   references Curso(idCurso),
   constraint fk_idEndereco_aluno foreign key(idEndereco)
   references Endereco(idEndereco)
   
   );
   
create table disciplina(

   idDisciplina int NOT NULL auto_increment primary key,
   nomeDisciplina varchar(45) NOT NULL
   
   );
   
create table telefone(

   idTelefone int NOT NULL auto_increment primary key,
   operadora varchar(45) NOT NULL,
   numero varchar(45) NOT NULL,
   idAluno int,
   idProfessor int,
   constraint fk_idAluno_telefone foreign key(idAluno)
   references Aluno(idAluno),
   constraint fk_idProfessor_telefone foreign key(idProfessor)
   references Professor(idProfessor)
   
   );
   
create table nota(

   idAluno int NOT NULL,
   idDisciplina int NOT NULL,
   constraint fk_idAluno_nota foreign key(idAluno)
   references Aluno(idAluno),
   constraint fk_idDisciplina_nota foreign key(idDisciplina)
   references Disciplina(idDisciplina),
   primary key(idAluno, idDisciplina)
   
   );
   
create table ensino(

   idProfessor int NOT NULL,
   idDisciplina int NOT NULL,
   constraint fk_idProfessor_ensino foreign key(idProfessor)
   references Professor(idProfessor),
   constraint fk_idDisciplina_ensino foreign key(idDisciplina)
   references Disciplina(idDisciplina),
   primary key(idProfessor, idDisciplina)
   
   );
   
                        -- INDEXES --
   
create index idx_idEndereco_id on Endereco(idEndereco);
create index idx_idProfessor_id on Professor(idProfessor);
create index idx_idCampus_id on Campus(idCampus);
create index idx_idTelefone_id on Telefone(idTelefone);
create index idx_idCurso_id on Curso(idCurso);
create index idx_idAluno_id on Aluno(idAluno);
create index idx_idDisciplina_id on Disciplina(idDisciplina);
create index idx_idAluno_id on Nota(idAluno);
create index idx_idDisciplina_id on Nota(idDisciplina);
create index idx_idProfessor_id on Ensino(idProfessor);
create index idx_idDisciplina_id on Ensino(idDisciplina);
   
   
   