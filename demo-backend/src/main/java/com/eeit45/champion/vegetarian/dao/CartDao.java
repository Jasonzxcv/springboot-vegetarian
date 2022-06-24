package com.eeit45.champion.vegetarian.dao;

import com.eeit45.champion.vegetarian.dto.CartEntryRequest;
import com.eeit45.champion.vegetarian.model.Cart;
import com.eeit45.champion.vegetarian.model.CartEntry;

import java.util.List;

public interface CartDao {

    Cart getCartById(Integer userId);

    List<CartEntry>getCartEntriesById(Integer cartId);

    CartEntry getSingleCartEntry(Integer cartEntryId);

    Integer AddToCart(CartEntryRequest cartEntryRequest);

    Integer CreateNewCart(Integer userId);

    void deleteProductFromCartById(Integer cartEntryId);

    void updateQuantity(Integer cartEntryId, CartEntryRequest cartEntryRequest);
}
