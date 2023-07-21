package kr.gobong.service;

import java.util.List;

import kr.gobong.domain.UserDTO;
import kr.gobong.domain.UserVO;


public interface UserService {

	public UserDTO getUserTest(String id);

	public boolean checkUserIdExist(String id);

	public void addUserInfo(UserDTO joinUserDto);
	
	public void getUserLogin(UserDTO tmpUserLogin);	//로그인
	/* 0719 손승기 */
	public void getUserInfo(UserDTO userInfo);	//마이페이지 나의 정보 불러오기
	
	public void userModifyPro(UserDTO userModify);	//정보수정 기능
	
	public List<UserVO> getUserProfile(String id);	//나의 프로필 불러오기
	/* 0719 손승기 */
	public void userDel(String id); //회원탈퇴
}
