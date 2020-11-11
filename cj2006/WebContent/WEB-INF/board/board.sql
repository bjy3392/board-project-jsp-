show tables;

create table board(
	idx int not null auto_increment,  	/*게시글의 고유번호*/
	name varchar(20) not null,			/*글쓴이*/
	email varchar(50),					/*이메일주소*/
	homepage varchar(50),				/*홈페이지(블로그)주소*/
	title	varchar(100) not null,		/*글제목*/
	pwd varchar(20)	not null,			/*글 비밀번호*/
	wdate datetime default now(),		/*글올린날짜*/
	readnum int default 0,				/*글조회수*/
	hostip varchar(50) not null,		/*hostIP*/
	content text not null,				/*글 종류*/
	primary key(idx)
);

desc board;

insert into board values (default, '배지영','bjy1234@naver.com','blog/jiyuong','안녕하세요','1234',default,default,'127.0.0.0','첫번째 게시글 테스트');


select * from board where content like '%hi%'

select * from board

/*댓글 테이블*/
create table board_cont(
	idx int not null auto_increment, 	/*댓글 고유번호*/
	board_idx int not null,				/*해당 게시글의 고유번호*/
	nickname varchar(20) not null,		/*댓글쓴 사람의 별명(성명)*/
	wdate datetime not null default now(), /*댓글 올린 날짜*/
	hostip varchar(50) not null,		/*댓글 작성자의 IP*/
	content text not null,				/*댓글내용*/
	primary key(idx),
	foreign key(board_idx) references board(idx) on update cascade on delete restrict 
);

desc board_cont;

select * from board_cont;

select A.* , b.cnt
from (select * from board order by idx desc limit 0,5) A
left outer join (select count(*) as cnt , board_idx from board_cont group by board_idx) B
on A.idx = B.board_idx;

select idx from board
where idx < 1
order by idx desc 
limit 1

select * from board where idx = 12

select idx from board where name like '관리자' and idx < 6  order by idx desc limit 1;

select idx from board where idx = 18 and pwd='1234' 

select idx from board 
where title like '%안녕%' 
and idx < 25 
order by idx desc limit 1;

/*mid추가 및 업데이트*/
alter table board add mid varchar(20) not null

update board a, member b
set a.mid = b.mid
where a.name = b.nickname

alter table board_cont add mid varchar(20) not null

update board_cont a, member b
set a.mid = b.mid
where a.nickname = b.nickname

alter table board_cont drop mid

select * from member

