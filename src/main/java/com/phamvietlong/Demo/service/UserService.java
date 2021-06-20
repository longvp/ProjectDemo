package com.phamvietlong.Demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phamvietlong.Demo.entity.User;
import com.phamvietlong.Demo.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	UserRepository userRepository;
	
	public User findByIdChucVuAndEmailAndMatKhau(int idchucvu, String email, String matKhau) {
		return userRepository.findByIdChucVuAndEmailAndMatKhau(idchucvu, email, matKhau);
	}
	
	public User findByEmailAndMatKhau(String email, String matKhau) {
		return userRepository.findByEmailAndMatKhau(email, matKhau);
	}
	
	public boolean kiemTraDangNhap(String email, String matKhau) {
		User user = userRepository.findByEmailAndMatKhau(email, matKhau);
		if(user != null) {
			return true;
		}else {
			return false;
		}
	}
	
	public List<User> findAll(){
		return userRepository.findAll();
	}
	
	public List<User> findByIdChucVu(int idchucvu){
		return userRepository.findByIdChucVu(idchucvu);
	}
	
	public void save(User user) {
		userRepository.save(user);
	}

}
