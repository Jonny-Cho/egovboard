package egovframework.example.sample.service.impl;

import java.io.IOException;
import java.text.MessageFormat;

import org.springframework.stereotype.Service;

import egovframework.example.sample.domain.BoardVO;
import egovframework.example.sample.domain.PageVO;
import egovframework.example.sample.service.BoardService;
import egovframework.example.sample.util.HttpUtil;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Override
	public int selectBoardListCount(PageVO pageVO) throws NumberFormatException, IOException {
		System.out.println(pageVO.toString());
		return Integer.parseInt(HttpUtil.get("http://localhost:8080/selectBoardListCount?keyword="+pageVO.getKeyword()));
	}
	
	@Override
	public String selectBoardList(PageVO pageVO) throws IOException {
		String url = MessageFormat.format("http://localhost:8080/board?page={0}&perPageNum={1}&keyword={2}"
				, new Object[] { pageVO.getPage() , pageVO.getPerPageNum() , pageVO.getKeyword() });
		return HttpUtil.get(url);
	}
	
	@Override
	public String selectBoardDetail(String bid) throws IOException {
		return HttpUtil.get("http://localhost:8080/board/" + bid);
	}
	
	@Override
	public String insertBoard(BoardVO boardVO) throws IOException {
		return HttpUtil.post("http://localhost:8080/board", boardVO);
	}
	
	@Override
	public String updateBoard(BoardVO boardVO) throws IOException {
		return HttpUtil.put("http://localhost:8080/board", boardVO);
	}
	
	@Override
	public String deleteBoard(String bid) throws IOException {
		return HttpUtil.delete("http://localhost:8080/board/" + bid);
	}
	
}

