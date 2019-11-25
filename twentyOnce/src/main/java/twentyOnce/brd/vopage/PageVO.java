package twentyOnce.brd.vopage;

public class PageVO {
	private int displayRowCount = 10; // 페이지, 화면당 출력할 데이터 개수

	private int curPage; // 현재 페이지
	private int prevPage; // 이전 페이지
	private int nextPage; // 다음 페이지

	private int totPage; // 전체 페이지 개수.전체 가로다
	private int totBlock; // 전체 페이지 블록 개수
	private int curBlock; // 현재 페이지의 블록 다음으로 넘어가기 전에 블록 여기는 11번부터가 2블록

	private int prevBlock; // 이전 페이지 블록
	private int nextBlock; // 다음 페이지 블록

	private int rowStart; // 시작행 번호
	private int rowEnd; // 종료행 번호

	private int blockBegin; // 현재 페이지블록의 시작번호
	private int blockEnd; // 현재 페이지 블록의 끝번호

	public PageVO(int total, int curPage) {
		curBlock = 1; // 현재 페이지 블록 번호
		this.curPage = curPage; // 현재 페이지 설정
		setTotPage(total); // 전체 페이지수 계산
		setPageRange();
		setTotBlock(); // 전체 페이지 블록
		setBlockRange(); // 페이지 블록의 시작

	}

	private void setBlockRange() {
		// 현재 페이지가 몇번째 페이지의 불록에 속해있는지 계산
		curBlock = (int) Math.ceil((curPage - 1) / displayRowCount) + 1;
		// 현재 페이지 블록의 시작번호. 끝 번호 계산
		blockBegin = (curBlock - 1) * displayRowCount + 1;
		// 현재 페이지 블록의 끝 번호
		blockEnd = blockBegin + displayRowCount - 1;
		// 마지막 블록이 범위 초과하지 않도록
		if (blockEnd > totPage) {
			blockEnd = totPage;
		}
		// 이전 눌렀을 때 이동할 페이지 번호
		prevPage = (curPage == 1) ? 1 : (curBlock - 1) * displayRowCount;
		// 다음 눌렀을 때 이동할 페이지 번호
		nextPage = curBlock > totBlock ? (curBlock * displayRowCount) : (curBlock * displayRowCount) + 1;
		// 마지막 페이지 번호가 범위를 초과하지 않도록 ! 계산
		if (nextPage >= totPage) {
			nextPage = totPage;

		}

	}

	private void setPageRange() {
		// 시작레코드 = (현재 페이지 -1) * 페이지당 개시물 수 +1
		rowStart = (curPage - 1) * displayRowCount + 1;
		// 끝 레코드= 시작레코드 + 페이지당 게시물 수 -1
		rowEnd = rowStart + displayRowCount - 1;

	}

	public int getCurPage() {
		return curPage; // 현재 페이지
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPrevPage() {
		return prevPage; // 이전 페이지
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage; // 다음 페이지
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getTotPage() {
		return totPage; // 전체 페이지수.전체 가로
	}

	public void setTotPage(int total) {
		// ceil함수 : 실수 올림 처리.
		totPage = (int) Math.ceil(total * 1.0 / displayRowCount);
	}

	public int getTotBlock() {
		return totBlock; // 전체 페이지 블록수
	}

	public void setTotBlock() {
		// 전체 페이지 블록수 =  전체 페이지 수 / 화면에 보여줄 데이터 수 
		// 전체가 40페이지라면 4개의 블록
		totBlock = (int) Math.ceil(totPage / displayRowCount);
	}

	public int getCurBlock() {
		return curBlock; // 현재 페이지 블록
	}

	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}

	public int getPrevBlock() {
		return prevBlock; // 이전 페이지 블록
	}

	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}

	public int getNextBlock() {
		return nextBlock; // 다음 페이지 블록
	}

	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}



	public int getRowStart() {
		return rowStart;
	}

	public void setRowStart(int rowStart) {
		this.rowStart = rowStart;
	}

	public int getRowEnd() {
		return rowEnd;
	}

	public void setRowEnd(int rowEnd) {
		this.rowEnd = rowEnd;
	}

	public int getBlockBegin() {
		return blockBegin; // 현재 페이지블록의 시작번호
	}

	public void setBlockBegin(int blockBegin) {
		this.blockBegin = blockBegin;
	}

	public int getBlockEnd() {
		return blockEnd; // 현재 페이지 블록의 끝번호
	}

	public void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}

}
