package kr.co.airbnb.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@Alias("Tag")
public class Tag {
	// 숙소 type검색
	private List<String> accTypes;

	private String id;
	private String name;
	private String icon;

	public Tag(String id) {
		this.id = id;
	}
}
