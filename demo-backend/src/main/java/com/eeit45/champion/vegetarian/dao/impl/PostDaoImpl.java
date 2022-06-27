package com.eeit45.champion.vegetarian.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.eeit45.champion.vegetarian.dao.PostDao;
import com.eeit45.champion.vegetarian.model.Post;
import com.eeit45.champion.vegetarian.model.Product;
import com.eeit45.champion.vegetarian.rowmapper.PostRowMapper;
import com.eeit45.champion.vegetarian.rowmapper.ProductRowMapper;


@Component
public class PostDaoImpl implements PostDao {

	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	// 新增文章圖片測試
	public boolean addPostImage(Post post) {

//		Session session = sessionFactory.getCurrentSession();
//		session.save(post);
//		return true;
//		
		String sql = "INSERT INTO post ( title, postedDate, postedText, imgurl, postStatus)" +
                 "VALUES (:title, :postedDate, :postedText, :imgurl, :postStatus)";

    Map<String,Object> map = new HashMap<>();
    map.put("title",post.getTitle());
    map.put("postedDate",post.getPostedDate());
    map.put("postedText",post.getPostedText());
    map.put("imgurl",post.getImgurl());
    map.put("postStatus",post.getPostStatus());
    
    namedParameterJdbcTemplate.update(sql, map);
    
    return true;

	}

	// 刪除文章
	public boolean deletePost(int id) {

		Map<String, Object> map = new HashMap<>();
		map.put("postId", id);

		String SQL = "DELETE from post where postId = :postId ";
		namedParameterJdbcTemplate.update(SQL, map);
		System.out.println("Deleted Record with ID = " + id);
		return true;

	}

	// 更新文章
	public boolean updatePost(Post post) {

		Session session = sessionFactory.getCurrentSession();
		String hql = "UPDATE Post  set title= :title, postedText = :postedText, imgurl = :imgurl where postId = :postId ";
		int result = 0;
		result = session.createQuery(hql).setParameter("title", post.getTitle())
				.setParameter("postedText", post.getPostedText()).setParameter("imgurl", post.getImgurl())
				.setParameter("postId", post.getPostId()).executeUpdate();
		if (result > 0) {
			return true;
		} else {
			return false;
		}

	}

	public boolean updateCondition(Post post) {

		Session session = sessionFactory.getCurrentSession();
		String hql = "UPDATE Post  set postStatus= :postStatus where postId = :postId ";
		int result = 0;
		result = session.createQuery(hql).setParameter("postStatus", post.getPostStatus())
				.setParameter("postId", post.getPostId()).executeUpdate();
		if (result > 0) {
			return true;
		} else {
			return false;
		}

	}

	// 搜尋一篇文章
	public Post findPost(int id) {

		String sql = "SELECT * FROM post WHERE postId = :postId";
		Map<String, Object> map = new HashMap<>();
		map.put("postId", id);

		List<Post> postList = namedParameterJdbcTemplate.query(sql, map, new PostRowMapper());
		if (postList.size() > 0) {
			return postList.get(0);
		} else {
			return null;
		}

	}

	// 搜尋全部文章
	public List<Post> findallPost() {

		String sql = "SELECT * FROM post order by postId desc";
		List<Post> postList = namedParameterJdbcTemplate.query(sql, new PostRowMapper());
		return postList;
	}

	// 搜尋待審核文章
	public List<Post> findPostByStatus() {

		String sql = "SELECT *  FROM post where postStatus = '待審核' order by postId desc";
		List<Post> postList = namedParameterJdbcTemplate.query(sql, new PostRowMapper());
		return postList;

	}

}
