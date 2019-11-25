package twentyOnce.vis.dto;

public class GraphDto {
	
	int grphdate;
	int grphcount;
	
	public GraphDto() {
		
	}
	
	public GraphDto(int grphdate, int grphcount) {
		this.grphdate=grphdate;
		this.grphcount=grphcount;
	}

	public int getGrphdate() {
		return grphdate;
	}

	public void setGrphdate(int grphdate) {
		this.grphdate = grphdate;
	}

	public int getGrphcount() {
		return grphcount;
	}

	public void setGrphcount(int grphcount) {
		this.grphcount = grphcount;
	}
	
}
