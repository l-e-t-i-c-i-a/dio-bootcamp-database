-- criação do banco de dados para o cenário de E-commerce
create database ecommerce;
use ecommerce;


-- criar tabela login do cliente
create table LoginClients(
	idLoginClient int auto_increment primary key,
    userName varchar(45) not null unique,
    passwords char(10) not null
);

INSERT INTO LoginClients
values 
	(1,'anabc','anbc1'),
    (2,'beatrizcd','beatrizcd2'),
	(3,'carlosde','carlosde3'),
	(4,'elenfg','elenfg4'),
	(5,'fernandogh','nandogh5'),
	(6,'casasbahia','cbahia6'),
    (7,'cea','cea7'),
	(8,'modasmil','modasmil8'),
	(9,'leomadeiras','lmadeiras9'),
	(10,'casatudo','casatudo10');
    
-- pessoa física
create table ClientsCPF(
idClientCPF int auto_increment primary key,
idLogClientCPF int not null,
Fname varchar(10) not null,
Minit varchar(5) not null,
Lname varchar(20) not null,
CPF char(11) not null,
Bdate date not null,
address varchar(255) not null,
constraint unique_client_cpf unique(CPF),
constraint fk_clientcpf_login foreign key(idLogClientCPF) references LoginClients(idLoginClient)
);

INSERT INTO ClientsCPF
values (1,1,'Ana','B','Costa',12345678911,'1999-07-02','Rua de Baixo, 1000, São Paulo'),
       (2,2,'Beatriz','C','Dias',11223344556,'1997-04-17','Rua de Cima, 200, Rio de Janeiro'),
       (3,3,'Carlos','D','Esteves',11122233344,'1996-01-10','Rua da Curba, 30, São Paulo'),
       (4,4,'Elen','F','Gouveia',77765432111,'1995-10-19','Rua Sinuosa, 20, Rio de Janeiro'),
       (5,4,'Fernando','G','Holanda',99987654123,'1960-12-06','Rua da Ladeira, 90, São Paulo');
       
-- pessoa jurídica
create table ClientsCNPJ(
idClientCNPJ int auto_increment primary key,
idLClientCNPJ int not null,
companyName varchar(45) not null,
CNPJ char(14) not null,
tradingName varchar(45) not null,
address varchar(255) not null,
constraint unique_client_cnpj unique(CNPJ),
constraint fk_clientcnpj_login foreign key(idLClientCNPJ) references LoginClients(idLoginClient)
);

INSERT INTO ClientsCNPJ
values (1,1,'Paulo A. Marques',10987654321, 'Casas Bahia','Rua da Feira, 900, São Paulo'),
	   (2,2,'Socorro A. Borges',11197654321, 'CeA', 'Rua da Lombada, 10, São Paulo'),
       (3,3,'Silvio S. Santos',222333444589, 'Modas Mil', 'Rua do Precipício, 20, São Paulo'),
	   (4,4,'Pamela V. Pires',111444777852, 'Leo Madeiras', 'Rua Sem Saída, 40, São Paulo'),
	   (5,5,'Antonio D. Barros',998745213654, 'Casa Tudo', 'Rua da Quebrada, 20, São Paulo');
       
-- criat tabela produto (size = dimensão do produto)
create table Products(
	idProduct int auto_increment primary key,
    Pname varchar(50) not null, 
    classification_kids bool default false,
    category enum('Eletrônico', 'Roupa', 'Brinquedos', 'Alimentos', 'Móveis', 'Cozinha') not null,
	rating float default 0,
    dimensions varchar(10)
);

INSERT INTO Products
values
	(1,'Bolsa',False,'Roupa','5','Média'),
	(2,'Blusa',False,'Roupa','5','G'),
	(3,'Geladeira',False,'Eletrônico','5','60x60x1,90'),
	(4,'Boneco',True,'Brinquedos','5','30cm'),
	(5,'Jogo de Panela',False,'Cozinha','5','60x50x50'),
    (6,'Tênis',False,'Roupa','5','tam40'),
	(7,'Camisa',False,'Roupa','5','GG'),
	(8,'Televisão',False,'Eletrônico','5','55x110x05'),
	(9,'Camisa',False,'Roupa','5','M'),
	(10,'Barbie',True,'Brinquedos','5','30cm');
    
-- criar tabela pedido
create table Orders(
idOrder int auto_increment primary key,
idOloginclient int,
orderStatus enum('Cancelado','Confirmado','Processando') default 'Processando',
orderDescription varchar(255),
shippingValue float default 10,
shippingDate date not null,
trackingCode char(15) not null,
constraint fk_order_loginclient foreign key(idOloginclient) references LoginClients(idLoginClient)
);


