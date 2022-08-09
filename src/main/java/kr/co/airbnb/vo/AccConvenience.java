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
@Alias("AccConvenience")
public class AccConvenience {

	private int accNo;
	private Convenience convenience;
	
	public AccConvenience(int accNo, int no) {
		this.accNo = accNo;
		this.convenience = new Convenience(no);
	}
}
