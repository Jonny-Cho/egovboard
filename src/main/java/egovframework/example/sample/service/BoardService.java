package egovframework.example.sample.service;

import java.io.IOException;

import egovframework.example.sample.domain.Board;
import egovframework.example.sample.domain.PageCriteria;

public interface BoardService {
	
	public int selectBoardListCount() throws NumberFormatException, IOException;
	
	public String selectBoardList(PageCriteria pageCriteria) throws IOException;
	
	public String selectBoardDetail(String bid) throws IOException;
	
	public String insertBoard(Board board) throws IOException;
	
	public String updateBoard(Board board) throws IOException;
	
	public String deleteBoard(String bid) throws IOException;
	
}
