package kr.co.airbnb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.mapper.AccommodationMapper;
import kr.co.airbnb.mapper.HostMapper;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.Type;
import kr.co.airbnb.vo.User;

@Service
public class HostService {

	@Autowired
	private HostMapper hostMapper;
	@Autowired
	private AccommodationMapper accMapper;
	
	public List<Accommodation> getAllAccByUser(@LoginUser User loginUser) {
		List<Accommodation> userAllAcc =  accMapper.getAllAccsByUser(loginUser);
		
		for (Accommodation acc : userAllAcc) {
			int no = acc.getAccNo();
			List<Type> types = accMapper.getAllTypesByAccNo(no);
			acc.setTypes(types);
		}		
		return userAllAcc;
	}
	
	public List<Type> getAllMainTypes() {
		return hostMapper.getAllMainTypes();
	}

	public List<Type> getAllSubTypes(int mainType) {
		return hostMapper.getAllSubTypes(mainType);
	}
	
	public List<Type> getAllPrivacyTypes() {
		return hostMapper.getAllPrivacyTypes();
	}

	public void saveType1(int mainType) {
//		return hostMapper.insertType1(mainType);	
	}



//	public void addNewAcc(User loginUser, AccRegisterForm accRegisterForm) throws IOException {
//		Accommodation acc = new Accommodation();
//		acc.setDescription(null);
//		acc.setLatitude(null);
//		acc.setLongitude(null);
//		acc.setName(null);
//		acc.setPhotos(null);
//		acc.setStatus(null);
//		acc.setUser(loginUser);
//		hostMapper.addNewAcc(acc);
//		
//		List<Type> accTypes = accRegisterForm.getAccTypes();
//	}
	
	
//	public void addNewCourse(User loginUser, CourseRegisterForm courseRegisterForm) throws IOException {
//		// 강의정보 저장하기
//		Course course = new Course();
//		course.setTitle(courseRegisterForm.getTitle());
//		course.setGrade(courseRegisterForm.getGrade());
//		course.setDescription(courseRegisterForm.getDescription());
//		course.setPrice(courseRegisterForm.getPrice());
//		course.setPeriod(courseRegisterForm.getPeriod());
//		course.setCertificateCompletion(courseRegisterForm.getCertificate());
//		course.setImagename(courseRegisterForm.getImagename());
//		course.setUser(loginUser);
//		courseMapper.insertCourse(course);
//		
//		// 강의 카테고리정보 저장하기
//		List<String> categoryIds = courseRegisterForm.getCategoryIds();
//		for (String categoryId : categoryIds) {
//			courseMapper.insertCourseCategory(new CourseCategory(course.getNo(), categoryId));
//		}
//		
//		// 강의 학습내용정보 저장하기
//		List<String> learnings = courseRegisterForm.getLearnings();
//		for (String learning : learnings) {
//			courseMapper.insertCourseLearning(new CourseLearning(course.getNo(), learning));
//		}
//		
//		// 강의 대상정보 저장하기
//		List<String> targets = courseRegisterForm.getTargets();
//		for (String target : targets) {
//			courseMapper.insertCourseRecommendation(new CourseRecommendation(course.getNo(), target));
//		}
//		
//		// 강의 태그정보 저장하기
//		List<String> tags = courseRegisterForm.getTags();
//		for (String tag : tags) {
//			courseMapper.insertCourseTag(new CourseTag(course.getNo(), tag));
//		}
//	}
	
}
