package kr.gobong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gobong.domain.UserDTO;
import kr.gobong.repository.UserDAO;

@Service
public class UserService {
	@Autowired
	private UserDAO userDAO;

	public UserDTO getUserTest(String id) {
		return userDAO.getUserTest(id);
	}

	public boolean checkUserIdExist(String id) {
		String name = userDAO.checkUserIdExist(id);
		if (name == null) {
			return true;
		} else {
			return false;
		}
	}

	public void addUserInfo(UserDTO joinUserDto) {
		userDAO.addUserInfo(joinUserDto);
	}
}
