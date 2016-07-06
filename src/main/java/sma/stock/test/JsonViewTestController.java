package sma.stock.test;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JsonViewTestController {
	private static final Logger logger = LoggerFactory.getLogger(JsonViewTestController.class);
	
	@RequestMapping(value = "/jsonViewTest", method = RequestMethod.GET)
	public @ResponseBody Map<String , Object> josnViewTest(Locale locale, Model model) {
		Map<String, Object> jsonObject = new HashMap<String, Object>();
		Map<String, Object> jsonSubObject = null;
		ArrayList<Map<String, Object>> jsonList = new ArrayList<Map<String, Object>>();
		         
		    //1번째 데이터
		    jsonSubObject = new HashMap<String, Object>();
		    jsonSubObject.put("idx", 1);
		    jsonSubObject.put("title", "제목입니다");
		    jsonSubObject.put("createDate", new Date());
		    jsonList.add(jsonSubObject);
		    //2번째 데이터
		    jsonSubObject = new HashMap<String, Object>();
		    jsonSubObject.put("idx", 2);
		    jsonSubObject.put("title", "두번째제목입니다");
		    jsonSubObject.put("createDate", new Date());
		    jsonList.add(jsonSubObject);
		         
		    jsonObject.put("success", true);
		    jsonObject.put("total_count", 10);
		    jsonObject.put("data", jsonList);
		
		return jsonObject;
	}
}
