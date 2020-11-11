package T0922;

public class TestProcess {
	public int power(int su1, int su2) {
		int res = 1;
		
		for(int i=0; i<su2; i++) {
			res *= su1;
		}
		
		return res;
	}
}
