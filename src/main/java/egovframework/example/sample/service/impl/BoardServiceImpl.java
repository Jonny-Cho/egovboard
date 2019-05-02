package egovframework.example.sample.service.impl;

import java.io.IOException;
import java.text.MessageFormat;

import org.springframework.stereotype.Service;

import egovframework.example.sample.domain.BoardVo;
import egovframework.example.sample.domain.PageVo;
import egovframework.example.sample.service.BoardService;
import egovframework.example.sample.util.HttpUtil;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Override
	public int selectBoardListCount(PageVo pageVo) throws NumberFormatException, IOException {
		String url = MessageFormat.format("http://localhost:8080/selectBoardListCount?searchOption={0}&keyword={1}&startDate={2}&endDate={3}"
				, new Object[] { pageVo.getSearchOption(), pageVo.getKeyword(), pageVo.getStartDate(), pageVo.getEndDate() });
		return Integer.parseInt(HttpUtil.get(url));
	}
	
	@Override
	public String selectBoardList(PageVo pageVo) throws IOException {
		String url = MessageFormat.format("http://localhost:8080/board?page={0}&perPageNum={1}&searchOption={2}&keyword={3}&startDate={4}&endDate={5}"
				, new Object[] { pageVo.getPage() , pageVo.getPerPageNum() , pageVo.getSearchOption(), pageVo.getKeyword(), pageVo.getStartDate(), pageVo.getEndDate() });
		return HttpUtil.get(url);
	}
	
	@Override
	public String selectBoardDetail(String bid) throws IOException {
		return HttpUtil.get("http://localhost:8080/board/" + bid);
	}
	
	@Override
	public String insertBoard(BoardVo boardVo) throws IOException {
		return HttpUtil.post("http://localhost:8080/board", boardVo);
	}
	
	@Override
	public String updateBoard(BoardVo boardVo) throws IOException {
		return HttpUtil.put("http://localhost:8080/board", boardVo);
	}
	
	@Override
	public String deleteBoard(String bid) throws IOException {
		return HttpUtil.delete("http://localhost:8080/board/" + bid);
	}
	
}

