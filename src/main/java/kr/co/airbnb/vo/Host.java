package kr.co.airbnb.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Host {
	
	private User user;
	private String description;
	private String idCertification;
	private String emailCertification;
	private String phoneCertification;
	private int avgScore;
	private Date createdDate;
	private Date updatedDate;
}
