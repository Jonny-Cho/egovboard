package egovframework.example.sample.service;

import java.io.IOException;

import egovframework.example.sample.domain.BoardVo;
import egovframework.example.sample.domain.PageVo;

public interface BoardService {
	
	public int selectBoardListCount(PageVo pageVo) throws NumberFormatException, IOException;
	
	public String selectBoardList(PageVo pageVo) throws IOException;
	
	public String selectBoardDetail(String bid) throws IOException;
	
	public String insertBoard(BoardVo boardVo) throws IOException;
	
	public String updateBoard(BoardVo boardVo) throws IOException;
	
	public String deleteBoard(String bid) throws IOException;
	
}
