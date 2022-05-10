create database escola;

USE escola;

create table Turma(
        id_Turma int NOT NULL auto_increment,
        nome_Turma varchar(50) NOT NULL
);

create index idx_idTurma_id on Turma(idTurma);

create table Aluno(
	    id_Aluno int NOT NULL auto_increment primary key,
        nome varchar(50) NOT NULL,
        endereco varchar(100) NOT NULL,
        cpf varchar(20) NOT NULL,
        rg varchar(20) NOT NULL,
        id_turma int NOT NULL,
        constraint fk_idturma_aluno foreign key(id_turma)
        references Turma(id_turma)
);

create index idx_idAluno_id on Aluno(idAluno);
