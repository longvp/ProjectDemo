package com.phamvietlong.Demo.controller.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.phamvietlong.Demo.entity.DanhMuc;
import com.phamvietlong.Demo.entity.GioHang;
import com.phamvietlong.Demo.entity.User;
import com.phamvietlong.Demo.service.DanhMucService;
import com.phamvietlong.Demo.service.UserService;

@Controller
public class DangNhapController {
	
	@Autowired
	DanhMucService danhMucService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping(path = "/dangnhap", method = RequestMethod.GET)
	public String Default(Model model, HttpSession httpSession) {	
		List<DanhMuc> listDanhMuc = danhMucService.findAll();
		model.addAttribute("listdanhmuc", listDanhMuc);				
		if( httpSession.getAttribute("giohang") != null) {
			List<GioHang> gioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
			model.addAttribute("soluongsanphamgiohang", gioHangs.size());		
		}			
		return "web/Dangnhap";
	}
		
	@RequestMapping(path = "/dangnhap",  method = RequestMethod.POST)
	public String dangNhap(@RequestParam String email, @RequestParam String matKhau, 
			HttpSession httpSession, Model model) {
		User user = userService.findByEmailAndMatKhau(email, matKhau);
		if(user != null) {
			System.out.println("Thanh cong");
			httpSession.setAttribute("LoginInfo", user);
			return "redirect:/home";
		}else {
			String message = "";
			List<User> list = userService.findByIdChucVu(2);
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
		return  "web/Dangnhap";
	}
	
	@RequestMapping(path = "/dangxuat", method = RequestMethod.GET)
	public String dangXuat(HttpSession httpSession) {
		httpSession.removeAttribute("LoginInfo");
		return "redirect:/home";
	}

}
