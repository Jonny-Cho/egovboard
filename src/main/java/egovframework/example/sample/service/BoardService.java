package egovframework.example.sample.service;

import java.io.IOException;

import egovframework.example.sample.domain.BoardVO;
import egovframework.example.sample.domain.PageVO;

public interface BoardService {
	
	public int selectBoardListCount(PageVO pageVO) throws NumberFormatException, IOException;
	
	public String selectBoardList(PageVO pageVO) throws IOException;
	
	public String selectBoardDetail(String bid) throws IOException;
	
	public String insertBoard(BoardVO boardVO) throws IOException;
	
	public String updateBoard(BoardVO boardVO) throws IOException;
	
	public String deleteBoard(String bid) throws IOException;
	
}
