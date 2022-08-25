package kr.co.airbnb.service;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.mapper.AccommodationMapper;
import kr.co.airbnb.mapper.ReviewMapper;
import kr.co.airbnb.mapper.UserMapper;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.GuestRequest;
import kr.co.airbnb.vo.HostRequest;
import kr.co.airbnb.vo.Review;
import kr.co.airbnb.vo.User;

@Service
@Transactional
public class ReviewService {
	
	@Autowired
	private ReviewMapper reviewMapper;
	
	@Autowired
	private AccommodationMapper accommodationMapper;
	
	@Autowired
	private UserMapper userMapper;

	public String getCheckoutDate(int reservationNo, int no) {
		Integer result = reviewMapper.getOverdueReviewByNo(reservationNo, no);
		
		if (result == null) {
			return "Y";
		} else {
			return "N";
		}
	}
	
	public String getDuplicateReview(int reservationNo, int no) {
		Integer result = reviewMapper.getDuplicateReviewByNo(reservationNo, no);
		// Integer는 null도 담을 수 있어서 사용했다.
		if (result != null) {
			return "Y";
		} else {
			return "N";
		}
	};

	public GuestRequest getGuestInfo(int reservationNo) {
		return reviewMapper.getGuestInfoByReservationNo(reservationNo);
	}
	
	public HostRequest getHostInfo(int reservationNo) {
		return reviewMapper.getHostInfoByReservationNo(reservationNo);
	}

	public void saveGuestReview(Review review, int no, int accNo) {
		// 게스트 리뷰 등록 : 리뷰를 등록하면 리뷰 등록, 리뷰 갯수 1 추가, 별점 평균 변경이 동시에 이루어져야 한다.
		review.setUser(userMapper.getUserByNo(no));
		review.setAccNo(accNo);
		reviewMapper.insertReviewGuest(review);
		
		DecimalFormat form = new DecimalFormat("#.#");		// string으로 출력됨
		
		// 숙소 별점 평균 변경 (총점, 청결, 정확, 소통, 위치, 체크인, 가치, 편의시설)
		Accommodation accommodation = accommodationMapper.getAcc(review.getAccNo());
		
		double totalScore = accommodation.getTotalScore() * accommodation.getReviewCount() + review.getTotalScore();
		double avgTotal = Double.parseDouble(form.format(totalScore/(accommodation.getReviewCount() + 1)));
		accommodation.setTotalScore(avgTotal);
		
		double cleanScore = accommodation.getCleanScore() * accommodation.getReviewCount() + review.getCleanScore();
		System.out.println("cleanScore: "+ cleanScore);
		double avgClean = Double.parseDouble(form.format(cleanScore/(accommodation.getReviewCount() + 1)));
		System.out.println("avgClean:" + avgClean);
		accommodation.setCleanScore(avgClean);
		
		double accuracyScore = accommodation.getAccuracyScore() * accommodation.getReviewCount() + review.getAccuracyScore();
		double avgAccuracy = Double.parseDouble(form.format(accuracyScore/(accommodation.getReviewCount() + 1)));
		accommodation.setAccuracyScore(avgAccuracy);
		
		double communicationScore = accommodation.getCommunicationScore() * accommodation.getReviewCount() + review.getCommunicationScore();
		double avgCommunication = Double.parseDouble(form.format(communicationScore/(accommodation.getReviewCount() + 1)));
		accommodation.setCommunicationScore(avgCommunication);
		
		double locationScore = accommodation.getLocationScore() * accommodation.getReviewCount() + review.getLocationScore();
		double avgLocation = Double.parseDouble(form.format(locationScore/(accommodation.getReviewCount() + 1)));
		accommodation.setLocationScore(avgLocation);
		
		double checkinScore = accommodation.getCheckinScore() * accommodation.getReviewCount() + review.getCheckinScore();
		double avgCheckin = Double.parseDouble(form.format(checkinScore/(accommodation.getReviewCount() + 1)));
		accommodation.setCheckinScore(avgCheckin);
		
		double valueScore = accommodation.getValueScore() * accommodation.getReviewCount() + review.getValueScore();
		double avgValue = Double.parseDouble(form.format(valueScore/(accommodation.getReviewCount() + 1)));
		accommodation.setValueScore(avgValue);

		double convenienceScore = accommodation.getConvenienceScore() * accommodation.getReviewCount() + review.getConvenienceScore(); 
		double avgConvenience = Double.parseDouble(form.format(convenienceScore/(accommodation.getReviewCount() + 1)));	
		accommodation.setConvenienceScore(avgConvenience);

		double allScore = ((review.getTotalScore() + review.getCleanScore() + review.getAccuracyScore() + review.getCommunicationScore()
						+ review.getLocationScore() + review.getCheckinScore() + review.getValueScore() + review.getConvenienceScore())/8.0); 
		double totalReviewScore = accommodation.getReviewScore() * accommodation.getReviewCount() + allScore;	
		double avgAllScore = Double.parseDouble(form.format(totalReviewScore/(accommodation.getReviewCount() + 1)));
		accommodation.setReviewScore(avgAllScore);
		
		accommodationMapper.updateAvgScore(accommodation);
		
	}
	
