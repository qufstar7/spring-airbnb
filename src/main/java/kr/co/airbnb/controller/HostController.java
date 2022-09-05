package kr.co.airbnb.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.annotation.RegisterAcc;
import kr.co.airbnb.form.AccRegisterForm;
import kr.co.airbnb.service.AccommodationService;
import kr.co.airbnb.service.HostService;
import kr.co.airbnb.service.UserService;
import kr.co.airbnb.utils.SessionUtils;
import kr.co.airbnb.vo.AccConvenience;
import kr.co.airbnb.vo.AccRoom;
import kr.co.airbnb.vo.AccType;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.Reservation;
import kr.co.airbnb.vo.Tag;
import kr.co.airbnb.vo.Type;
import kr.co.airbnb.vo.User;

@Controller
@RequestMapping("/host")
public class HostController {
	
	@Value("${airbnb.acc.image.save-directory}")
	String accImageSaveDirectory;

	@Autowired
	private HostService hostService;
	@Autowired
	private AccommodationService accService;
	@Autowired
	private UserService userService;

	// 호스팅 홈페이지
	@GetMapping
	public String home() {
		return "host/home";
	}

	// 호스트 숙소 시작 페이지 (기존등록, 신규등록)
	@GetMapping("/become-a-host")
	public String becomeAHost(@LoginUser User loginUser, Model model) {
		// 로그인유저가 없으면 홈으로
		if (loginUser == null) {
			return "host/home";
		}
		
		// '등록미완'인 숙소 검색해서 모델객체에 저장
		List<Accommodation> allAccIncomplete = hostService.getAllAccIncompleteByUser(loginUser);
		model.addAttribute("allAccIncomplete" , allAccIncomplete);

		// '등록미완'이 아닌 사용자의 숙소 전체 검색해서 모델객체에 저장
		List<Accommodation> allAccNotIncomplete = hostService.getAllAccNotIncompleteByUser(loginUser);
		model.addAttribute("allAccNotIncomplete", allAccNotIncomplete);

		// 사용자의 호스트 여부를 바꿈
		loginUser.setIsHost("Y");
		userService.updateUserInfo(loginUser);

		return "host/become-a-host";
	}

	// '새로운 숙소 등록하기'
	@GetMapping("/become-a-host/register")
	public String register(@LoginUser User loginUser, Model model) {
		// 로그인유저가 없으면 홈으로
		if (loginUser == null) {
			return "host/home";
		}

		// 숙소 생성 (번호,유저번호,생성일,상태(등록미완) 정보 저장)
		hostService.insertAcc(loginUser);

		// 가장 최근에 추가된 숙소데이터 조회
        int accNo = hostService.getMostRecentRegisteredAccNo();
		Accommodation registerAcc = accService.getAccommodation(accNo);
		// 등록중인 숙소정보 세션에 저장
		SessionUtils.addAttribute("REGISTER_ACC", registerAcc);

		return "redirect:/host/types";
	}

	// '숙소 등록 완료하기'
	@GetMapping("/become-a-host/registerContinue")
	public String registerContinue(int accNo, @LoginUser User loginUser, Model model) {
		// 로그인유저가 없으면 홈으로
		if (loginUser == null) {
			return "host/home";
		}
		
		// 숙소번호로 숙소 조회
		Accommodation registerAcc = hostService.getAccByAccNo(accNo);
		// 등록중인 숙소정보 세션에 저장
		SessionUtils.addAttribute("REGISTER_ACC", registerAcc);
		
		model.addAttribute(registerAcc);
		// 최종단계 이동
		if(registerAcc.getTypes() == null || registerAcc.getTypes().size() < 3) {
			return "redirect:/host/types";
		}
		if(registerAcc.getAddress() == null) {
			return "redirect:/host/location";
		}
		if(registerAcc.getGuest() == 0) {
			return "redirect:/host/guest";
		}
		if(registerAcc.getConveniences() == null) {
			return "redirect:/host/facilities";
		}
		if(registerAcc.getImageCover() == null) {
			return "redirect:/host/pictures";
		}
		if(registerAcc.getName() == null) {
			return "redirect:/host/name";
		}
		if(registerAcc.getTags() == null) {
			return "redirect:/host/tags";
		}
		if(registerAcc.getDescription() == null) {
			return "redirect:/host/description";
		}
		if(registerAcc.getPrice() == 0) {
			return "redirect:/host/price";
		}

		return "redirect:/host/complete";
	}
	
