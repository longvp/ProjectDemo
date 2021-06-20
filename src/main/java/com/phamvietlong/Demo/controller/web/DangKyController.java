package com.phamvietlong.Demo.controller.web;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.phamvietlong.Demo.entity.ChucVu;
import com.phamvietlong.Demo.entity.DanhMuc;
import com.phamvietlong.Demo.entity.GioHang;
import com.phamvietlong.Demo.entity.User;
import com.phamvietlong.Demo.service.DanhMucService;
import com.phamvietlong.Demo.service.UserService;

@Controller
public class DangKyController {
	
	@Autowired
	DanhMucService danhMucService;
	
	@Autowired
	UserService userService;
	
	public static final Pattern VALID_EMAIL_ADDRESS_REGEX = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$",
			Pattern.CASE_INSENSITIVE);
	
	public static final Pattern VALID_PHONE_NUMBER_REGEX = Pattern.compile("^\\d{10}$", Pattern.CASE_INSENSITIVE);

	public static boolean validateEmail(String emailStr) {
		Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(emailStr);
		return matcher.find();
	}
	
	public static boolean validatePhoneNumber(String phoneNumber) {
		Matcher matcher = VALID_PHONE_NUMBER_REGEX.matcher(phoneNumber);
		return matcher.find();
	}
	
	@RequestMapping(path = "/dangky", method = RequestMethod.GET)
	public String Default(Model model, HttpSession httpSession) {
		
		List<DanhMuc> listDanhMuc = danhMucService.findAll();
		model.addAttribute("listdanhmuc", listDanhMuc);
		
		if( httpSession.getAttribute("giohang") != null) {
			List<GioHang> gioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
			model.addAttribute("soluongsanphamgiohang", gioHangs.size());		
		}
		
		return "web/Dangky";
	}
	
	@RequestMapping(path = "/dangky",  method = RequestMethod.POST)
	public String DangKy(@RequestParam String hoTen, @RequestParam String email, @RequestParam String tenDangNhap,
			@RequestParam String soDienThoai, @RequestParam String matKhau,
			@RequestParam String diaChi, Model model) {
		ChucVu chucVu = new ChucVu();
		chucVu.setId(2);
		User user = new User();
		user.setHoTen(hoTen);
		user.setEmail(email);
		user.setTenDangNhap(tenDangNhap);
		user.setSoDienThoai(soDienThoai);
		user.setMatKhau(matKhau);
		user.setDiaChi(diaChi);
		user.setChucVu(chucVu);
		boolean checkEmailTonTai = checkEmailTonTai(user);
		boolean checkMail = validateEmail(user.getEmail());
		boolean checkPhone = validatePhoneNumber(user.getSoDienThoai());
		boolean checkTenDangNhapTonTai = checkTenDangNhapTonTai(user);
		if(checkEmailTonTai == true && checkMail == true && checkPhone == true && checkTenDangNhapTonTai == true) {			
			userService.save(user);
			return "redirect:/dangnhap";
		}else {
			String message = "";
			if(checkEmailTonTai == false) {
				message = "Email đã tồn tại. Vui lòng đăng ký email khác !";
			}
			if(checkMail == false) {
				message = "Vui lòng nhập đúng định dạng email !";
			}
			if(checkPhone == false) {
				message = "Vui lòng nhập đúng số điện thoại, gồm 10 chữ số !";
			}
			if(checkTenDangNhapTonTai == false) {
				message = "Tên đăng nhập đã tồn tại. Vui lòng đăng ký tên đăng nhập khác !";
			}
			model.addAttribute("message", message);
			return "web/Dangky";
		}
			
	}
	
	public boolean checkEmailTonTai(User user) {
		boolean check = true;
		List<User> list = userService.findByIdChucVu(2);
		for(int i = 0; i < list.size(); i++) {
			if(user.getEmail().equals(list.get(i).getEmail())) {
				check =  false;
				break;
			}
		}		
		return check;
	}
	
	public boolean checkTenDangNhapTonTai(User user) {
		boolean check = true;
		List<User> list = userService.findByIdChucVu(2);
		for(int i = 0; i < list.size(); i++) {
			if(user.getTenDangNhap().equals(list.get(i).getTenDangNhap())) {
				check =  false;
				break;
			}
		}		
		return check;
	}
	

}
