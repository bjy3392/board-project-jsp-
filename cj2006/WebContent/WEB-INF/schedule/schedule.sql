create table schedule(
	idx int not null auto_increment,  	/*스케쥴 고유번호*/
	mid varchar(20) not null, 			/*회원 아이디*/
	scdate datetime not null default now(),	/*일정 등록 날짜*/
	memory varchar(10) not null,		/*1.분류(모임<가족, 친구> 2.업무(회사, 개인) 3.학습(각 과목별) 4.여행 5.기타*/
	title varchar(100) not null, 		/*소제목*/
	content text not null,				/*세부 일정 사항*/
	primary key(idx)	
);

desc schedule

drop table schedule


insert into schedule values (default,'bjy1234','2020-11-6','모임','친구모임','지웰시티')

select * from schedule


select * from schedule

select * from schedule where scdate = ? and mid = ?