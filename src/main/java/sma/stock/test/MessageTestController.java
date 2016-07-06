package sma.stock.test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import sma.stock.common.utils.MessageUtil;

@Controller
public class MessageTestController {
	
	@Autowired
	private MessageUtil messageUtil;
	
	private static final Logger logger = LoggerFactory.getLogger(MessageTestController.class);
	
	@RequestMapping(value = "/messageTest", method = RequestMethod.GET)
	public String message() {
		
		String msg = messageUtil.getMessage("common.regist.msg");
		logger.info("message_ko : {}.", msg);
		
		return "/test/messageTest";
	}
	
}
