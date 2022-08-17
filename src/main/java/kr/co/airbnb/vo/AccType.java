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
@Alias("AccType")
public class AccType {
	private int accNo;
	private Type type;

	public AccType(int accNo, int typeNo) {
		this.accNo = accNo;
		this.type = new Type(typeNo);
	}
}
