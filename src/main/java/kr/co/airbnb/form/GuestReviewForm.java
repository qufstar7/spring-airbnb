package kr.co.airbnb.form;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GuestReviewForm {
	
	private int accNo;
	private int totalScore;					// 전체적인 만족도
	private int cleanScore;					// 청결도
	private int accuracyScore;				// 정확성
	private int communicationScore;			// 커뮤니케이션
	private int locationScore;				// 위치
	private int checkinScore;				// 체크인
	private int valueScore;					// 가치 대비 만족도
	private int convenienceScore;			// 편의시설
	private String content;
	private String positiveFeedback;
	private String nagativeFeedback;
	private String wantMeetAgain;
	private String userType;
	private int reservationNo;

}
