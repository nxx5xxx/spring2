package kr.gobong.service;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.gobong.domain.UserDTO;
import kr.gobong.domain.UserVO;
import kr.gobong.repository.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDao;
	
	@Resource(name = "loginUser")
	@Lazy
	private UserDTO loginUser;
	
	@Autowired
	HttpServletRequest request;
	
	@Override
	public void getUserLogin(UserDTO tmpUserLogin) {
		
		UserDTO tmpUserLogin2 = userDao.getUserLogin(tmpUserLogin);
		
		if(tmpUserLogin2 != null) {
			loginUser.setId(tmpUserLogin2.getId());
			loginUser.setName(tmpUserLogin2.getName());
			loginUser.setUserLogin(true);
		}
		return;
	}
	
	@Override
	public UserDTO getUserTest(String id) {
		return userDao.getUserTest(id);
	}
	
	@Override
	public boolean checkUserIdExist(String id) {
		String name = userDao.checkUserIdExist(id);
		if (name == null) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public void addUserInfo(UserDTO joinUserDto) {
		userDao.addUserInfo(joinUserDto);
	}
	/* 0719 손승기 */
	@Override
	public void getUserInfo(UserDTO userInfo) {
		
		UserDTO tmpUserInfo = userDao.getUserInfo(loginUser.getId());

		userInfo.setId(tmpUserInfo.getId());
		userInfo.setName(tmpUserInfo.getName());
		userInfo.setPw(tmpUserInfo.getPw());
		userInfo.setEmail(tmpUserInfo.getEmail());
		userInfo.setTel(tmpUserInfo.getTel());
		userInfo.setRegdate(tmpUserInfo.getRegdate());
		userInfo.setImg(tmpUserInfo.getImg());
		System.out.println("userInfo : " + userInfo);
		System.out.println("tmpUserInfo : " + tmpUserInfo);
		
		return;	
	}
	
	private String saveUploadFile(MultipartFile uploadFile) {
		
		String fileName = System.currentTimeMillis() + "_" + uploadFile.getOriginalFilename();
		
		String rootPath = request.getSession().getServletContext().getRealPath("/") ;
		try {
			uploadFile.transferTo(new File(rootPath +"resources\\upload\\" + fileName));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fileName;
	}
	
	@Override
	public void userModifyPro(UserDTO userModify) {
		System.out.println(userModify.getImg());
		System.out.println(userModify.getUpload_img());
		MultipartFile upload_img = userModify.getUpload_img();
		System.out.println("유저임플");
		System.out.println("userModify.id : " + userModify.getId());
		System.out.println("userModify.name : " + userModify.getName());
		System.out.println("userModify.pw : " + userModify.getPw());
		System.out.println("userModify.email : " + userModify.getEmail());
		System.out.println("userModify.tel : " + userModify.getTel());
		System.out.println("userModify.img : " + userModify.getImg());
		
		if(upload_img.getSize() > 0) {
			String fileName = saveUploadFile(upload_img);
			System.out.println("fileName : " + fileName);
			userModify.setImg(fileName);
			System.out.println("loginUser.img : " + loginUser.getImg());
			System.out.println("userModify.img : " + userModify.getImg());
		}

		System.out.println("userModify.img : " + userModify.getImg());
		userDao.userModifyPro(userModify);
	}
	
	@Override
	public List<UserVO> getUserProfile(String id) {
		return userDao.getUserProfile(id);
	}
	/* 0719 손승기 */
	//탈퇴
	@Override
	public void userDel(String id) {
		userDao.userDel(id);
	}
}
