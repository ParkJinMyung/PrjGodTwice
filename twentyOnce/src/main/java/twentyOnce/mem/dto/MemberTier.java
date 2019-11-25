package twentyOnce.mem.dto;

public class MemberTier {
	
	//point limit
	
/*
 * tier0: 0점
 * tier1: 1~499
 * tier2: 500~1499
 * tier3: 1500~3499
 * tier4: 3500~
 */
	
	int tier1limit=1;
	int tier2limit=500;
	int tier3limit=1500;
	int tier4limit=3500;
	
	public int tierbypoint(int point) {//point를 받고, tier를 리턴함.
		
		int tier;
		
		if (point==0) {
			tier=0;
		} else if (point>tier1limit) {
			tier=1;
		} else if (point>tier2limit) {
			tier=2;
		} else if (point>tier3limit) {
			tier=3;
		} else if (point>tier4limit) {
			tier=4;
		} else {
			tier=9;
		}
		
		return tier;
	}

}
