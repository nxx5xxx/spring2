package kr.gobong.repository;

import kr.gobong.domain.LikeDTO;

public interface LikeDAO {
	public void upLike(int no);
	public void registLike(LikeDTO likeDto);
	public void deleteLikeForBoard(int no);
}
