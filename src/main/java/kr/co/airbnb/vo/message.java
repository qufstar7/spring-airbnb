package kr.co.airbnb.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Alias("message")
public class message {
	
	private int no;
	private int groupNo;
	private String content;
	private String file;
	private Date createdDate;
	private int userNo;				// 받는 사람
	private int sender;				// 보내는 사람
	
}
