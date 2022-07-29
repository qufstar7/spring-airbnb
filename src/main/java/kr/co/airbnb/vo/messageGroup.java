package kr.co.airbnb.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Alias("messageGroup")
public class messageGroup {

	private int no;
	private int userNo;
	private String messageConfirm;		// 메세지 확인 여부
	private String messageHidden;		// 메세지 숨김 여부
	private int reservationNo;
}
