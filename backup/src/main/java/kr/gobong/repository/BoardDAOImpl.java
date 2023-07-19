package kr.gobong.repository;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.gobong.domain.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
  //전재영0718 글 목록 보기
	List<BoardDTO> boardList = new ArrayList<BoardDTO>();
	
	@Override
	public List<BoardDTO> getBoardList(){
		return sqlSessionTemplate.selectList("board.getBoardList");
	}
	
	//이재호0718
	@Override
	public void boardInsert(BoardDTO boardDTO) {
		sqlSessionTemplate.insert("board1.boardInsert",boardDTO);

	}

}
