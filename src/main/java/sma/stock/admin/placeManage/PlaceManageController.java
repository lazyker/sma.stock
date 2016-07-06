package sma.stock.admin.placeManage;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/place")
public class PlaceManageController {
	
	private static final Logger logger = LoggerFactory.getLogger(PlaceManageController.class);
	
	
	@RequestMapping(value = "/placeList", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/place/placeList";
	}
	
	@RequestMapping(value = "/placeWrite", method = RequestMethod.GET)
	public String placeWrite(@RequestParam(value="type",  required=false) String type, Model model) {
		
		if ("U".equals(type)) {
			//상세정보 select
		}
		
		return "/place/placeWrite";
	}
	
}
