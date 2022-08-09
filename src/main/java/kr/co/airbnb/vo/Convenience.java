package kr.co.airbnb.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
@Alias("Convenience")

public class Convenience {

	private int no;
	private String name;
	private String iconName;
	private int type;

	
	public Convenience(int no) {
		this.no = no;
	}

}
