package kr.co.airbnb.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.criteria.SearchCriteria;
import kr.co.airbnb.service.AccommodationService;
import kr.co.airbnb.service.ConvenienceService;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.Type;
import kr.co.airbnb.vo.User;

@Controller
public class AccommodationController {

	@Autowired
	AccommodationService accommodationService;
	
	@Autowired
	ConvenienceService ConvenienceService;
	
	@GetMapping(path = "/detail")
	public String detail(@LoginUser User loginUser ,@RequestParam("no") int no,Model model) {
		Accommodation acc = accommodationService.getAccommodation(no);
		List<String> disabled = acc.getDisabledDate();
		System.out.println(disabled);
		
		model.addAttribute("acc", accommodationService.getAccommodation(no));
		model.addAttribute("cons", ConvenienceService.getMainConveniences());
		model.addAttribute("Boast", accommodationService.getBoast(no));
		
		return "acc/detail";
	}
	
	@GetMapping(path = "/test")
	public String test() {
		
		return "acc/test";
	}

	@GetMapping(path = "/list")
	public String list(HttpServletRequest req, SearchCriteria searchCriteria, Model model) {
		String keyword = req.getParameter("keyword");
		/*
		 * String startDate = req.getParameter("startDate");
		 * String endDate = req.getParameter("endDate");
		 */
		String adult = req.getParameter("adult");
		String child = req.getParameter("child");
		String infant = req.getParameter("infant");
		String pet = req.getParameter("pet");
		
		List<Accommodation> accList = accommodationService.searchAccByKeyword(searchCriteria);
		// 각 숙소의 타입1,2,3 조회
		for (Accommodation acc : accList) {
			int accNo = acc.getAccNo();
			List<Type> types = accommodationService.searchTypesByAccNo(accNo);
			acc.setTypes(types);
			if (!types.isEmpty()) {
				model.addAttribute("mainType", acc.getTypes().get(0));
			}
		}
		
		model.addAttribute("keyword", keyword);
		/*
		 * model.addAttribute("startDate", startDate); 
		 * model.addAttribute("endDate", endDate);
		 */
		model.addAttribute("adult", adult);
		model.addAttribute("child", child);
		model.addAttribute("infant", infant);
		model.addAttribute("pet", pet);
		
		model.addAttribute("list", accList);
		
		return "acc/list";
		
	}
	
	/* tag검색할 때 참고
	 * @GetMapping(path = "/list")
	 * 
	 * @ResponseBody public List<Accommodation> list(SearchCriteria searchCriteria)
	 * { // nav검색으로 숙소 조회 return
	 * accommodationService.searchAccByKeyword(searchCriteria);
	 * 
	 * }
	 */
	
}
