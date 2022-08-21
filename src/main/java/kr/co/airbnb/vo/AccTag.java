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
@Alias("AccTag")
public class AccTag {
	private int accNo;
	private String tagId;
	private List<Tag> tags;
	
	public AccTag(int accNo, String tagId, List<Tag> tags) {
		super();
		this.accNo = accNo;
		this.tagId = tagId;
		this.tags = tags;
	}
	
	public AccTag(int accNo, String tagId) {
		this.accNo = accNo;
		this.tagId = tagId;
	}
}
