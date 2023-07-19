package kr.gobong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gobong.domain.LikeDTO;
import kr.gobong.repository.LikeDAO;

@Service
public class LikeServiceImpl implements LikeService{
	@Autowired
	LikeDAO likeDao;
	
	@Override
	public void upLike(int no) {
		likeDao.upLike(no);
	}
	@Override
	public void registLike(LikeDTO likeDto) {
		likeDao.registLike(likeDto);
		
	}
	@Override
	public void deleteLikeForBoard(int no) {
		likeDao.deleteLikeForBoard(no);
	}
}
