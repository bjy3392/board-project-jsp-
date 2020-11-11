
create table member(
	idx 	 int not null auto_increment primary key,
	mid 	 varchar(20) not null , /*중복불허*/
	pwd 	 varchar(20) not null,
	nickname varchar(20) not null,   /*닉네님 중복불허*/
	name 	 varchar(20) not null, 
	gender 	 char(2) not null default '여자',
	birth 	 datetime,
	tel 	 varchar(15),
	address  varchar(50),
	email 	 varchar(50),
	homepage varchar(50),
	job 	 varchar(20),
	hobby 	 varchar(50) default '',
	userinfo char(2) default 'OK',
	userdel  char(2) default 'NO',
	level	 varchar(10) default '준회원'
);


select * from member

update member set level="관리자" where mid="admin"

update member set userdel="OK" where mid='bjy1010'