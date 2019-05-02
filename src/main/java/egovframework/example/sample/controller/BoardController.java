/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.example.sample.controller;

import java.io.IOException;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.domain.BoardVo;
import egovframework.example.sample.service.BoardService;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	@RequestMapping("/list")
    public String boardList(BoardVo boardVo, Model model) throws IOException{
		logger.info("boardList()");
		logger.info(boardVo.toString());
		
		model.addAttribute("strTitle", "게시글 목록");
		
        return "board/list.page";
    }
	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
	@RequestMapping("/list/{bid}")
	public String boardDetail(@PathVariable String bid, BoardVo boardVo, Model model) throws IOException {
		logger.info("BoardDetail()");
		logger.info(boardVo.toString());
		
		model.addAttribute("bid", bid);
		model.addAttribute("strTitle", bid + " 번 게시글");
		
		return "board/content.page";
	}
	
	@RequestMapping("/write")
	public String writeBoard(BoardVo boardVo, Model model) throws IOException {
		logger.info("writeBoard()");
		logger.info(boardVo.toString());
		
		model.addAttribute("strTitle", "글쓰기");
		
		return "board/write.page";
	}
	
	@RequestMapping("/update/{bid}")
	public String updateBoard(@PathVariable String bid, BoardVo boardVo, Model model) throws IOException {
		logger.info("updateBoard(), bid = " + bid);
		logger.info(boardVo.toString());
		
		model.addAttribute("bid", bid);
		model.addAttribute("strTitle", "수정하기");
		
		return "board/update.page";
	}
	
}
