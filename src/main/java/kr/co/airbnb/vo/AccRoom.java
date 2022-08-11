package kr.co.airbnb.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Alias("room")
public class AccRoom {

	private int no;
	private int accNo;
	private int bedroom;
	private int bed;
	private int bathroom;
	private int toilet;
	private int livingroom;
	private RoomImage image;
	
	private Accommodation acc;
	private List<Accommodation> accs;
}
