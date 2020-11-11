create table pds (
	idx		int not null 	auto_increment, /*자료실 고유번호*/
	nickname 	varchar(20)  not null, 		/*별명*/
	fname 		varchar(100) not null,		/*업로드시 올린 파일명*/
	rfname		varchar(100) not null,		/*서버에 저장되는 실제 파일명*/
	title 		varchar(100) not null,		/*파일에 대한 기본설명(제목)*/
	part 		varchar(20)  not null,		/*파일분류*/
	pwd			varchar(20)  not null,		/*업로드 파일의 비밀번호*/
	fdate		datetime	 default now(),	/*파일 업로드한 날짜*/
	fsize		varchar(100) not null,		/*파일 크기*/
	downnum		int default 0, 				/*파일 다운로드 횟수*/
	opensw		varchar(10) default '공개',	/*파일 공개 여부(공개/비공개)*/
	content		text,						/*파일에 대한 상세 설명*/
	primary key (idx)						/*기본키 : 파일 고유번호*/
);

desc pds

select * from pds

delete from pds