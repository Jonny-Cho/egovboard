package egovframework.example.sample.domain;

public class Board {
	
	private String bid;
	private String busername;
	private String btitle;
	private String bcontent;
	
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getBusername() {
		return busername;
	}
	public void setBusername(String busername) {
		this.busername = busername;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	
	@Override
	public String toString() {
		return "Board [bid=" + bid + ", busername=" + busername + ", btitle=" + btitle + ", bcontent=" + bcontent + "]";
	}
	
}