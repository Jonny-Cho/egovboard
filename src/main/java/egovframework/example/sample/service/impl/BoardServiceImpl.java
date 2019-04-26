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
		String url = MessageFormat.format("http://localhost:8080/selectBoardListCount?searchOption={0}&keyword={1}&startDate={2}&endDate={3}"
				, new Object[] { pageVO.getSearchOption(), pageVO.getKeyword(), pageVO.getStartDate(), pageVO.getEndDate() });
		return Integer.parseInt(HttpUtil.get(url));
	}
	
	@Override
	public String selectBoardList(PageVO pageVO) throws IOException {
		String url = MessageFormat.format("http://localhost:8080/board?page={0}&perPageNum={1}&searchOption={2}&keyword={3}&startDate={4}&endDate={5}"
				, new Object[] { pageVO.getPage() , pageVO.getPerPageNum() , pageVO.getSearchOption(), pageVO.getKeyword(), pageVO.getStartDate(), pageVO.getEndDate() });
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

