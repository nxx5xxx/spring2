package kr.gobong.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.gobong.domain.BoardDTO;
import kr.gobong.service.BoardService;


@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	/* 전재영0718 */
	// 글 목록 보기
	@GetMapping("/boardlist")
	public String boardList(Model model) {
		
		List<BoardDTO> boardList = boardService.getBoardList();
		model.addAttribute("boardList", boardList);
		
		return "board/board_list";
	}
	/*//전재영0718 */
	
	/* 이재호0718 */
	@GetMapping("/boardInsert")
	public String boardInsert(@ModelAttribute BoardDTO boardInsert, Model model) {
		
		model.addAttribute("boardInsert",boardInsert);
		return "board/boardInsert";
	}
	
	@PostMapping("/boardInsertPro")
	public String boardInsertPro(@ModelAttribute("boardInsert") BoardDTO boardInsert) {
		
		boardService.boardInsert(boardInsert);
		return "index";
	}

	/*//이재호0718 */
	
}
