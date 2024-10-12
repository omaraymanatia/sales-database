create database sales;
use sales;

create table customers(
   customer_id int identity(1, 1) primary key,
   first_name varchar(20) not null,
   last_name varchar (20) not null,
   phone varchar(20) not null unique,
   email varchar(20) not null unique,
   street varchar(20),
   city varchar(20) not null,
   state_ varchar(20) not null,
   zip_code varchar(20),
);

create table stores(
   store_id int identity(1, 1) primary key,
   store_name varchar(20) not null,
   phone varchar(20) not null unique,
   email varchar(20) not null unique,
   street varchar(20),
   city varchar(20) not null,
   state varchar(20) not null,
   zip_code varchar(20)
);

create table staff(
   staff_id int identity(1, 1) primary key,
   first_name varchar(20) not null,
   last_name varchar(20) not null,
   email varchar(20) not null unique,
   phone varchar(20) not null unique,
   active bit,
   store_id int,
   manager_id int,
   constraint staff_manager_fk foreign key (manager_id) references staff(staff_id),
   constraint staff_store_fk foreign key (store_id) references stores(store_id)
);


create table orders(
   order_id int identity(1, 1) primary key,
   customer_id int,
   order_status varchar(20) not null,
   order_date date not null,
   required_date date,
   shipped_date date,
   store_id int,
   staff_id int,
   constraint orders_customer_fk foreign key (customer_id) references customers (customer_id),
   constraint orders_store_fk foreign key (store_id) references stores (store_id),
   constraint orders_staff_fk foreign key (staff_id) references staff (staff_id)
);

create table categories(
   category_id int identity(1, 1) primary key,
   category_name varchar(20)
);

create table brands(
   brand_id int identity(1, 1) primary key,
   brand_name varchar(20)
);

create table products(
   product_id int identity(1, 1) primary key,
   product_name varchar(20),
   brand_id int,
   category_id int,
   model_year int,
   list_price decimal(10, 2),
   constraint products_brand_fk foreign key (brand_id) references brands (brand_id),
   constraint products_category_fk foreign key (category_id) references categories (category_id),
);

create table stocks(
   store_id int,
   product_id int,
   quantity int,
   constraint stocks_store_fk foreign key (store_id) references stores (store_id),
   constraint stocks_product_fk foreign key (product_id) references products (product_id),
);
