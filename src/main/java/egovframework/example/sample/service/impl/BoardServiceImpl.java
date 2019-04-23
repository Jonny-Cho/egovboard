package egovframework.example.sample.service.impl;

import java.io.IOException;
import java.text.MessageFormat;

import org.springframework.stereotype.Service;

import egovframework.example.sample.domain.Board;
import egovframework.example.sample.domain.PageCriteria;
import egovframework.example.sample.service.BoardService;
import egovframework.example.sample.util.HttpUtil;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Override
	public int selectBoardListCount() throws NumberFormatException, IOException {
		return Integer.parseInt(HttpUtil.get("http://localhost:8080/selectBoardListCount"));
	}

	@Override
	public String selectBoardList(PageCriteria pageCriteria) throws IOException {
		String url = MessageFormat.format("http://localhost:8080/board?page={0}&perPageNum={1}"
				, new Object[] { pageCriteria.getPage() , pageCriteria.getPerPageNum() });
		return HttpUtil.get(url);
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

