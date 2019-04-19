package egovframework.example.sample.service.impl;

import java.io.IOException;

import org.springframework.stereotype.Service;

import egovframework.example.sample.domain.Board;
import egovframework.example.sample.service.BoardService;
import egovframework.example.sample.util.HttpUtil;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Override
	public String selectBoardList() throws IOException {
		return HttpUtil.get("http://localhost:8080/board");
	}
	
	@Override
	public String selectBoardDetail(String bid) throws IOException {
		return HttpUtil.get("http://localhost:8080/board/" + bid);
	}
	
	@Override
	public String insertBoard(Board board) throws IOException {
		System.out.println(board.toString());
		return HttpUtil.post("http://localhost:8080/board", board);
	}
	
	@Override
	public String updateBoard(Board board) throws IOException {
		return HttpUtil.put("http://localhost:8080/board", board);
	}

	@Override
	public String deleteBoard(String bid) throws IOException {
		return HttpUtil.delete("http://localhost:8080/board/" + bid);
	}
	
}