	// '기존 숙소 복사하기'
	@GetMapping("/become-a-host/registerCopy")
	public String registerCopy(int accNo, @LoginUser User loginUser, Model model) {
		// 로그인유저가 없으면 홈으로
		if (loginUser == null) {
			return "host/home";
		}

		// 숙소 생성 (번호,유저번호,생성일,상태(등록미완) 정보 저장)
		hostService.insertAcc(loginUser);

		// 가장 최근에 추가된 숙소데이터 조회
		int newAccNo = accService.getAccommodationNoByUser(loginUser);
		Accommodation registerAcc = accService.getAccommodation(newAccNo);
		// 등록중인 숙소정보 세션에 저장
		SessionUtils.addAttribute("REGISTER_ACC", registerAcc);
		
		model.addAttribute("acc", registerAcc);

		return "redirect:/host/types";
	}
		
	// 타입 페이지 (타입1(메인타입) 선택 페이지)
	@GetMapping("/types")
	public String type1(@LoginUser User loginUser, Model model, @RegisterAcc Accommodation registerAcc) {
		// 로그인유저가 없으면 홈으로
		if (loginUser == null) {
			return "host/home";
		}

		// 타입1(메인타입) 검색
		List<Type> accMainTypes = hostService.getAllMainTypes();
		model.addAttribute("accMainTypes", accMainTypes);
		
//		// 등록중이던 정보 전달
//		model.addAttribute(registerAcc);

		return "host/types";
	}

	// ajax 타입2(서브타입) 선택 페이지
	@GetMapping("/searchType1")
	@ResponseBody
	public List<Type> type2(int mainType, Model model, @RegisterAcc Accommodation registerAcc) {
		insertType(mainType, registerAcc);
		
		// 등록중이던 정보 전달
		model.addAttribute(registerAcc);
		
		// 모든 서브 타입 조회
		return hostService.getAllSubTypes(mainType);
	}

	// ajax 타입3(프라이버시타입) 선택 페이지
	@GetMapping("/searchType2")
	@ResponseBody
	public List<Type> type3(int subType, Model model, @RegisterAcc Accommodation registerAcc) {
		insertType(subType, registerAcc);
		
		// 등록중이던 정보 전달
		model.addAttribute(registerAcc);
		
		// 모든 프라이버시타입 조회
		return hostService.getAllPrivacyTypes();
	}

	// 타입 제출(프라이버시타입 저장)
	@PostMapping("/submitTypes")
	public String submitTypes(Model model, @RegisterAcc Accommodation registerAcc, 
			@ModelAttribute("accRegisterForm") AccRegisterForm accRegisterForm,
			SessionStatus sessionStatus) {
		int privacyType = accRegisterForm.getPrivacyType();
		insertType(privacyType, registerAcc);
	
		// 세션 accRegisterForm 객체를 clear 시킨다.
		sessionStatus.setComplete();
		
		return "redirect:/host/location";
	}

	// 숙소 유형 정보 저장
	public void insertType(int typeNo, @RegisterAcc Accommodation registerAcc) {
		// 등록중인숙소 세션객체 조회
		int accNo = registerAcc.getAccNo();

		List<Type> types = hostService.getAllTypesByAccNo(accNo);
		AccType accType = new AccType(accNo, typeNo);
		// 타입 추가
		if (types.isEmpty() || types.size() == 1 || types.size() == 2) {
			hostService.insertAccType(accType);
		}
		
		// 타입 수정
		if (!types.isEmpty() ) {
			hostService.updateType(accType);
		}
	}
	
	// 주소 페이지
	@GetMapping("/location")
	public String location(Model model, @RegisterAcc Accommodation registerAcc) {

		// 등록중이던 정보 전달
		model.addAttribute(registerAcc);
		
		return "host/location";
	}

