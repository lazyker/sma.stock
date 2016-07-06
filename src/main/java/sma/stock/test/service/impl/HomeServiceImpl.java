package sma.stock.test.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import sma.stock.test.dao.HomeDao;
import sma.stock.test.service.HomeService;

@Service
public class HomeServiceImpl implements HomeService {
  
	@Autowired
	private HomeDao homeDao;

	@Override
	public String getToday() {
		return homeDao.getToday();
	}
	
}