package cj2006.conn;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Cj2006Proc {
	//현재날짜와 DB의 날짜 차이를 구한 후 정수 값으로 반환하는 메소드
	public int timeDiff(String wCdate) {
		//오늘 날짜를 문자로 ...
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
		String strToday = sdf.format(cal.getTime());
		
		//문자형식의 날짜를 다시 날짜형식으로...
		Date today = null;
		try {
			today = sdf.parse(strToday);
		} catch (ParseException e) {}
		
		//DB에서 가져온 날짜형식의 자료 편집...
		//wCdate을 문자형식에 따른 분류...('yyyyMMddHHmm')
		//2020-10-20 17:14:25.0
		String strWCdate = wCdate.substring(0,4)+wCdate.substring(5,7)+wCdate.substring(8,10)+wCdate.substring(11,13)+wCdate.substring(14,16);

		//문자형식의 wDate를 날짜형식으로 ...
		Date dateWdate = null;
		try {
			dateWdate = sdf.parse(strWCdate);
		} catch (ParseException e) {}
		
		long diffTime = (today.getTime() - dateWdate.getTime()) / (60 * 60 * 1000); //시간으로 변환
		
		int res = (int) diffTime;
		
		return res;
	}
}
