package kr.gobong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gobong.domain.ReplyDTO;
import kr.gobong.repository.BoardDAO;
import kr.gobong.repository.ReplyDAO;


@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyDAO replyDAO;
	
	@Autowired
	BoardDAO boardDAO;

	/* 0724김우주 */
	//댓글번호 자동화
	private int replyRNoGenerator() {
		List<Integer> replyList = replyDAO.getReplyRno();
		if(replyList.size()==0) {
			return 0;
		}else {
			return replyList.get(0);
		}
	}
	
	//이재호0721
	@Override
	public void addReply(ReplyDTO replyDTO) {
		replyDTO.setRno(replyRNoGenerator()+1);
		replyDAO.addReply(replyDTO);
	}
	/* 0724김우주 */

	@Override
	public void deleteReply(int rno) {
		replyDAO.deleteReply(rno);
	}

//이재호0721
	
	/* 0724김우주 */
	//글삭제시 댓글비워주기
	public void deleteReplyForBoard(int no) {
		replyDAO.deleteReplyForBoard(no);
	}
}
