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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@GetMapping("/list")
    public String boardList(Model model) throws IOException{
		logger.info("boardList()");
		model.addAttribute("strTitle", "게시글 목록");
        return "board/list.page";
    }
	
	@GetMapping("/list/{bid}")
	public String boardDetail(@PathVariable String bid, Model model) throws IOException {
		logger.info("BoardDetail()");
		model.addAttribute("bid", bid);
		model.addAttribute("strTitle", "게시글 상세");
		return "board/content.page";
	}
	
	@GetMapping("/write")
	public String writeBoard(Model model) throws IOException {
		logger.info("writeBoard()");
		model.addAttribute("strTitle", "글쓰기");
		return "board/write.page";
	}
	
	@GetMapping("/update/{bid}")
	public String updateBoard(@PathVariable String bid, Model model) throws IOException {
		logger.info("updateBoard(), bid = " + bid);
		model.addAttribute("bid", bid);
		model.addAttribute("strTitle", "수정하기");
		return "board/update.page";
	}
	

	
}
