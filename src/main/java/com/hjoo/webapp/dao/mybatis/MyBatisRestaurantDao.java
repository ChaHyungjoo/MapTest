package com.hjoo.webapp.dao.mybatis;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.hjoo.webapp.dao.RestaurantDao;
import com.hjoo.webapp.entity.CommentView;
import com.hjoo.webapp.entity.Restaurant;
import com.hjoo.webapp.entity.RestaurantView;

public class MyBatisRestaurantDao implements RestaurantDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/*@Override
	public List<Restaurant> getList(int page, String field, String query) {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		List<Restaurant> list = restaurantDao.getList(page, field, query);
		
		return list;
	}*/
	
	@Override
	public List<Restaurant> getList() {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		List<Restaurant> list = restaurantDao.getList();
		
		return list;
	}
	
	@Override
	public RestaurantView get(int id) {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		return restaurantDao.get(id);
	}
	
	@Override
	public int getCount() {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		int result = restaurantDao.getCount();
		
		return result;
	}
	
	@Override
	public int insert(Restaurant restaurant) {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		int result = restaurantDao.insert(restaurant);
		
		return result;
	}

	@Override
	public int insert(String name, String location, String address, String content, String genre, String keyword, String image, String tip, int memberId, int lastMemberId, Date regDate) {
		
		return insert(new Restaurant(name, location, address, content, genre, keyword, image, tip, memberId, lastMemberId, regDate));
	}


	@Override
	public int getNextId() {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		
		return restaurantDao.getNextId();
	}

	@Override
	public RestaurantView getPrev(int id) {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		
		return restaurantDao.getPrev(id);
	}

	@Override
	public RestaurantView getNext(int id) {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		
		return restaurantDao.getNext(id);
	}

	@Override
	public List<CommentView> getCmt(int id, int page) {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		List<CommentView> list = restaurantDao.getCmt(id, page);
		
		return list;
	}

	@Override
	public int cmtCount(int id) {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		
		return restaurantDao.cmtCount(id);
	}

	

}