	// 주소 제출
	@PostMapping("/submitAddress")
	public String submitAddress(@RegisterAcc Accommodation registerAcc, @LoginUser User loginUser,
			@ModelAttribute("accRegisterForm") AccRegisterForm accRegisterForm,
			SessionStatus sessionStatus) throws IOException {
		
		if (registerAcc == null || loginUser == null) {
			return "host/home";
		}

		hostService.updateAddress(registerAcc, loginUser, accRegisterForm);
		
		// 세션 수정
		Accommodation acc = accService.getAccommodation(registerAcc.getAccNo());
		SessionUtils.removeAttribute("REGISTER_ACC");
		SessionUtils.addAttribute("REGISTER_ACC", acc);
		
		// 세션에 "accRegisterForm"이름으로 저장된 객체를 clear 시킨다.
		sessionStatus.setComplete();
	
		return "redirect:/host/locationDetail";
	}
	
	// 주소 디테일 페이지
	@GetMapping("/locationDetail")
	public String locationDetail(Model model, @RegisterAcc Accommodation registerAcc) {
		model.addAttribute("registerAcc", registerAcc);

		// 등록중이던 정보 전달
		model.addAttribute(registerAcc);
		
		return "/host/locationDetail";
	}

	// 인원수 페이지
	@GetMapping("/guests")
	public String guests(@RegisterAcc Accommodation registerAcc, Model model) {

		// 등록중이던 정보 전달
		model.addAttribute(registerAcc);
		
		return "/host/guests";
	}
	
	// 인원수 페이지 정보 제출
	@PostMapping("/submitGuests")
	public String submitGuests(@RegisterAcc Accommodation registerAcc, @LoginUser User loginUser,
			@ModelAttribute("accRegisterForm") AccRegisterForm accRegisterForm,
			SessionStatus sessionStatus) throws IOException {
		
		if (registerAcc == null || loginUser == null) {
			return "host/home";
		}
		
		hostService.updateGuests(registerAcc, loginUser, accRegisterForm);
		
		return "redirect:/host/facilities";
	}
	
	// 편의시설 페이지
	@GetMapping("/facilities")
	public String facilities(@RegisterAcc Accommodation registerAcc, Model model) {

		// 등록중이던 정보 전달
		model.addAttribute(registerAcc);
		
		return "/host/facilities";
	}
	
	// 편의시설 정보 제출 (convenience)
	@PostMapping("/submitFacilities")
	public String submitFacilities(@RegisterAcc Accommodation registerAcc, @LoginUser User loginUser, Model model,
			@ModelAttribute("accRegisterForm") AccRegisterForm accRegisterForm,
			SessionStatus sessionStatus) throws IOException {
		
		if (registerAcc == null || loginUser == null) {
			return "host/home";
		}
		
		hostService.insertConveniences(registerAcc, loginUser, accRegisterForm);
		
		return "redirect:/host/pictures";
	}
	
	// 사진 페이지
	@GetMapping("/pictures")
	public String pictures(@RegisterAcc Accommodation registerAcc, Model model) {

		// 등록중이던 정보 전달
		model.addAttribute(registerAcc);
		
		return "/host/pictures";
	}

