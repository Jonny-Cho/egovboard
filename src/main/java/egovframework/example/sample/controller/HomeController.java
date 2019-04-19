package egovframework.example.sample.controller;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@GetMapping("/home")
	public String home(Model model) throws IOException {
		logger.info("home()");
		model.addAttribute("strTitle", "홈");
		return "home/home.page";
	}
	
}
