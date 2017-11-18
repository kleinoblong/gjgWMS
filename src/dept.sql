drop database if exists gjgwms;

CREATE DATABASE gjgwms DEFAULT CHARACTER SET utf8;

use gjgwms;

drop table if exists supplier;
drop table if exists account;


/*============================*/
/* Table: 管理员表结构 		  */
/*============================*/
create table account
(
   /* 管理员编号,自动增长 */
   acc_id                  int not null,
   /* 管理员登录名  */
   acc_loginName               varchar(20),
   /* 管理员姓名  */
   acc_name                varchar(20),
   /* 管理员密码 */
   acc_pwd                varchar(20),
   /* 设置编号为主键 */
   primary key (acc_id)
);

/* 添加管理员数据, */
insert into account (acc_id,acc_loginName,acc_pwd) values ('b845283fccd04902bdc61ce670b30108','admin','admin');
insert into account (acc_id,acc_loginName,acc_pwd) values ('d48a856b50c74a3ebcab30493262e471','admin2','admin2');


select * from account;
select * from supplier;


/*============================*/
/* Table: 库存表 		  */
/*============================*/
create table inventory
(
	inventory_Id        varchar(36) not null,
	inventory_name           varchar(20),
	inventory_amount           int,
	inventory_type           varchar(20),
	inventory_min          int,
	goods_remark         varchar(100),
	primary key (inventory_Id)
);

/*============================*/
/* Table: 部门表 		  */
/*============================*/


create table department
(
   department_id        varchar(36),
   department_name      varchar(20),
   primary key (department_id)
);

CREATE TABLE employee
(
   employee_id        VARCHAR(36) 	PRIMARY KEY 	NOT NULL,
   employeet_name      VARCHAR(20),
   employee_status	INT,	
   department_id	VARCHAR(36)
);
