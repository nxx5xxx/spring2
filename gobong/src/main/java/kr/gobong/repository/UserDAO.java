package kr.gobong.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.gobong.domain.UserDTO;

@Repository
public class UserDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	public UserDTO getUserTest(String id) {
		return sqlSessionTemplate.selectOne("user1.getUserTest", id);
	}

	public String checkUserIdExist(String id) {
		String name = sqlSessionTemplate.selectOne("user1.checkUserIdExist", id);
		return name;
	}

	public void addUserInfo(UserDTO joinUserDto) {
		sqlSessionTemplate.insert("user1.addUserInfo", joinUserDto);
	}
}