	// 사진 제출
	@PostMapping("/submitPictures")
	public String submitPictures(@RegisterAcc Accommodation registerAcc, @LoginUser User loginUser, Model model,
			@ModelAttribute("accRegisterForm") AccRegisterForm accRegisterForm,
			SessionStatus sessionStatus) throws IOException {
		
		if (registerAcc == null || loginUser == null) {
			return "host/home";
		}
		
		// 이미지 처리
		if (!accRegisterForm.getPhoto1().isEmpty()) {
			MultipartFile imageFile = accRegisterForm.getPhoto1();
			String filename = imageFile.getOriginalFilename();
			accRegisterForm.setPhoto1name(filename);
			InputStream in = imageFile.getInputStream();
			FileOutputStream out = new FileOutputStream(new File(accImageSaveDirectory, filename));
			FileCopyUtils.copy(in, out);
		}
		if (!accRegisterForm.getPhoto2().isEmpty()) {
			MultipartFile imageFile = accRegisterForm.getPhoto2();
			String filename = imageFile.getOriginalFilename();
			accRegisterForm.setPhoto2name(filename);
			InputStream in = imageFile.getInputStream();
			FileOutputStream out = new FileOutputStream(new File(accImageSaveDirectory, filename));
			FileCopyUtils.copy(in, out);
		}
		if (!accRegisterForm.getPhoto3().isEmpty()) {
			MultipartFile imageFile = accRegisterForm.getPhoto3();
			String filename = imageFile.getOriginalFilename();
			accRegisterForm.setPhoto3name(filename);
			InputStream in = imageFile.getInputStream();
			FileOutputStream out = new FileOutputStream(new File(accImageSaveDirectory, filename));
			FileCopyUtils.copy(in, out);
		}
		if (!accRegisterForm.getPhoto4().isEmpty()) {
			MultipartFile imageFile = accRegisterForm.getPhoto4();
			String filename = imageFile.getOriginalFilename();
			accRegisterForm.setPhoto4name(filename);
			InputStream in = imageFile.getInputStream();
			FileOutputStream out = new FileOutputStream(new File(accImageSaveDirectory, filename));
			FileCopyUtils.copy(in, out);
		}
		if (!accRegisterForm.getPhoto5().isEmpty()) {
			MultipartFile imageFile = accRegisterForm.getPhoto5();
			String filename = imageFile.getOriginalFilename();
			accRegisterForm.setPhoto5name(filename);
			InputStream in = imageFile.getInputStream();
			FileOutputStream out = new FileOutputStream(new File(accImageSaveDirectory, filename));
			FileCopyUtils.copy(in, out);
		}
		hostService.updatePhotos(registerAcc, loginUser, accRegisterForm);
		
		return "redirect:/host/name";
	}
	
	// 이름 페이지
	@GetMapping("/name")
	public String name(@RegisterAcc Accommodation registerAcc, Model model) {

		// 등록중이던 정보 전달
		model.addAttribute(registerAcc);
		
		return "/host/name";
	}
	
	// 이름 제출
	@PostMapping("/submitName")
	public String submitName(@RegisterAcc Accommodation registerAcc, @LoginUser User loginUser, Model model,
			@ModelAttribute("accRegisterForm") AccRegisterForm accRegisterForm,
			SessionStatus sessionStatus) throws IOException {
		
		hostService.updateName(registerAcc, loginUser, accRegisterForm);
		
		return "redirect:/host/tags";
	}
	
	// 태그 페이지
	@GetMapping("/tags")
	public String tags(@RegisterAcc Accommodation registerAcc, Model model) {
		List<Tag> tags = hostService.getAllTags();
		model.addAttribute("tags", tags);

		// 등록중이던 정보 전달
		model.addAttribute(registerAcc);
		
		return "/host/tags";
	}
	
	// 태그 제출
	@PostMapping("/submitTags")
	public String submitTags(@RegisterAcc Accommodation registerAcc, @LoginUser User loginUser, Model model,
			@ModelAttribute("accRegisterForm") AccRegisterForm accRegisterForm,
			SessionStatus sessionStatus) throws IOException {
		
		if (registerAcc == null || loginUser == null) {
			return "host/home";
		}
		
		hostService.insertTags(registerAcc, loginUser, accRegisterForm);

		// 세션 수정
		Accommodation acc = accService.getAccommodation(registerAcc.getAccNo());
		SessionUtils.removeAttribute("REGISTER_ACC");
		SessionUtils.addAttribute("REGISTER_ACC", acc);
		
		// 세션에 "accRegisterForm"이름으로 저장된 객체를 clear 시킨다.
		sessionStatus.setComplete();
		
		return "redirect:/host/description";
	}
	
	// 설명 페이지
	@GetMapping("/description")
	public String description(@RegisterAcc Accommodation registerAcc, Model model) {

		// 등록중이던 정보 전달
		model.addAttribute(registerAcc);
		
		return "/host/description";
	}
	
