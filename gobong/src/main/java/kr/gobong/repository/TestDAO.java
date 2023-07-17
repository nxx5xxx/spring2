package kr.gobong.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public String getUserTest(String id) {
		return sqlSessionTemplate.selectOne("user1.getUserTest", id);
	}
}
