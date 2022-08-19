package kr.co.airbnb.vo;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
@Alias("WishlistImage")
public class WishlistImage {
	
	private int num;
	private int wishlitNo;
	private String imageName;

}