	// 설명 제출
	@PostMapping("/submitDescription")
	public String submitDescription(@RegisterAcc Accommodation registerAcc, @LoginUser User loginUser, @ModelAttribute("accRegisterForm") AccRegisterForm accRegisterForm,
			SessionStatus sessionStatus) throws IOException {

		if (registerAcc == null || loginUser == null) {
			return "host/home";
		}
		
		hostService.updateDescription(registerAcc, loginUser, accRegisterForm);
		

		// 세션 수정
		Accommodation acc = accService.getAccommodation(registerAcc.getAccNo());
		SessionUtils.removeAttribute("REGISTER_ACC");
		SessionUtils.addAttribute("REGISTER_ACC", acc);
		
		// 세션에 "accRegisterForm"이름으로 저장된 객체를 clear 시킨다.
		sessionStatus.setComplete();
		
		return "redirect:/host/price";
	}
	
	// 요금 페이지
	@GetMapping("/price")
	public String price(@RegisterAcc Accommodation registerAcc, Model model) {

		// 등록중이던 정보 전달
		model.addAttribute(registerAcc);
		
		return "/host/price";
	}
	
	// 요금 제출
	@PostMapping("/submitPrice")
	public String submitPrice(@RegisterAcc Accommodation registerAcc, @LoginUser User loginUser, @ModelAttribute("accRegisterForm") AccRegisterForm accRegisterForm,
			SessionStatus sessionStatus) throws IOException {

		if (registerAcc == null || loginUser == null) {
			return "host/home";
		}
		
		hostService.updatePrice(registerAcc, loginUser, accRegisterForm);
		
		// 세션 수정
		Accommodation acc = accService.getAccommodation(registerAcc.getAccNo());
		SessionUtils.removeAttribute("REGISTER_ACC");
		SessionUtils.addAttribute("REGISTER_ACC", acc);
		
		// 세션에 "accRegisterForm"이름으로 저장된 객체를 clear 시킨다.
		sessionStatus.setComplete();
		
		return "redirect:/host/complete";
	}
	
	// 완료 페이지
	@GetMapping("/complete")
	public String complete(Model model, @RegisterAcc Accommodation registerAcc) {
		
		List<Type> types = hostService.getAllTypesByAccNo(registerAcc.getAccNo());
		model.addAttribute("types", types);
		
		AccRoom accRoom = hostService.getAllRoomInfoByAccNo(registerAcc.getAccNo());
		model.addAttribute("room", accRoom);
		
		List<AccConvenience> accConveniences = hostService.getAllConveniencesByAccNo(registerAcc.getAccNo());
		model.addAttribute("cons", accConveniences);
		
		model.addAttribute("acc", registerAcc);
		
		
		return "/host/complete";
	}
	
	// 완료 후 상태 변경
	@GetMapping("/completeRegister")
	public String completeRegister(@RegisterAcc Accommodation registerAcc) {
		
		registerAcc.setStatus("심사대기");
		hostService.updateAccStatus(registerAcc);
		
		return "redirect:/host/hosting";
	}
	
	// 호스팅 관리 페이지
	@GetMapping("/hosting")
	public String hosting(Model model, @LoginUser User loginUser) {
		if (loginUser == null || loginUser.getIsHost() == "N") {
			return "redirect:/";
		}
		
		List<Accommodation> accs = hostService.getAllAccByUser(loginUser);
		List<List> ListofList = new ArrayList<List>();
		for (Accommodation acc : accs) {
			List<Reservation> rList = hostService.getAllReservations(acc.getAccNo());
			ListofList.add(rList);
		}
		
		model.addAttribute("reservations", ListofList);
		model.addAttribute("accs", accs);
		model.addAttribute("user", loginUser);
		return "/host/hosting";
	}
	
	// 게스트 프로필로 이동
	@GetMapping("/guestProfile")
	public String guestProfile(Model model, int guestNo) {
		User user = userService.getUserByNo(guestNo);
		model.addAttribute("user", user);
		return "user/profile";
	}
}
