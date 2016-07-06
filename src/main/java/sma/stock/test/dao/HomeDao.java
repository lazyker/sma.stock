package sma.stock.test.dao;

import org.springframework.stereotype.Repository;

import sma.stock.common.abstractDao.AbstractDao;

@Repository
public class HomeDao extends AbstractDao {
	
	@SuppressWarnings("unchecked")
	public String getToday() {
		return (String) selectOne("home.getToday");
	}
	
}