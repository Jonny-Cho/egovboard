package egovframework.example.sample.service;

import java.io.IOException;

import egovframework.example.sample.domain.Board;

public interface BoardService {
	
	public String selectBoardList() throws IOException;

	public String selectBoardDetail(String bid) throws IOException;

	public String insertBoard(Board board) throws IOException;

	public String updateBoard(Board board) throws IOException;
	
	public String deleteBoard(String bid) throws IOException;
	
}
