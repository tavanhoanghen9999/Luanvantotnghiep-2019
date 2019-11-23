create database mydatabase

use mydatabase;


Create table lineproducts(
lineprid int primary key not null  Identity(1,1),
linename nvarchar(500),
status int
);

create table products (
 prid int not null primary key  Identity(1,1),
 prname nvarchar(200),
 total int ,
 importprice bigint,
 oldprice bigint,
 price bigint,
 lineprid int ,
 totalview int,
 totallike int,
 evaluate float,
 image nvarchar(200),
 mnday datetime,
 expirydate datetime,
 status bit,
 foreign key (lineprid) references lineproducts(lineprid)
);
create table imageproducts(
	imgid int  not null   Identity(1,1),
	image nvarchar(500),
	prid int,
    primary key (imgid),
	foreign key (prid) references products(prid)
);
Create table evaluates(
	evaid int not null   Identity(1,1),
	comment nvarchar(655),
	evaluate int,
	usid int,
	prid int ,
	primary key (evaid),
	foreign key (usid) references users(usid),
	foreign key (prid) references products(prid)
);
create  table imgcomments(
icmtid int  primary key  Identity(1,1),
image nvarchar(500),
evaid int,
foreign key(evaid) references evaluates(evaid)
);
Create table carts(
cartid int primary key  Identity(1,1),
money bigint,
prid int, 
foreign key (prid) references products(prid),
);
Create table Activity(
 actid int not null  Identity(1,1) primary key,
 actiname nvarchar(100)
)
create table roles(
roleid int primary key not null Identity(1,1),
rolename nvarchar(100)
)
Create table users (
usid int  Identity(1,1) primary key,
fullname nvarchar(100),
password nvarchar(100),
roles int ,
avatar nvarchar(200),
wall nvarchar(200),
email nvarchar(100),
phone nvarchar(10),
address nvarchar(400),
birthday datetime,
createday datetime,
active int,
foreign key (roles) references roles(roleid),
foreign key (active) references activity(actid)
);
Create table invoices(
ivid int  Identity(1,1) primary key,
namecustomer nvarchar(100),
gender int ,
phonenumber nvarchar(10),
email nvarchar(100),
province varchar(5),
district varchar(10),
adress nvarchar(500),
adressdelviver nvarchar(500),
timedeliver int,
typepay int ,
totalmoney bigint,
money bigint ,
codediscount nvarchar(30),
note nvarchar(300),
usid int,
codeinvoice nvarchar(20) not null,
);
Create table InvoiceProduct(
invprid int not null primary key  Identity(1,1) ,
prid int ,
total int,
ivid int,
foreign key (prid) references products(prid),
foreign key (ivid) references invoices(ivid)
);
Create table describeproducts(
desid int not null primary key  Identity(1,1),
describes nvarchar(3000),
title nvarchar(1000),
prid int,
stt bit,
foreign key (prid) references products(prid)
);
Create table discount (
 discountid int not null primary key  Identity(1,1),
 code nvarchar(10),
 percents int,
 eventname nvarchar(500),
 money bigint,
 stt bit,
 startday datetime,
 endday datetime,
 note nvarchar(1000),
);
Create  table register(
	regid int not null primary key  Identity(1,1),
     email nvarchar(200) not null,
     status bit ,
     note nvarchar(200)
);
--//add colum 
--ALTER TABLE products
  --ADD status bit;