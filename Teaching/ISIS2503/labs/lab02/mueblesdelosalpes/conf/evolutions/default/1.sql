# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table ciudad (
  nombre                    varchar(255))
;

create table experiencia_vendedor (
  id                        bigint auto_increment not null,
  nombre_empesa             varchar(255),
  cargo                     varchar(255),
  descripcion               varchar(255),
  ano                       integer,
  constraint pk_experiencia_vendedor primary key (id))
;

create table mueble (
  referencia                bigint not null,
  nombre                    varchar(255),
  descripcion               varchar(255),
  tipo                      integer,
  precio                    double,
  imagen                    varchar(255),
  cantidad                  integer,
  seleccion                 boolean,
  constraint ck_mueble_tipo check (tipo in (0,1)),
  constraint pk_mueble primary key (referencia))
;

create table pais (
  nombre                    varchar(255))
;

create table registro_venta (
  fecha_venta               timestamp,
  cantidad                  integer,
  ciudad                    varchar(255))
;

create table usuario (
  documento                 bigint not null,
  login                     varchar(255),
  contraseña                varchar(255),
  tipo_usuario              integer,
  nombre_completo           varchar(255),
  tipo_documento            integer,
  telefono_local            bigint,
  telefono_celular          bigint,
  direccion                 varchar(255),
  profesion                 integer,
  correo                    varchar(255),
  seleccion                 boolean,
  constraint ck_usuario_tipo_usuario check (tipo_usuario in (0,1)),
  constraint ck_usuario_tipo_documento check (tipo_documento in (0,1)),
  constraint ck_usuario_profesion check (profesion in (0,1,2,3,4,5,6,7)),
  constraint pk_usuario primary key (documento))
;

create table vendedor (
  id                        bigint not null,
  nombres                   varchar(255),
  apellidos                 varchar(255),
  salario                   double,
  comision_ventas           double,
  perfil                    varchar(255),
  foto                      varchar(255),
  constraint pk_vendedor primary key (id))
;

create sequence mueble_seq;

create sequence usuario_seq;

create sequence vendedor_seq;




# --- !Downs

SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists ciudad;

drop table if exists experiencia_vendedor;

drop table if exists mueble;

drop table if exists pais;

drop table if exists registro_venta;

drop table if exists usuario;

drop table if exists vendedor;

SET REFERENTIAL_INTEGRITY TRUE;

drop sequence if exists mueble_seq;

drop sequence if exists usuario_seq;

drop sequence if exists vendedor_seq;

