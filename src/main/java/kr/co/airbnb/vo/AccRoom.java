package kr.co.airbnb.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Alias("room")
public class AccRoom {

	private int no;
	private int bedroom;
	private int bed;
	private int bathroom;
	private int toilet;
	private int livingroom;
	
}
