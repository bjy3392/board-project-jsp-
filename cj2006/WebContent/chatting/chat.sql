/*chat.sql*/

create table chat(
	idx int not null auto_increment primary key, /*채팅 고유번호*/
	nickname 	varchar(20) not null,			/*채팅시 필요한 닉네임*/
	content 	varchar(200) not null,			/*채팅내용*/
	cdate		datetime not null default now(),	/*채팅올린 날짜 시간*/
	avatar 		char(1) not null	default '1'		/*아바타*/
);

desc chat


insert into chat values (default, '배지영', '안녕!',default, default);


select * from chat


delete from chat where idx = 31

select * from webmessage
