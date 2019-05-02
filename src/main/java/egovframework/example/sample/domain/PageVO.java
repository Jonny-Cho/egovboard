package egovframework.example.sample.domain;

public class PageVo {
	private int page = 1;
	private int perPageNum = 20;
	private String searchOption;
	private String keyword;
	private String startDate;
	private String endDate;
	
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
	public String getSearchOption() {
		return searchOption;
	}
	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	@Override
	public String toString() {
		return "PageVO [page=" + page + ", perPageNum=" + perPageNum + ", searchOption=" + searchOption + ", keyword="
				+ keyword + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}
}
