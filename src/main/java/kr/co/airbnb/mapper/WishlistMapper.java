package kr.co.airbnb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.Wishlist;

@Mapper
public interface WishlistMapper {

	List<Wishlist> getWishlistsByUserNo(int userNo);
	void insertWishlist(Wishlist wishlist);
	List<Accommodation> getWishlistAccsByNo(int wishlistNo);
}
