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
@Alias("accType")
public class AccType {
	
	private int no;
	private String name;
	private int maintype;
	private String imageName;
	private String description;
	
}
