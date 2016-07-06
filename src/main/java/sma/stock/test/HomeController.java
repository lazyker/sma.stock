package sma.stock.test;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import sma.stock.test.service.HomeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private HomeService homeService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/test/home";
	}
	
	@RequestMapping(value="/dbConnectionTest", method=RequestMethod.GET)
	public String dbConnectionTest(ModelMap model) {
		
		//sql 호출
		String today = homeService.getToday();
		model.put("today", today);
		
		return "test/home";
	}
	
	//datepicker sample page
	@RequestMapping(value="/datepickerTest", method=RequestMethod.GET)
	public String detepickerTest(ModelMap model) {
		
		return "test/datepickerTest";
	}

	//datatable sample page
	@RequestMapping(value="/dataTableTest")
	public String dataTalbeTest(@RequestParam(value="id",  required=false) List<String> values,  Map<String, Object> paramMap, ModelMap model) {
		
		return "test/dataTableTest";
	}
	
	//datatable sample page
	@RequestMapping(value="/dataTableTest2", method=RequestMethod.GET)
	public String dataTalbeTest2(ModelMap model) {
		
		return "test/dataTableTest2";
	}
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String main(ModelMap model) {
		
		return "user/main";
	}
	
}
