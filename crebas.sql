/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2016                    */
/* Created on:     18.02.2018 13:31:40                          */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('Category')
            and   type = 'U')
   drop table Category
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Manufacturer')
            and   name  = 'Relationship_1_FK'
            and   indid > 0
            and   indid < 255)
   drop index Manufacturer.Relationship_1_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Manufacturer')
            and   type = 'U')
   drop table Manufacturer
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Model')
            and   name  = 'Relationship_2_FK'
            and   indid > 0
            and   indid < 255)
   drop index Model.Relationship_2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Model')
            and   type = 'U')
   drop table Model
go

/*==============================================================*/
/* Table: Category                                              */
/*==============================================================*/
create table Category (
   name_category        varchar(255)         not null,
   id_c                 int                  not null,
   constraint PK_CATEGORY primary key (id_c)
)
go

/*==============================================================*/
/* Table: Manufacturer                                          */
/*==============================================================*/
create table Manufacturer (
   name_manufacturer    varchar(255)         not null,
   country              varchar(255)         null,
   id_m                 int                  not null,
   id_c                 int                  not null,
   constraint PK_MANUFACTURER primary key (id_m)
)
go

/*==============================================================*/
/* Index: Relationship_1_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_1_FK on Manufacturer (id_c ASC)
go

/*==============================================================*/
/* Table: Model                                                 */
/*==============================================================*/
create table Model (
   name_model           varchar(255)         not null,
   id_m                 int                  not null,
   price                int                  null,
   constraint PK_MODEL primary key (name_model)
)
go

/*==============================================================*/
/* Index: Relationship_2_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_2_FK on Model (id_m ASC)
go

