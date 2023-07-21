package kr.gobong.repository;

import java.util.List;

import kr.gobong.domain.UserDTO;
import kr.gobong.domain.UserVO;


public interface UserDAO {

	
	public UserDTO getUserTest(String id);
	public String checkUserIdExist(String id);
	public void addUserInfo(UserDTO joinUserDto);
	public UserDTO getUserLogin(UserDTO tmpUserLogin);	//로그인
	/* 0719 손승기 */
	public UserDTO getUserInfo(String id);	//마이페이지 정보 불러오기
	
	public void userModifyPro(UserDTO userModify); //정보수정 기능
	
	public List<UserVO> getUserProfile(String id);
	/* 0719 손승기 */
	public void userDel(String id); //회원탈퇴
}
