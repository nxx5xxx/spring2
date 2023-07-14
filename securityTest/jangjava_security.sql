create table users(
      username varchar2(50) not null primary key,
      password varchar2(50) not null,
      enabled char(1) default '1');

      
 create table authorities (
      username varchar2(50) not null,
      authority varchar2(50) not null,
      constraint fk_authorities_users foreign key(username) references users(username));
      
 create unique index ix_auth_username on authorities (username,authority);

drop table users;
drop table authorities;

insert into users (username, password) values ('user00','1111');
insert into users (username, password) values ('member00','1111');
insert into users (username, password) values ('admin00','1111');

insert into authorities (username, authority) values ('user00','ROLE_USER');
insert into authorities (username, authority) values ('member00','ROLE_MANAGER'); 
insert into authorities (username, authority) values ('admin00','ROLE_MANAGER'); 
insert into authorities (username, authority) values ('admin00','ROLE_ADMIN');
commit;

select * from users;

select * from authorities;

create table tbl_member(
      userid varchar2(50) not null primary key,
      userpw varchar2(100) not null,
      username varchar2(100) not null,
      regdate date default sysdate, 
      updatedate date default sysdate,
      enabled char(1) default '1');


create table tbl_member_auth (
     userid varchar2(50) not null,
     auth varchar2(50) not null,
     constraint fk_member_auth foreign key(userid) references tbl_member(userid)
);

insert into tbl_member(userid, userpw, username) values('user',1111,'테스트');
insert into tbl_member(userid, userpw, username) values('manager',1111,'테스트');
insert into tbl_member(userid, userpw, username) values('admin',1111,'테스트');
-- 값의 범위 도메인

insert into tbl_member_auth(userid, auth) values('user','ROLE_USER');
insert into tbl_member_auth(userid, auth) values('manager','ROLE_MANAGER');
insert into tbl_member_auth(userid, auth) values('admin','ROLE_ADMIN');
ROLLBACK;

select * from tbl_member;

select * from tbl_member_auth;

select mem.userid,userpw,username,enabled,regdate,updatedate,auth
			from tbl_member mem left outer join tbl_member_auth auth
			on mem.userid = auth.userid 
			where mem.userid = 'user2';  