/*설문지 내역*/
create table survey(
	idx int not null auto_increment,	/*설문지 고유번호	*/
	sdate	datetime not null,			/*과정 개설 날짜		*/
	kwajung	varchar(60) not null,		/*과정명			*/
	kwamok 	varchar(60) not null, 		/*과목명			*/
	kcode 	varchar(60) not null,		/*능력단위 코드		*/
	danwi	varchar(60) not null, 		/*능력단위명		*/
	wdate	varchar(60)	not null,		/*평가일시			*/
	question1 varchar(100) not null,	/*평가문항 1~8개	*/
	question2 varchar(100) not null,	/*평가문항 1~8개	*/
	question3 varchar(100) not null,	/*평가문항 1~8개	*/
	question4 varchar(100) not null,	/*평가문항 1~8개	*/
	question5 varchar(100) not null,	/*평가문항 1~8개	*/
	question6 varchar(100) not null,	/*평가문항 1~8개	*/
	question7 varchar(100) not null,	/*평가문항 1~8개	*/
	question8 varchar(100) not null,	/*평가문항 1~8개	*/
	primary key(idx)
);	

create table survey_answer(
	idx 	int not null auto_increment,/*응답내용 고유번호 	*/
	survey_idx 	int not null,			/*현재 작성하는 '설문지의 고유번호'*/
	answer1 	int not null,			/*설문지의 행당 항목 번호 1~8*/	
	answer2 	int not null,			/*설문지의 행당 항목 번호 1~8*/	
	answer3 	int not null,			/*설문지의 행당 항목 번호 1~8*/	
	answer4 	int not null,			/*설문지의 행당 항목 번호 1~8*/	
	answer5 	int not null,			/*설문지의 행당 항목 번호 1~8*/	
	answer6 	int not null,			/*설문지의 행당 항목 번호 1~8*/	
	answer7 	int not null,			/*설문지의 행당 항목 번호 1~8*/	
	answer8 	text,					/*설문지의 행당 항목 번호 1~8*/	
	primary key (idx),
	foreign key (survey_idx) references survey(idx)
	on update cascade on delete RESTRICT
);

select kwamok from survey
select kwajung from survey

drop table survey
drop table survey_answer

select sdate from survey group by sdate
select * from survey_answer


select a.idx
	 , a.sdate
	 , a.question1
	 , (select count(*) from survey_answer where survey_idx =a.idx and answer1 = 5) as '매우만족'
	 , (select count(*) from survey_answer where survey_idx =a.idx and answer1 = 4) as '만족'
	 , (select count(*) from survey_answer where survey_idx =a.idx and answer1 = 3) as '보통'
	 , (select count(*) from survey_answer where survey_idx =a.idx and answer1 = 2) as '불만'
	 , (select count(*) from survey_answer where survey_idx =a.idx and answer1 = 1) as '매우불만'
from survey a
where a.idx = 2

union all

select a.idx
	 , a.sdate
	 , a.question2
	 , (select count(*) from survey_answer where survey_idx =a.idx and answer2 = 5) as '매우만족'
	 , (select count(*) from survey_answer where survey_idx =a.idx and answer2 = 4) as '만족'
	 , (select count(*) from survey_answer where survey_idx =a.idx and answer2 = 3) as '보통'
	 , (select count(*) from survey_answer where survey_idx =a.idx and answer2 = 2) as '불만'
	 , (select count(*) from survey_answer where survey_idx =a.idx and answer2 = 1) as '매우불만'
from survey a
where a.idx = 2

select * from survey

select a.sdate,a.kwajung,a.kwamok,a.kcode,a.danwi,a.wdate, b.*
from survey a
join survey_answer b
on a.idx = b.survey_idx
where a.idx = 1

select count(*) 
from survey 
where survey_idx = 1
and answer1 = 4