	public void saveHostReview(Review review, int no, int accNo) {
		// 호스트 리뷰 등록 : 리뷰를 등록하면 리뷰 등록, 유저(게스트)별점 평균 변경이 동시에 이루어져야 한다.
		// review.setUser(loginUser);
		review.setUser(userMapper.getUserByNo(no));
		review.setAccNo(accNo);
		reviewMapper.insertReviewHost(review);
		
		DecimalFormat form = new DecimalFormat("#.#");
		
		// 게스트 별점 평균 변경 (총점, 청결, 소통, 규칙 준수)
		User user = userMapper.getUserByNo(review.getUser().getNo());
		double totalScore = user.getTotalScore() * user.getReviewCount() + review.getTotalScore();
		double avgTotal = Double.parseDouble(form.format(totalScore/(user.getReviewCount() + 1)));
		user.setTotalScore(avgTotal);
		
		double cleanScore = user.getCleanScore() * user.getReviewCount() + review.getCleanScore();
		double avgClaen = Double.parseDouble(form.format(cleanScore/(user.getReviewCount() + 1)));
		user.setCleanScore(avgClaen);
		
		double communicationScore = user.getCommunicationScore() * user.getReviewCount() + review.getCommunicationScore();
		double avgCommunication = Double.parseDouble(form.format(communicationScore/(user.getReviewCount() + 1)));
		user.setCommunicationScore(avgCommunication);
		
		double observanceScore = user.getObservanceScore() * user.getReviewCount() + review.getObservanceScore();
		double avgObservance = Double.parseDouble(form.format(observanceScore/(user.getReviewCount() + 1)));
		user.setObservanceScore(avgObservance);
		
		double allScore = ((review.getTotalScore() + review.getCleanScore() + review.getCommunicationScore() + review.getObservanceScore())/4.0);
		double totalReviewScore = user.getReviewScore() * user.getReviewCount() + allScore;
		double avgAllScore = Double.parseDouble(form.format(totalReviewScore/(user.getReviewCount() + 1)));
		System.out.println(allScore);
		System.out.println(totalReviewScore);
		System.out.println(avgAllScore);
		
		user.setReviewScore(avgAllScore);
		
		userMapper.updateAvgScore(user);
	}

	// 숙소 번호에 해당하는 게스트가 단 리뷰들을 가져온다. 검색, 스크롤 기능 가능. (숙소 상세 리뷰에 사용)
	public List<Review> getReviews(int accNo, int beginIndex, int endIndex, String keyword) {
		return reviewMapper.getReviews(accNo, beginIndex, endIndex, keyword);
	}
	
	// 유저가 게스트일 경우 실행되는 프로필 - 하단 후기 기능이다.
	public List<Review> getGuestReceivedReviews(int no) {
		return reviewMapper.getGuestReceivedReviews(no);
	}
	
	// 유저가 호스트일 경우 실행되는 프로필 - 게스트가 적은 리뷰이다.
	public List<Review> getGuestWritedReviews(int no) {
		return reviewMapper.getGuestWritedReviews(no);
	}
	
	// 유저가 호스트일 경우 실행되는 프로필 - 호스트가 적은 리뷰이다.
	public List<Review> getHostWriteReviews(int no) {
		return reviewMapper.getHostWriteReviews(no);
	}

	public List<Review> getSentHostReviews(int no) {
		return reviewMapper.getSentHostReviews(no);
	}

	public List<Review> getSentGuestReviews(int no) {
		return reviewMapper.getSentGuestReviews(no);
	}

	public List<Review> getReviewsToWrite(int no) {
		return reviewMapper.getReviewsToWrite(no);
	}

	public Review getReviewByReviewNo(int no) {
		return reviewMapper.getReviewByReviewNo(no);
	}

	public void updateReview(Review review) {
		reviewMapper.updateReview(review);
	}

	public void deleteReview(Review review) {
		reviewMapper.deleteReview(review);
		accommodationMapper.deleteReview(review);
	}

}
