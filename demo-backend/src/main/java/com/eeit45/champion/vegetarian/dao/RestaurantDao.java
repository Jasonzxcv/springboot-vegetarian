package com.eeit45.champion.vegetarian.dao;

import java.util.List;

import com.eeit45.champion.vegetarian.dto.RestaurantQueryParams;
import com.eeit45.champion.vegetarian.dto.RestaurantRequest;
import com.eeit45.champion.vegetarian.model.Post;
import com.eeit45.champion.vegetarian.model.PostFavorite;
import com.eeit45.champion.vegetarian.model.Restaurant;
import com.eeit45.champion.vegetarian.model.SaveRestaurant;

public interface RestaurantDao {
	
	Integer countRestaurant (RestaurantQueryParams restaurantQueryParams);
	
	List<Restaurant> getAllRestaurants();
	List<Restaurant> getRestaurants(RestaurantQueryParams restaurantQueryParams);
	
	Restaurant getRestaurantByNumber(Integer restaurantNumber);
	Integer createRestaurant(RestaurantRequest restaurantRequest);
	void updateRestaurant(Integer restaurantNumber,RestaurantRequest restaurantRequest);
	void deleteRestaurantByNumber(Integer restaurantNumber);
	
	void addSaveRestaurant(int pid, int uid);
	boolean delSaveRestaurant(int pid, int uid);
	SaveRestaurant findBySave(int pid, int uid);
	List<Restaurant> findSaveRestaurant(int uid);
}
