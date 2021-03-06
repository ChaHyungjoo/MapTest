package com.hjoo.webapp.dao;



import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hjoo.webapp.entity.CommentView;
import com.hjoo.webapp.entity.Restaurant;
import com.hjoo.webapp.entity.RestaurantView;

public interface RestaurantDao {

	//List<Restaurant> getList(@Param("page")int page, @Param("field")String field, String query);
	List<Restaurant> getList();
	int getCount();
	RestaurantView get(int id);
	RestaurantView getPrev(int id);
	RestaurantView getNext(int id);
	int getNextId();
	int insert(String name, String location, String address, String content, String genre, String keyword, String image, String tip,int memberId, int lastMemberId, Date regDate);
	int insert(Restaurant restaurant);
	
	List<CommentView> getCmt(@Param("id")int id, @Param("page")int page);
	int cmtCount(int id);
}
