package egovframework.example.sample.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import egovframework.example.sample.domain.BoardVo;
import egovframework.example.sample.domain.PageVo;
import egovframework.example.sample.service.BoardService;

@RestController
public class BoardRestController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardRestController.class);
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	// 총 게시글 수 요청 메서드
	@GetMapping("/countTotalBoard")
	public int countTotalBoard(PageVo pageVo) throws Exception{
		logger.info("countTotalBoard()");
		logger.info(pageVo.toString());
		return boardService.selectBoardListCount(pageVo);
	}
	
	@GetMapping(value="/board", produces = "application/json; charset=utf8")
	public String getBoardList(PageVo pageVo) throws Exception {
		logger.info("getBoardList()");
		logger.info(pageVo.toString());
		return boardService.selectBoardList(pageVo);
	}
	
	@GetMapping(value="/board/{bid}", produces = "application/json; charset=utf8")
	public String getContent(@PathVariable String bid) throws Exception {
		logger.info("getContent(), bid = " + bid);
		return boardService.selectBoardDetail(bid);
	}
	
	@PostMapping(value="/board", produces = "application/json; charset=utf8")
	public String createBoard(@RequestBody BoardVo boardVo) throws Exception {
		logger.info("createBoard()");
		logger.info(boardVo.toString());
		return boardService.insertBoard(boardVo);
	}
	
	@PutMapping(value="/board", produces = "application/json; charset=utf8")
	public String updateBoard(@RequestBody BoardVo boardVo) throws Exception {
		logger.info("updateBoard()");
		logger.info(boardVo.toString());
		return boardService.updateBoard(boardVo);
	}
	
	@DeleteMapping(value="/board/{bid}", produces = "application/json; charset=utf8")
	public String deleteBoard(@PathVariable String bid) throws Exception {
		logger.info("deleteBoard(), bid = " + bid);
		return boardService.deleteBoard(bid);
	}
	
}
