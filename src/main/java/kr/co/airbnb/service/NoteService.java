package kr.co.airbnb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.mapper.NoteMapper;
import kr.co.airbnb.vo.Note;
import kr.co.airbnb.vo.User;

@Service
public class NoteService {
	
	@Autowired
	NoteMapper noteMapper;
	
	@Autowired
	AccommodationService accommodationService;
	
	@Autowired
	UserService userService;
	
	public void addNote(User loginUser,String content,int accNo) {
		Note note = new Note();
		note.setAcc(accommodationService.getAccommodation(accNo));
		note.setContent(content);
		note.setSendUser(loginUser);
		note.setRecvUser(userService.getUserByNo(accommodationService.getAccommodation(accNo).getUser().getNo()));
		
		noteMapper.insertNote(note);
	}
	public void reAddNote(User loginUser,String content,int accNo,int recvNo) {
		Note note = new Note();
		note.setAcc(accommodationService.getAccommodation(accNo));
		note.setContent(content);
		note.setSendUser(loginUser);
		note.setRecvUser(userService.getUserByNo(recvNo));
		
		noteMapper.insertNote(note);
	}

	
	public List<Note> getRecvNotes(int userNo){
				
		List<Note> notes = noteMapper.getRecvNoteByUserNo(userNo);
		for (Note note: notes) {
			
			noteMapper.updateNote(note);
		}
		return notes;
	}
	
	public List<Note> getSendNotes(int userNo){
		
		return noteMapper.getSendNoteByUserNo(userNo);
	}
}
