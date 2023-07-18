package kr.gobong.service;

import java.util.List;

import kr.gobong.domain.BoardDTO;

public interface BoardService {
	
	//전재영0718
	// 글 목록 보기 
	public List<BoardDTO> getBoardList();
	//이재호0718
	public void boardInsert(BoardDTO boardDTO);
	
}
