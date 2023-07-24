package kr.gobong.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.gobong.domain.UserDTO;
import kr.gobong.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public UserDTO getUserLogin(UserDTO tmpUserLogin) {
		UserDTO user =sqlSessionTemplate.selectOne("user1.getUserLogin", tmpUserLogin);
		return user;
	}
	
	@Override
	public UserDTO getUserTest(String id) {
		return sqlSessionTemplate.selectOne("user1.getUserTest", id);
	}

	@Override
	public void addUserInfo(UserDTO joinUserDto) {
		sqlSessionTemplate.insert("user1.addUserInfo", joinUserDto);
	}
	/* 0719 손승기 */
	@Override
	public UserDTO getUserInfo(String id) {
		return sqlSessionTemplate.selectOne("user1.getUserInfo", id);
	}

	@Override
	public void userModifyPro(UserDTO userModify) {
		sqlSessionTemplate.update("user1.userModifyPro", userModify);
	}
	
	@Override
	public List<UserVO> getUserProfile(String id) {
		return sqlSessionTemplate.selectList("user1.getUserProfile", id);
	}
	/* 0719 손승기 */

	/* 0721 조태정 */
	@Override
	public void userDel(String id) {
		sqlSessionTemplate.delete("user1.userDel", id);
	}

	@Override
	public List<UserVO> searchUser(String id) {
		return sqlSessionTemplate.selectList("user1.searchUser", id);
	}
	/* 0721 조태정 */
	
	/* 0723김우주 */
	@Override
	public int duplicationCheckId(String id) {
		return sqlSessionTemplate.selectOne("user1.duplicationCheckId", id);
	}
	/* 0723김우주 */
}
