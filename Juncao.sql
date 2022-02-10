create database juncao;
use juncao;

CREATE TABLE Profissao ( 
Cod_Profissao INT NOT NULL AUTO_INCREMENT, 
Nome_Profissao VARCHAR (60) NOT NULL, 
PRIMARY KEY (Cod_Profissao) );

CREATE TABLE Cliente (
Cod_Cliente INT NOT NULL AUTO_INCREMENT,
Nome_Cliente VARCHAR (60) NOT NULL,
Data_Nascimento DATE,
Telefone CHAR (9),
Cod_Profissao INT,
PRIMARY KEY (Cod_Cliente) ,
FOREIGN KEY (Cod_Profissao)
REFERENCES Profissao(Cod_Profissao)); 

INSERT INTO Profissao (Nome_Profissao) VALUES ('Programador');
INSERT INTO Profissao (Nome_Profissao) VALUES ('Analista de BD');
INSERT INTO Profissao (Nome_Profissao) VALUES ('Suporte');
INSERT INTO Profissao (Nome_Profissao) VALUES ('Estagiario');

select * from Profissao;

INSERT INTO Cliente (Nome_Cliente, Data_Nascimento, Telefone, Cod_Profissao)  VALUES ('João Pereira','1980-09-20','3456-7890',1);
INSERT INTO Cliente (Nome_Cliente, Data_Nascimento, Telefone, Cod_Profissao)  VALUES ('Maria Barros','1972-01-22','3456-7891',2);
INSERT INTO Cliente (Nome_Cliente, Data_Nascimento, Telefone, Cod_Profissao) VALUES ('José Mendes','1983-04-29','3456-7892',3);
INSERT INTO Cliente (Nome_Cliente, Data_Nascimento, Telefone) VALUES ('Rogerio Cavalcante','1990-01-12','3456-7894');

select * from Cliente;	

CREATE TABLE Pedido (
Num_Pedido INT NOT NULL AUTO_INCREMENT,
Cod_Cliente int,
Total_Pedido decimal (10,2),
PRIMARY KEY (Num_Pedido) ,
FOREIGN KEY (Cod_Cliente)
REFERENCES Cliente(Cod_Cliente));

INSERT INTO Pedido (Num_Pedido, Cod_Cliente, Total_Pedido) VALUES (203, 1, 800);
INSERT INTO Pedido (Num_Pedido, Cod_Cliente, Total_Pedido) VALUES (204, 2, 900);
INSERT INTO Pedido (Num_Pedido, Cod_Cliente, Total_Pedido) VALUES (205, 3, 1200);

select * from Pedido;

select * from Cliente, Profissao;

SELECT Cliente.nome_cliente,Pedido.cod_cliente,Pedido.num_pedido 
FROM Cliente INNER JOIN Pedido  
ON Cliente.Cod_cliente = Pedido.Cod_cliente;

select Cliente.Nome_Cliente,Profissao.Nome_profissao
from Cliente inner join Profissao on cliente.cod_profissao = profissao.cod_profissao;

select Cliente.Nome_Cliente,Profissao.Nome_profissao,Pedido.Num_Pedido
from Cliente inner join Profissao inner join Pedido on cliente.cod_profissao = profissao.cod_profissao and
cliente.Cod_cliente = Pedido.Cod_Cliente;	

select Cliente.Nome_Cliente,Profissao.Nome_profissao,Pedido.Num_Pedido from Cliente inner join Profissao on	cliente.cod_profissao = profissao.cod_profissao	
inner join Pedido on cliente.Cod_cliente = Pedido.Cod_Cliente;	

Select profissao.Nome_Profissao,pedido.Total_pedido from pedido inner join profissao inner join cliente on 
pedido.cod_cliente = cliente.cod_Cliente and cliente.Cod_profissao = profissao.cod_profissao and 
profissao.cod_profissao = 1;

/* 1) O que são junções? 
   É um agrupamento de tabelas por meios de critérios como elementos em comum ou elementos diferentes, e o join cria
   uma ou mais pseudos tabelas que com as regras especificadas mostra uma consulta de duas tabelas ligadas.
2) 2) Dê a sintaxe de uma junção simples entre 2 tabelas.    
	Select cliente.Nome_cliente, Produto.Nome_produto from cliente inner join Produto on  cliente.Cod_Cliente = Produto.Cod_Cliente;
	Que mostrará o nome do cliente e o nome do produto que ele comprou.
*/

select cliente.nome_cliente, profissao.nome_profissao  from cliente inner join profissao on cliente.Cod_profissao = profissao.cod_profissao;
select pedido.num_pedido, cliente.nome_cliente from pedido inner join cliente  on pedido.cod_cliente = cliente.cod_Cliente;
select cliente.nome_cliente,profissao.nome_profissao, pedido.num_pedido from cliente inner join profissao inner join pedido on pedido.cod_cliente = cliente.cod_Cliente and cliente.Cod_profissao = profissao.cod_profissao;
Select pedido.Num_pedido,profissao.Nome_Profissao from pedido inner join profissao inner join cliente on 
pedido.cod_cliente = cliente.cod_Cliente and cliente.Cod_profissao = profissao.cod_profissao;

INSERT INTO Cliente (Nome_Cliente, Data_Nascimento, Telefone, Cod_Profissao)  VALUES ('José Incrivel','1980-09-20','3782-7110',1);
INSERT INTO Cliente (Nome_Cliente, Data_Nascimento, Telefone, Cod_Profissao)  VALUES ('João Goiaba','1980-09-20','7273-7000',1);
INSERT INTO Pedido (Num_Pedido, Cod_Cliente, Total_Pedido) VALUES (206, 5, 1000);
INSERT INTO Pedido (Num_Pedido, Cod_Cliente, Total_Pedido) VALUES (207, 6, 2000);

Select profissao.Nome_Profissao,pedido.Total_pedido from pedido inner join profissao inner join cliente on 
pedido.cod_cliente = cliente.cod_Cliente and cliente.Cod_profissao = profissao.cod_profissao and 
profissao.Nome_profissao = "Programador";

# Ativ para 03/06

/*
1. O que são junções externas?
 É uma seleção que retorna os registros da tabela na esquerda ou direita e os registros em comum dos dois, contudo não sendo necessário que os registros de uma tabela
 seja correspondente em outra
 
 2. Explique com suas palavras o que faz a junção do tipo Left Outer Join.
 Ele mostra todos os registro da primeira tabela digitada, e na segunda só os elementos em comum
 
 3. Explique com suas palavras o que faz a junção do tipo Right Outer Join.
 mesma coisa que da anterior só que na segunda tabela digitada
 
 4. Forneça o script da aula usando Left e  Right outer Join. 
1. Cliente e Profissão (Left)
2. Cliente e Profissão (Right)
3. Cliente e Pedido (Left)
4. Cliente e Pedido (Right)
 */
 
#1
select Cliente.Nome_Cliente,Profissao.Nome_profissao
from Cliente left outer  join Profissao on cliente.cod_profissao = profissao.cod_profissao;

#2

select Cliente.Nome_Cliente,Profissao.Nome_profissao
from Cliente right outer join Profissao on cliente.cod_profissao = profissao.cod_profissao;

#3

select pedido.num_pedido, cliente.nome_cliente from pedido left outer join cliente  on pedido.cod_cliente = cliente.cod_Cliente;

#4

select pedido.num_pedido, cliente.nome_cliente from pedido right outer join cliente  on pedido.cod_cliente = cliente.cod_Cliente;


