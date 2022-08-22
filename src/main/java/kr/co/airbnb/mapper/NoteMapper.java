package kr.co.airbnb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.airbnb.vo.Note;

@Mapper
public interface NoteMapper {

	void insertNote(Note note);
	void updateNote(Note note);
	
	List<Note> getRecvNoteByUserNo(int userNo);
	List<Note> getSendNoteByUserNo(int userNo);
	
}
