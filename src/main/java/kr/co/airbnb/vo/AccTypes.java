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
@Alias("accMainTypes")
public class AccTypes {
	private int no;
	private String name;
	private String maintype;
	private String imageName;
}
