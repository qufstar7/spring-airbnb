package kr.co.airbnb.form;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class HostReviewForm {
	
	private int accNo;
	private int totalScore;					// 전체적인 만족도
	private int cleanScore;					// 청결도
	private int communicationScore;			// 커뮤니케이션
	private int observanceScore;			// 규칙 준수
	private String wantMeetAgain;
	private String content;
	private String privateNote;
	private String userType;
	private int reservationNo;
	
}
