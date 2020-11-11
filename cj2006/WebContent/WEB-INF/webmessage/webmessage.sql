create table webmessage(
	idx 		int not null auto_increment primary key,
	title 		varchar(100) not null,		/*메세지 제목*/	
	content 	text not null, 				/*메세지 내용*/
	sendId 		varchar(20) not null,		/*보내는 사람 아이디*/
	sendSw		char(1) not null default 's', /*보낸메세지(s), 휴지통 삭제(x) 표시*/
	sendDate	datetime default now(), 	/*보낸날짜*/
	receiveId	varchar(20) not null, 		/*받는 사람 아이디*/
	receiveSw 	char(1) not null default 'n', /*받는사람의 새메세지(n), 읽은 메세지(r), 휴지통(g), 삭제(x) 표시*/
	receiveDate datetime default now()		/*받은 날짜 -->읽은날짜*/
);

desc webmessage;

insert into webmessage values (default, '약속장소변경', '사창사거리에서 만나자','bjy1234',default, default,'ldy1234',default, default)
insert into webmessage values (default, '대답	', '알겠어요','ldy1234',default, default,'bjy1234',default, default)

select * from webmessage

update webmessage set sendSw = 's' where idx = 4 ;

