package kr.co.airbnb.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Alias("Note")
public class Note {

	private int noteNo;
	private User sendUser;
	private User recvUser;
	private String content;
	private Date openDate;
	private Date sendDate;
	private Accommodation acc;
}
