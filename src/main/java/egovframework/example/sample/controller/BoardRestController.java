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

import egovframework.example.sample.domain.Board;
import egovframework.example.sample.service.BoardService;
	
@RestController
public class BoardRestController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardRestController.class);
	
	@Resource(name = "boardService")
	private BoardService bs;
	
	@GetMapping(value="/board", produces = "application/json; charset=utf8")
	public String getBoardList() throws Exception {
		logger.info("getBoardList()");
		return bs.selectBoardList();
	}
	
	@GetMapping(value="/board/{bid}", produces = "application/json; charset=utf8")
	public String getContent(@PathVariable String bid) throws Exception {
		logger.info("getContent(), bid = " + bid);
		return bs.selectBoardDetail(bid);
	}
	
	@PostMapping(value="/board", produces = "application/json; charset=utf8")
	public String createBoard(@RequestBody Board board) throws Exception {
		logger.info("createBoard()");
		logger.info(board.toString());
		return bs.insertBoard(board);
	}
	
	@PutMapping(value="/board", produces = "application/json; charset=utf8")
	public String updateBoard(@RequestBody Board board) throws Exception {
		logger.info("updateBoard()");
		logger.info(board.toString());
		return bs.updateBoard(board);
	}
	
	@DeleteMapping(value="/board/{bid}", produces = "application/json; charset=utf8")
	public String deleteBoard(@PathVariable String bid) throws Exception {
		logger.info("deleteBoard(), bid = " + bid);
		return bs.deleteBoard(bid);
	}
	
}
