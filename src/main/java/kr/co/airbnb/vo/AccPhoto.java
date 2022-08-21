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
@Alias("AccPhoto")
public class AccPhoto {

	// 사진 순서 번호
	private int num;
	private int imageNo;
	private int accNo;
	private String name;
	private String description;
	private String cover;
	
	public AccPhoto(int accNo, String name, String cover) {
		this.accNo = accNo;
		this.name = name;
		this.cover = cover;
	}
}
