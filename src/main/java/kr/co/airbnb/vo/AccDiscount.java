package kr.co.airbnb.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Alias("discount")
public class AccDiscount {

	private int discount;
	private String name;
	private double rate;
	private Date startedDate;
	private Date endedDate;

}
