create database mlm;
use mlm;

create table lists (
    listid int auto_increment not null primary key,
    listname char(20) not null,
    blurb varchar(255)
) engine=InnoDB;

create table subscribers (
    email char(100) not null primary key,
    realname char(100) not null,
    mimetype char(1) not null,
    password char(40) not null,
    admin tinyint not null
) engine=InnoDB;

--  stores a relationship between a subscriber and a list
create table sub_lists (
    email char(100) not null,
    listid int not null
) engine=InnoDB;

create table mail (
    mailid int auto_increment not null primary key,
    email char(100) not null,
    subject char(100) not null,
    listid int not null,
    status char(10) not null,
    sent datetime,
    modified timestamp
) engine=InnoDB;

--  stores the images that go with a particular mail
create table images (
    mailid int not null,
    path char(100) not null,
    mimetype char(100) not null
) engine=InnoDB;

grant select, insert, update, delete
on mlm.*
to mlm@localhost identified by 'password';

insert into subscribers values
  ('admin@localhost', 'Administative User', 'H', sha1('admin'), 1);
