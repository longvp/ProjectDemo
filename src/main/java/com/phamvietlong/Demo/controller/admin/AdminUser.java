package com.phamvietlong.Demo.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.phamvietlong.Demo.entity.ChucVu;
import com.phamvietlong.Demo.entity.User;
import com.phamvietlong.Demo.service.ChucVuService;
import com.phamvietlong.Demo.service.UserService;

@Controller
public class AdminUser {
	
	@Autowired
	UserService userService;
	
	@Autowired
	ChucVuService chucVuService;
	
	@RequestMapping(path = "/adminuser", method = RequestMethod.GET)
	public String Default(Model model) {
		try {
			List<ChucVu> listChucVu = chucVuService.findAll();
			model.addAttribute("listchucvu", listChucVu);
			return "admin/admin-user";
		} catch (Exception e) {
			return null;
		}
	}
	
	@RequestMapping(path = "/adminuser/{idchucvu}", method = RequestMethod.GET)
	public String adminUser(@PathVariable int idchucvu, Model model) {		
		try {			
			List<ChucVu> listChucVu = chucVuService.findAll();
			model.addAttribute("listchucvu", listChucVu);
			
			String tenChucVu = chucVuService.getOne(idchucvu).getTenChucVu();
			model.addAttribute("tenChucVu", tenChucVu);
			
			List<User> listUser = userService.findByIdChucVu(idchucvu);
			model.addAttribute("listuser", listUser);
			return "admin/admin-user";
			
		} catch (Exception e) {
			return null;
		}
	}
	

}
