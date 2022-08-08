package kr.co.airbnb.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Alias("convenience")
public class Convenience {

	private int no;
	private String name;
	private String iconName;
	private int type;
}
