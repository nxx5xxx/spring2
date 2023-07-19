package kr.gobong.service;

import kr.gobong.domain.LikeDTO;

public interface LikeService {
	public void upLike(int no);
	public void registLike(LikeDTO likeDto);
	public void deleteLikeForBoard(int no);
}
