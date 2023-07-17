package kr.gobong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gobong.domain.UserDTO;
import kr.gobong.repository.TestDAO;

@Service
public class TestService {
	@Autowired
	private TestDAO testDAO;
	
	public String getUserTest(String id) {
		return testDAO.getUserTest(id);
	}
}
