package com.phamvietlong.Demo.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.phamvietlong.Demo.entity.User;
import com.phamvietlong.Demo.service.UserService;

@Controller
public class AdminDangNhap {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(path="/admindangnhap", method = RequestMethod.GET)
	public String Default() {	
				
		return "admin/admin-dangnhap";
	}
	
	@RequestMapping(path="/admindangnhap", method = RequestMethod.POST)
	public String dangNhap(@RequestParam String email, @RequestParam String matKhau, 
			HttpSession httpSession, Model model) {
		User user = userService.findByIdChucVuAndEmailAndMatKhau(1, email, matKhau);
		if(user != null ) {
			System.out.println("Thanh cong");
			httpSession.setAttribute("LoginInfoAdmin", user);
			return "redirect:/admin";
		}else {
			String message = "";
			List<User> list = userService.findByIdChucVu(1);
			for(int i = 0; i < list.size(); i++) {
				String mail = list.get(i).getEmail();
				if(!(email.equals(mail))) {
					message = "Sai email đăng nhập hoặc mật khẩu. Vui lòng thử lại.";
				}else {
					String matkhau = list.get(i).getMatKhau();
					if(!(matKhau.equals(matkhau))) {
						message = "Sai email đăng nhập hoặc mật khẩu. Vui lòng thử lại.";
					}
				}
			}			
			model.addAttribute("message", message);			
		}
		return "admin/admin-dangnhap";
	}
	
	@RequestMapping(path = "/admindangxuat", method = RequestMethod.GET)
	public String dangXuat(HttpSession httpSession) {
		httpSession.removeAttribute("LoginInfoAdmin");
		return "redirect:/admin";
	}

}
