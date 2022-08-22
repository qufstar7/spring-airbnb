package kr.co.airbnb.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.beans.BeanUtils;

import com.fasterxml.jackson.annotation.JsonFormat;

import kr.co.airbnb.form.GuestReviewForm;
import kr.co.airbnb.form.HostReviewForm;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Alias("Review")
public class Review {
	
	private int no;
	private int accNo;
	private Accommodation accommodation;
	private User user;
	private String userType;
	private String content;
	@JsonFormat(pattern = "yyyy년 M월 d일")
	private Date createdDate;
	@JsonFormat(pattern = "yyyy년 M월 d일")
	private Date updatedDate;
	private int totalScore;					// 전체적인 만족도
	private int cleanScore;					// 청결도
	private int accuracyScore;				// 정확성
	private int communicationScore;			// 커뮤니케이션
	private int locationScore;					// 위치
	private int checkinScore;					// 체크인
	private int valueScore;						// 가치 대비 만족도
	private int convenienceScore;				// 편의시설
	private int observanceScore;					// 규칙 준수
	private String privateNote;
	private String reviewReply;
	private String positiveFeedback;
	private String nagativeFeedback;
	private String wantMeetAgain;
	private String deleted;
	private int reservationNo;
	/*
	private String firstPart;	// 0 ~ 30
	private String lastPart;	// 30 ~
	
	public String getFirstPart() {
		if (content == null) {
			return null;
		}
		if (content.length() <= 30) {
			return content;
		}
		return content.substring(0, 30);
	}
	public String getLastPart() {
		if (content == null) {
			return null;
		}
		if (content.length() <= 30) {
			return null;
		}
		return content.substring(30);
	}
	*/
	public static Review createGuestReview(GuestReviewForm guestReviewForm) {
		Review review = new Review();
		BeanUtils.copyProperties(guestReviewForm, review);
		return review;
	}
	
	public static Review createHostReview(HostReviewForm hostReviewForm) {
		Review review = new Review();
		BeanUtils.copyProperties(hostReviewForm, review);
		return review;
	}

}
