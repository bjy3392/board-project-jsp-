create table guest(
	idx int not null auto_increment primary key, /*고유번호*/
	name varchar(20) not null,
	email varchar(60),
	homepage varchar(60),
	vdate datetime not null default now(),
	hostip varchar(50) not null,
	content text not null 
);

desc guest;

insert into guest values (default,'배지영','bjy1234@naver.com','blog.naver.com/bjy1234',default,'218.216.203.132','수고하셨습니다.')

drop table member;

select * from guest

select * from guest order by idx desc limit 1,5;

select count(*) from guest;

select * from member;

show tables;


select * from guest order by vdate desc limit 3

select * from order_table_hist

select count(*) from guest;