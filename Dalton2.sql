create database  escola;
use escola;

create table tbcurso
(
codCurso int auto_increment not null primary key,
nomeCurso varchar(15),
cargahorariaCurso int (11),
valorCurso decimal(10,2)
);

create table tbturma(
codTurma int auto_increment not null primary key,
nomeTurma varchar (20),
codCurso int not null references tbcurso(codCurso),
horarioTurma Time);

create	table tbaluno(
codAluno int auto_increment not null primary key,
nomeAluno varchar (40),
dataNascimentoAluno datetime,
rgAluno varchar (15),
naturalidade varchar (2));

create table tbmatricula(
codMatricula int auto_increment not null primary key,
dataMatricula date,
codAluno int not null references tbturma (codTurma),
codTurma int not null references tbaluno(codAluno)); 

insert into tbaluno values(default,'Paulo Santos','2000-03-10','82.292.122-0','SP'),
(default,'Maria da Gloria','1999-10-03','45.233.123-0','SP'),
(default,'Perla Nogueira da Silva','1998-01-11','23.533.211-9','SP'),
(default,'Gilson Barros da Silva','1995-09-11','34.221.111-x','PE'),
(default,'Mariana Barbosa Santos','2001-07-1','54.222.122-9','RJ');

insert into tbCurso values(default,'Inglês',2000,356.00),
(default,'Francês',200,450.00),
(default,'Alemão',3000,478.00),
(default,'Espanhol',3000,600.00);

insert into tbturma values(default,'1IA',1,'12:00:00'),
(default,'1IB',1,'18:00:00'),
(default,'1FA',2,'19:00:00'),
(default,'1FB',2,'15:00:00'),
(default,'1AA',3,'18:00:00'),
(default,'1EA',4,'19:00:00');

insert into tbmatricula values(default,'2019/03/10',1,1),
(default,'2019/04/05',2,1),
(default,'2019/03/05',3,2),
(default,'2019/03/03',1,3),
(default,'2019/07/05',4,3),
(default,'2019/06/06',5,1),
(default,'2019/05/05',5,3);

select naturalidade, count(*) as 'quantidade alunos' from tbaluno group by naturalidade;
select naturalidade, count(*) as 'quantidade alunos' from tbaluno where naturalidade = 'SP';
select cargahorariaCurso, count(*) as 'quantidade de cursos' from tbcurso group by cargahorariaCurso;
select codTurma, count(*) as 'quantidade de matrículas por turma' from tbmatricula group by codTurma;
select codAluno, count(*) as 'quantidade de matrículas por aluno' from tbmatricula group by codAluno;
select codCurso, count(*) as 'quantidades de turma por curso' from tbTurma group by codCurso;

/* parte do teams */     
                                          
select * from tbAluno order by codAluno limit 2;
select * from tbCurso order by codCurso desc limit 2;
select valorCurso,nomeCurso from tbCurso order by valorCUrso desc limit 2;
select * from tbMatricula order by codMatricula desc limit 1;
select * from tbAluno where naturalidade = 'SP' limit 2;
 
 /*Ativ 2 */
select * from tbcurso where valorCurso = (select min(valorCurso) from tbcurso);
select * from tbcurso where valorCurso in (select max(valorCurso) from tbcurso);
select nomeTurma, horarioTurma from tbturma where horarioTurma in (select min(horarioTurma) from tbturma);
select * from tbcurso where valorCurso > (select avg(valorCurso) from tbcurso);
select * from tbmatricula where dataMatricula in (select max(dataMatricula) from tbmatricula);

/* ativ 3 */
set @numero := 3;
select * from tbaluno where codAluno = @numero;
set @contagem := (select count(*) from tbaluno);
select @contagem as "Total de Registros";

set @t1:=1,@t2:=2, @t3:=4;
select @t1,@t2,@t3, @t4 := @t1+@t2+@t3 as "Total";

set @diaria := 100.00; 
set @qtd_diarias := 5; 
set @taxa_servico := 8; 
set @total_diarias := @diaria * @qtd_diarias;
set @total_servico := (@total_diarias * @taxa_servico) / 100; 
set @total_a_pagar := @total_diarias + @total_servico;

select round(@total_a_pagar,2) as "Total a pagar";

set @taxa_desconto := 10;
select CodCurso, NomeCurso, cargahorariacurso, valorcurso, valorcurso-(valorcurso * (@taxa_desconto/100))
as valorCurso from tbcurso;	

/*
1. Como definimos variáveis no Mysql?

set @Nomevariavel := atribui seu valor;

2. explique a afirmação: O MySQL é insensível à caixa.
Pois quando digita por exemplo o id_cliente de um banco não se diferencia a ID_CLIENte 

3.Faça os exemplos apresentados na aula.
Estão presentes acima
*/

set @Naturalidade := "SP";
select * from tbaluno where naturalidade = @naturalidade;

set @contagem2 := (select count(codcurso) from tbturma where codcurso = 1);
select @contagem2 as "Total de matriculados em inglês";

set @nota1 := 10;
set @nota2 := 3;
set @nota3 := 7;
set @media := (@nota1 + @nota2 + @nota3)/3 ;
select @media;

select  NomeCurso, cargahorariacurso, valorcurso, cargahorariacurso/2 , valorcurso/2 from tbcurso;	