INSERT INTO Orders
Values
	(default,1,'Confirmado','1x Bolsa',20,'2022-10-15','BR1123456789147'),
	(default,2,Default,'1x Blusa',10,'2022-10-01','BR1111111111111'),
	(default,3,'Confirmado','1x Geladeira',30,'2022-10-02','BR2222222222222'),
	(default,4,'Cancelado','1x Boneco',15,'2022-10-10','BR3333333333333'),
	(default,5,'Confirmado','1x Jogo de Panela',20,'2022-10-11','BR4444444444444'),
    (default,6,'Confirmado','1x Tênis',50,'2022-10-12','BR5555555555555'),
	(default,7,Default,'1x Camisa',10,'2022-10-13','BR6666666666666'),
	(default,8,'Confirmado','1x Televisão',40,'2022-10-14','BR7777777777777'),
	(default,9,'Cancelado','1x Camisa',10,'2022-10-15','BR8888888888888'),
	(default,10,'Confirmado','1x Barbie',20,'2022-10-16','BR9999999999999');
        
-- criar tabela frete
create table Shipping(
idSloginClient int,
idSorder int,
shippingStatus enum('Em transporte','Entregue','Perdido'),
constraint fk_shipping_loginclient foreign key(idSloginClient) references LoginClients(idLoginClient),
constraint fk_shipping_order foreign key(idSorder) references Orders(idOrder)
);

INSERT INTO Shipping
values
		(1, default,'Em transporte'),
		(2,default,'Entregue'),
		(3,default,'Perdido'),
		(4,default,'Entregue'),
		(5,default,'Em transporte'),
        (6, default,'Em transporte'),
		(7,default,'Entregue'),
		(8,default,'Perdido'),
		(9,default,'Entregue'),
		(10,default,'Em transporte');
        
-- pedido/produto
create table ProductsOrders(
idPOproduct int,
idPOorder int,
poQuantity int default 1,
poStatus enum('Disponível','Indisponível'),
primary key(idPOproduct, idPoOrder),
constraint fk_product_product foreign key(idPOproduct) references Products(idProduct),
constraint fk_product_order foreign key(idPOorder) references Orders(idOrder)
);

INSERT INTO ProductsOrders
Values
	(1,1,10,'Disponível'),
	(2,2,20,'Disponível'),
	(3,3,10,'Disponível'),
	(4,4,0,'Indisponível'),
	(5,5,16,'Disponível'),
	(6,6,10,'Disponível'),
	(7,7,20,'Disponível'),
	(8,8,10,'Disponível'),
	(9,9,15,'Disponível'),
	(10,10,16,'Disponível');
	

