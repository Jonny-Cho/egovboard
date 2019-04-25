package egovframework.example.sample.domain;

public class PageVO {
	private int page = 1;
	private int perPageNum = 20;
	private String keyword;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	// for SQL
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		if(perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 20;
			return;
		}
		this.perPageNum = perPageNum;
	}
	// for SQL
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	@Override
	public String toString() {
		return "PageVO [page=" + page + ", perPageNum=" + perPageNum + ", keyword=" + keyword + "]";
	}
	
}
