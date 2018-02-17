--==============================================================
-- DBMS name:      ANSI Level 2
-- Created on:     17.02.2018 22:59:13
--==============================================================


drop index Category_PK;

drop table Category cascade;

drop index Relationship_1_FK;

drop index Manufacturer_PK;

drop table Manufacturer cascade;

drop index Relationship_2_FK;

drop index Model_PK;

drop table Model cascade;

--==============================================================
-- Table: Category
--==============================================================
create table Category (
name_category        CHAR(1000)           not null,
primary key (name_category)
);

--==============================================================
-- Index: Category_PK
--==============================================================
create unique index Category_PK on Category (
name_category ASC
);

--==============================================================
-- Table: Manufacturer
--==============================================================
create table Manufacturer (
name_manufacturer    CHAR(1000)           not null,
name_category        CHAR(1000)           not null,
country              CHAR(1000),
primary key (name_manufacturer),
foreign key (name_category)
      references Category (name_category)
);

--==============================================================
-- Index: Manufacturer_PK
--==============================================================
create unique index Manufacturer_PK on Manufacturer (
name_manufacturer ASC
);

--==============================================================
-- Index: Relationship_1_FK
--==============================================================
create  index Relationship_1_FK on Manufacturer (
name_category ASC
);

--==============================================================
-- Table: Model
--==============================================================
create table Model (
name_model           CHAR(1000)           not null,
name_manufacturer    CHAR(1000)           not null,
price                INTEGER,
primary key (name_model),
foreign key (name_manufacturer)
      references Manufacturer (name_manufacturer)
);

--==============================================================
-- Index: Model_PK
--==============================================================
create unique index Model_PK on Model (
name_model ASC
);

--==============================================================
-- Index: Relationship_2_FK
--==============================================================
create  index Relationship_2_FK on Model (
name_manufacturer ASC
);

