/*login.sql*/
/*
  1. JDBC 드라이버를 프로젝트에 올려준다.(lib폴더에 복사한다.)
  2. 데이터베이스/테이블/필드 설계를 한다.
  3. Vo 만든다.(Java)
  4. Dao 만든다.(Java)
  		:Database 연결작업
  			(1) JDBC 드라이버 검색
  			(2) Connection객체를 통한 DB연결 <-- 초기DAO 작업시는 이곳까지 설정해둔다.
  			   - 아래 3,4번은 프로그램 실행부터 하나씩 처리한다.
  			(3) Statement/PreparedStatement객체를 이용하여 테이블 처리
  			(4) 3번의 결과를 돌려받으려면 ResultSet객체로 처리
  5. 화면ㄴ 폼 만들기(jsp)
  6. Database 연동을 위한 프로그램처리(jsp 또는 servlet로 처리한다.)		 
 **/

show tables;

create table login(
	idx int not null auto_increment primary key,
	mid varchar(20) not null ,
	pwd varchar(20) not null,
	name varchar(20) not null
);


desc login;

insert into login values (default, 'hkd1234','1234','홍길동');
insert into login values (default, 'kms1234', '1234','김말숙');

select * from login;

