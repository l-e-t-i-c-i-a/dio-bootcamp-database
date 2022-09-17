create database oficina;
use oficina;


create table clients(
	idClients int auto_increment primary key,
	Fname varchar(255) not null,
	Minit varchar(5) not null,
	Lname varchar(20) not null,
	CPF char(11) not null,
    CNH varchar(45) not null,
	address varchar(255) not null,
    contact varchar(15) not null
);

insert into clients
Values
	(1, 'João', 'A', 'Borges', 12345678999, 11111111111, 'Rua do Açougue, 20, Paraíba', 83988888888),
    (2, 'Maria', 'B', 'Morais', 14785296378, 22222222222, 'Rua da Curva, 30, Paraíba', 83987412569),
    (3, 'Lua', 'C', 'Sousa', 12365498765, 33333333333, 'Rua da Ponte, 40, Paraíba', 83986362563);
    
create table vehicles(
	idVehicle int auto_increment primary key,
    idVehicleOwner int not null,
    marca varchar(45) not null,
    placa varchar(45) not null,
    constraint unique_placa unique(placa),
    constraint fk_vehicle_owner foreign key(idVehicleOwner) references clients(idClients)
);

insert into vehicles
Values
	(1, 1, 'Fiat', 'BEE4R22'),
    (2, 2, 'Hyundai', 'RUI0G23'),
    (3, 3, 'Toyota', 'DEF3H10');

create table employees(
	idEmployees int auto_increment primary key,
    ename varchar(45),
    CPF varchar(11),
    especiality enum('painting', 'old cars', 'fixing'),
    contact varchar(20),
    vehicle_being_repaired varchar(45),
    constraint fk_vehicle_being_repaired foreign key(vehicle_being_repaired) references vehicles(placa)
);

insert into employees
values
	(1, 'João A. Borges', 12345678999, 'painting', 83988888888, 'RUI0G23'),
    (2, 'Flávio M Moura', 22255569874, 'old cars', 83987456321, 'BEE4R22'),
    (3, 'Pedro J Santana', 55566874123, 'fixing', 83985232214, 'DEF3H10');
    
create table inventory(
	idInventory int auto_increment primary key,
    products varchar(255),
    quantity int,
    price float
);
    
insert into inventory
Values
	(1, 'Cilindro mestre de freio', 10, 250.90),
    (2, 'Interruptor de pressão do óleo', 10, 80.00),
    (3, 'Junta do cabeçote', 10, 50.00),
    (4, 'Eixo virabrequim', 10, 2000.00),
    (5, 'Cilindro de roda traseira', 10, 200.00),
    (6, 'Miolo de ignição', 10, 100.00),
    (7, 'Termo-interruptor do radiador', 10, 80.00);
    
create table serviceOrder(
	idServiceOrder int auto_increment primary key,
    emissionDate date,
    price float,
    serviceStatus enum('conserto', 'revisão', 'conserto e revisão'),
    conclusion date,
    productsUsed int,
    productsUsedname varchar(255),
    idEmployeeWorking int,
    employeeWorking varchar(255),
    constraint fk_products_used foreign key(productsUsed) references inventory(idInventory),
    constraint fk_employee foreign key(idEmployeeWorking) references Employees(idEmployees)
);

insert into serviceOrder
Values
	(1, '2022-09-16', 1300.00, 'revisão', '2022-09-21', 7, 'Termo-interruptor do radiador', 1, 'João A. Borges'),
    (2, '2022-09-15', 5000.00, 'conserto e revisão', '2022-09-22', 3, 'Junta do cabeçote', 3,  'Pedro J Santana'),
    (3, '2022-09-14', 2700.00, 'conserto', '2022-09-23', 6, 'Miolo de ignição', 2, 'Flávio M Moura');

-- formas de pagamento
create table Payments(
idPayment int auto_increment primary key,
idPaySOrder int,
typePayment enum('Cash','CreditCard') default 'CreditCard',
totalPrice decimal(7,2) not null,
paymentStatus enum('Autorizado','Não Autorizado','Processando') default 'Processando',
constraint fk_pay_order foreign key(idPaySOrder) references serviceOrder(idServiceOrder)
);

INSERT INTO Payments
VALUES
	(1,1,'CreditCard',1300.00,'Autorizado'),
    (2,2,'Cash',5000.00,'Autorizado'),
    (3,3,'CreditCard',2700.00,'Não Autorizado');
    
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
    (3,3,'America Express',2159632456987562,'23-09-11','ROBERTO P PEREIRA',222);
    
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
    (3,3,'PIX CPF');
    


-- tables created clients, vehicles, employees, inventory, serviceOrder, Payments
select * from clients;
select * from vehicles;
select * from serviceOrder;
select * from employees;
select * from inventory;

-- QUERIES

select * from clients c, vehicles v where c.idClients = v.idVehicleOwner;

select * from inventory i inner join serviceOrder s on s.productsUsed = i.idInventory
						inner join employees e on e.ename = s.employeeWorking;
                        
select * from inventory i inner join serviceOrder s on s.productsUsed = i.idInventory
						inner join employees e on e.ename = s.employeeWorking
					having s.price >= 2000
                    order by s.idServiceOrder;


                        
		
                        

