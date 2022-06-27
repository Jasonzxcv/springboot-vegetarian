package com.eeit45.champion.vegetarian.dao.impl;

import com.eeit45.champion.vegetarian.dao.ProductDao;
import com.eeit45.champion.vegetarian.dto.ProductQueryParams;
import com.eeit45.champion.vegetarian.dto.ProductRequest;
import com.eeit45.champion.vegetarian.model.Product;
import com.eeit45.champion.vegetarian.rowmapper.ProductRowMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class ProductDaoImpl implements ProductDao {


    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;


    @Override
    public Integer totalProduct(ProductQueryParams productQueryParams) {
        String sql = "SELECT count(*) FROM products WHERE 1=1";

        Map<String,Object> map = new HashMap<>();

        sql = filteringSQL(sql,map,productQueryParams);

        Integer total =  namedParameterJdbcTemplate.queryForObject(sql, map, Integer.class);
        return total;
    }

    @Override
    public List<Product> getProducts(ProductQueryParams productQueryParams) {
        String sql = "SELECT * FROM products WHERE 1=1";

        Map<String,Object> map = new HashMap<>();

        sql = filteringSQL(sql,map,productQueryParams);

        // 排序
        sql = sql + " ORDER BY " + productQueryParams.getOrderBy() + " " + productQueryParams.getSorting();

        //分頁
//        SQL SERVER分頁語法
//        sql = sql + " OFFSET :limit ROWS FETCH NEXT :offset ROWS ONLY";
        sql = sql + " LIMIT :limit OFFSET :offset";
        map.put("limit",productQueryParams.getLimit());
        map.put("offset",productQueryParams.getOffset());

        List<Product> productList = namedParameterJdbcTemplate.query(sql, map, new ProductRowMapper());

        return productList;
    }

    @Override
    public Product getProductById(Integer productId) {
        String sql = "SELECT * FROM products WHERE id = :productId";

        Map<String,Object> map = new HashMap<>();
        map.put("productId" , productId);

        List<Product> productList = namedParameterJdbcTemplate.query(sql, map, new ProductRowMapper());
        if(productList.size() > 0){
            return productList.get(0);
        }else{
            return null;
        }
    }

    @Override
    public Integer createProduct(ProductRequest productRequest) {
        String sql = "INSERT INTO products ( name, category, veganCategory, price, image, createdTime , updatedTime, description)" +
                     "VALUES (:productName, :productCategory, :veganCategory, :price, :imageUrl, :createdTime , :updatedTime, :description)";

        Map<String,Object> map = new HashMap<>();
        map.put("productName",productRequest.getProductName());
        map.put("productCategory",productRequest.getProductCategory().toString());
        map.put("veganCategory",productRequest.getVeganCategory().toString());
        map.put("price",productRequest.getPrice());
        map.put("imageUrl",productRequest.getImageUrl());
        map.put("description",productRequest.getDescription());


        //日期處理
        Date nowTime = new Date();
        Timestamp timestamp = new Timestamp(nowTime.getTime());

        map.put("createdTime",timestamp);
        map.put("updatedTime",timestamp);

        KeyHolder keyHolder = new GeneratedKeyHolder();

        namedParameterJdbcTemplate.update(sql,new MapSqlParameterSource(map), keyHolder);

        int productId = keyHolder.getKey().intValue();

        return productId;
    }

    @Override
    public void updateProduct(Integer productId, ProductRequest productRequest) {
        String sql = "UPDATE products SET name = :productName, category = :productCategory," +
                     " price = :price,image= :imageUrl,updatedTime = :updatedTime,description = :description  WHERE id = :productId";

        Map<String,Object> map = new HashMap<>();
        map.put("productId", productId);

        map.put("productName",productRequest.getProductName());
        map.put("productCategory",productRequest.getProductCategory().toString());
        map.put("price",productRequest.getPrice());
        map.put("imageUrl",productRequest.getImageUrl());
        map.put("description",productRequest.getDescription());

        //日期處理
        Date now = new Date();
        Timestamp timestamp = new Timestamp(now.getTime());

        map.put("updatedTime",timestamp);

        namedParameterJdbcTemplate.update(sql,map);
    }

    @Override
    public void deleteProductById(Integer productId) {
        String sql = "DELETE FROM products WHERE id= :productId";

        Map<String,Object> map = new HashMap<>();
        map.put("productId", productId);

        namedParameterJdbcTemplate.update(sql,map);
    }

    //FilteringSQL 判斷，拉出來統一寫一種方法
    private String filteringSQL(String sql, Map<String,Object> map, ProductQueryParams productQueryParams){

        //查詢條件
        if(productQueryParams.getCategory() != null){
            sql = sql + " AND category = :category";
            map.put("category", productQueryParams.getCategory().name());
        }

        if(productQueryParams.getVeganCategory() != null){
            sql = sql + " AND veganCategory = :veganCategory";
            map.put("veganCategory", productQueryParams.getVeganCategory().name());
        }

        if(productQueryParams.getSearch() != null){
            sql = sql + " AND name LIKE :search";
            map.put("search", "%" + productQueryParams.getSearch() + "%");
        }
        return sql;
    }

}