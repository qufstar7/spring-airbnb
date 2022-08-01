package kr.co.airbnb.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Alias("review")
public class Review {
	
	private int no;
	private int accNo;
	private int userNo;
	private String content;
	private Date createdDate;
	private int totalScore;					// 전체적인 만족도
	private int cleanScore;					// 청결도
	private int accuracyScore;				// 정확성
	private int communicationScore;			// 커뮤니케이션
	private int locationScore;					// 위치
	private int checkinScore;					// 체크인
	private int convenienceScore;				// 편의시설
	private int valueScore;						// 가치 대비 만족도
	private int observanceScore;					// 규칙 준수
	private String privateNote;
	private String reviewReply;
	private String positiveFeedback;
	private String nagativeFeedback;
	private String wantMeetAgain;

}
