package kr.gobong.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.gobong.domain.BoardDTO;
import kr.gobong.domain.UserDTO;
import kr.gobong.service.BoardService;
import kr.gobong.service.LikeService;


@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private LikeService likeService;
	
	@Resource(name = "loginUser")
	@Lazy
	private UserDTO loginUser;
	
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
	
	/* 0719 조태정*/
	//글 삭제
	 @GetMapping("/boardDel") 
	 public String boardDel(@RequestParam("no") int no, Model model) {
		 /* 0719김우주 */
		 likeService.deleteLikeForBoard(no);
		 /* 0719김우주 */
		 boardService.boardDel(no);
		 model.addAttribute("no", no);
		 return "board/board_del";
	 }
	 
	 //친구 글 목록 보기
	@GetMapping("/friendboardlist")
	public String friendboardList(Model model) {
		String id = loginUser.getId();
		List<BoardDTO> boardList = boardService.getFriendBoardList(id);
		model.addAttribute("boardList", boardList);
		
		return "board/board_friendlist";
	}
	 
	/* 0719 조태정 */
	
	
	/* 전재영0719 */
	// 글 상세보기
	@GetMapping("/boarddetail")
	public String boardDetail(HttpServletRequest request, Model model) {
		
		int no = Integer.parseInt(request.getParameter("no"));
		BoardDTO boardDTO = boardService.getBoardDetail(no);
		model.addAttribute("boardDTO", boardDTO);
		
		return "board/board_detail";
	}
	
	// 글 수정하기
	@GetMapping("/boardEdit")
	public String boardEdit(@RequestParam("no") int no, 
													@ModelAttribute("boardEdit") BoardDTO boardEdit,
                    			Model model) {
		
		model.addAttribute("no", no);
		
		BoardDTO boardDTO = boardService.getBoardDetail(no);
		model.addAttribute("boardDTO", boardDTO);
		
//		boardEdit.setContent(boardDTO.getContent());
//		boardEdit.setHashtag(boardDTO.getHashtag());
//		boardEdit.setImg1(boardDTO.getImg1());
//		boardEdit.setImg2(boardDTO.getImg2());
//		boardEdit.setImg3(boardDTO.getImg3());
		
		return "board/board_edit";
	}
	
	@PostMapping("/boardEditPro")
	public String boardEditPro(@RequestParam("no") int no, 
							               @ModelAttribute("boardEdit") BoardDTO boardEdit,
							               BindingResult result,
							               Model model) {
		
		model.addAttribute("no", no);
		
		if(result.hasErrors()) {
			return "board/boardedit";
		}
		System.out.println("Name : "+boardEdit.getName());
		System.out.println("img1 : "+boardEdit.getImg1());
		System.out.println("img2 : "+boardEdit.getImg2());
		System.out.println("img3 : "+boardEdit.getImg3());
		boardService.boardEdit(boardEdit);
		
		//no추가
		return "board/board_detail?no="+no;
	}
	/* //0719전재영*/
	
}
