package kr.gobong.repository;

import java.util.List;

import kr.gobong.domain.BoardDTO;

public interface BoardDAO {

	//전재영 글 목록 보기 
	public List<BoardDTO> getBoardList();
	//이재호 글쓰기
	public void boardInsert(BoardDTO boardDTO);
}
