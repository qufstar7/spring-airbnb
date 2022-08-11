package kr.co.airbnb.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
@Alias("AccType")
public class AccType {
	private int accNo;
	private String accName;
	private List<Type> types;
	
	public AccType(int accNo, String accName, List<Type> types) {
		super();
		this.accNo = accNo;
		this.accName = accName;
		this.types = types;
	}
}
