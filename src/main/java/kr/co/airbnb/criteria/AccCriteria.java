package kr.co.airbnb.criteria;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Alias("AccCriteria")
public class AccCriteria {

	private List<String> accTypes;
}
