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




# --- !Downs

SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists ciudad;

drop table if exists experiencia_vendedor;

SET REFERENTIAL_INTEGRITY TRUE;