-- criar tabela vendedor
create table Seller(
	idSeller int auto_increment primary key,
    SocialName varchar (255) not null,
    AbstName varchar(255),
    CNPJ char(15),
    CPF char(11),
    location varchar(255),
    contact varchar(15) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

INSERT INTO Seller
Values
	(1,'MISTRAL BELA BISTA','Mistral Bela Vista',12312312312312,12345678963,'Avenida Limpa, 11, Rio de Janeiro',21988888888),
	(2,'HAVAIANAS','Havaianas',45645645645645,35795146825,'Rua da Esquina, 20, São Paulo',11988887777),
	(3,'EATALY S.A.','Eataly',32165498732165,32195165498,'Rua do Contorno, 14, Brasília',61999998888),
	(4,'ANTIX STORE','Antix',36575386951412,36925821453,'Rua do Semáforo, 60, São Paulo',21988886666),
	(5,'GRANADO','Granado',78965415987546,36925632145,'Rua do Asfalto, 680, Rio de Janeiro',21987777777);
  

-- produto/vendendor
create table ProductSeller(
idPseller int,
idPproduct int,
quantity int default 1,
primary key(idPseller, idPproduct),
constraint fk_product_seller foreign key(idPseller) references Seller(idSeller),
constraint fk_products_product foreign key(idPproduct) references Products(idProduct)
);  

-- criar tabela estoque
create table Inventory(
idInventory int auto_increment primary key,
inventoryLocation varchar(255),
quantity int default 0
);

INSERT INTO Inventory
values
	(1,'Rio de Janeiro',300),
	(2,'São Paulo',400),
	(3,'Brasília',500),
	(4,'Pará',600),
	(5,'Curitiba',700);
    
-- produto/estoque
create table ProductsInventory(
idPinventory int,
idIproduct int,
quantity int default 1,
primary key(idPinventory, idIproduct),
constraint fk_product_inventory foreign key(idPinventory) references Products(idProduct),
constraint fk_inventory_product foreign key(idIproduct) references Inventory(idInventory)
);

INSERT INTO ProductsInventory
Values
	(1,1,30),
    (2,2,20),
    (3,3,80),
    (4,4,90),
    (5,5,default);

-- criar tabela fornecedor
create table Supplier(
idSupplier int auto_increment primary key,
companyName varchar(60) not null,
CNPJ CHAR(14) not null,
address varchar(255),
contact char(11)
);


INSERT INTO Supplier
VALUES
	(1,'SHOESTOCK',14785296378945,'Rua dos Jambos, 25, São Paulo',11986543214),
    (2,'SCHUTZ',24568759865412,'Rua do Sol, 15, Rio de Janeiro',21985247896),
    (3,'RENNER',14785236985625,'Rua da Luz, 100, São Paulo', 11986853652),
    (4,'CEA',78965412369852,'Rua do Canteiro, 2, São Paulo',11985654785),
    (5,'RIHAPPY',14785236985632,'Rua do Grito, 20, São Paulo',11988654752);
    
-- produto/fornecedor
create table productsSupplier(
idPOsupplier int,
idPOproduct int,
quantity int default 0,
primary key(idPOsupplier, idPOproduct),
constraint fk_product_supplier foreign key (idPOsupplier) references Supplier(idSupplier),
constraint fk_supplier_product foreign key(idPOproduct) references Products(idProduct)
);

INSERT INTO productsSupplier
VALUES
	(1,1,3000),
    (2,2,2600),
    (3,3,1400),
    (4,4,3000),
    (5,5,4000);
    
-- formas de pagamento
create table Payments(
idPayment int auto_increment primary key,
idPayOrder int,
idPayproduct int,
typePayment enum('Cash','CreditCard') default 'CreditCard',
totalPrice decimal(5,2) not null,
paymentStatus enum('Autorizado','Não Autorizado','Processando') default 'Processando',
constraint fk_pay_order foreign key(idPayOrder) references Orders(idOrder),
constraint fk_pay_product foreign key(idPayproduct) references Products(idProduct)
);

INSERT INTO Payments
VALUES
	(1,1,1,'CreditCard',300.00,'Autorizado'),
    (2,2,2,'Cash',50.00,'Autorizado'),
    (3,3,3,'CreditCard',700.00,'Não Autorizado'),
    (4,4,4,'Cash',60.00,'Autorizado'),
    (5,5,5,'CreditCard',400.90,'Autorizado'),
    (6,6,6,'CreditCard',200.00,'Autorizado'),
    (7,7,7,'Cash',30.00,'Autorizado'),
    (8,8,8,'CreditCard',500.00,'Não Autorizado'),
    (9,9,9,'Cash',40.00,'Processando'),
    (10,10,10,'CreditCard',90.90,'Autorizado');
    
-- pagamento com cartão de crédito
create table CreditCard(
idCredicard int auto_increment primary key,
idPayCredCard int,
credCardFlag varchar(20) not null,
cardNumber char(16) not null,
expirationDate date not null,
cardHolderName varchar(45) not null,
securityCode char(3) not null,
constraint fk_pay_creditcard foreign key(idPayCredCard) references Payments(idPayment)
);

INSERT INTO CreditCard
VALUES
	(1,1,'MasterCard',1472583692583698,'2022-12-05','JULIO C CESAR',555),
    (2,2,'Visa',5444555874523685,'2022-11-21','ANTONIO B BRANDAO',999),
    (3,3,'America Express',2159632456987562,'23-09-11','ROBERTO P PEREIRA',222),
    (4,4,'ELO',7777777777777777,'24-03-15','GLORIA C VASQUEZ',444),
    (5,5,'MasterCard',5555555555555555,'23-11-03','JOANA B SOUZA',777);
    
-- pagamento com dinheiro/Pix
create table Cash(
idCash int auto_increment primary key,
idPayCash int,
pix enum('Pix CPF','Pix email','Pix cellphone','Pix random'),
constraint fk_pay_cash foreign key(idPayCash) references Payments(idPayment)
);

INSERT INTO Cash
VALUES
	(1,1,'PIX CPF'),
    (2,2,'PIX email'),
    (3,3,'PIX CPF'),
    (4,4,'PIX email'),
    (5,5,'PIX CPF');
    
    


-- Queries
-- recuperação de pedido com produto associado
select * from loginClients c
				inner join orders o on c.idLoginClient
                inner join ProductsOrders p on p.idPOorder = o.idOrder
		group by idLoginClient;
        
-- quantos pedidos foram realizados pelos clientes?
select c.idLoginClient, userName, count(*) as Number_of_orders from loginClients c
						inner join orders o on c.idLoginClient = o.idOloginclient
				group by idLoginClient;
                
select * from Orders o, Payments p where o.idOrder = idPayOrder;

select * from seller s, products p where s.idseller = idproduct;

select concat(Fname,' ',Lname) as Client, idOrder, orderStatus from ClientsCPF c, Orders o where idClientCPF = idOLoginClient;

SELECT Fname AS nome, Lname AS sobrenome, address as endereço, idClientcpf as n_cliente FROM clientscpf order by lname;

select c.idLoginClient, userName, count(*) as Number_of_orders from loginClients c
						inner join orders o on c.idLoginClient = o.idOloginclient
				group by idLoginClient
                 having count(*) >= 1;