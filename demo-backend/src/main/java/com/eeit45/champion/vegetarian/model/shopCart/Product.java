package com.eeit45.champion.vegetarian.model.shopCart;

import com.eeit45.champion.vegetarian.constant.ProductCategory;
import com.eeit45.champion.vegetarian.constant.VeganCategory;

import java.sql.Timestamp;
import java.util.Date;


public class Product {
    private Integer productId;
    private String productName;
    private ProductCategory productCategory;
    private VeganCategory veganCategory;
    private Integer productPrice;
    private String image;
    private Integer stock;
    private Date createdTime;
    private Date updatedTime;

    private String description;

    public Product() {
    }

    public Product(Integer productId, String productName, ProductCategory productCategory, VeganCategory veganCategory, Integer productPrice, String image, Integer stock, Timestamp createdTime, Timestamp updatedTime) {
        this.productId = productId;
        this.productName = productName;
        this.productCategory = productCategory;
        this.veganCategory = veganCategory;
        this.productPrice = productPrice;
        this.image = image;
        this.stock = stock;
        this.createdTime = createdTime;
        this.updatedTime = updatedTime;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public ProductCategory getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(ProductCategory productCategory) {
        this.productCategory = productCategory;
    }

    public VeganCategory getVeganCategory() {
        return veganCategory;
    }

    public void setVeganCategory(VeganCategory veganCategory) {
        this.veganCategory = veganCategory;
    }

    public Integer getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(Integer productPrice) {
        this.productPrice = productPrice;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public Date getUpdatedTime() {
        return updatedTime;
    }

    public void setUpdatedTime(Date updatedTime) {
        this.updatedTime = updatedTime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
