package com.phamvietlong.Demo.controller.admin;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.phamvietlong.Demo.entity.ChucVu;
import com.phamvietlong.Demo.entity.User;
import com.phamvietlong.Demo.service.UserService;

@Controller
public class AdminDangKy {
	

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
	
	@RequestMapping(path="/admindangky", method = RequestMethod.GET)	
	public String Default() {
		
		return "admin/admin-dangky";
	}
	
	@RequestMapping(path = "/admindangky",  method = RequestMethod.POST)
	public String DangKy(@RequestParam String hoTen, @RequestParam String email, @RequestParam String tenDangNhap,
			@RequestParam String soDienThoai, @RequestParam String matKhau,
			@RequestParam String diaChi, Model model) {
		ChucVu chucVu = new ChucVu();
		chucVu.setId(1);
		User user = new User();
		user.setHoTen(hoTen);
		user.setEmail(email);
		user.setTenDangNhap(tenDangNhap);
		user.setSoDienThoai(soDienThoai);
		user.setMatKhau(matKhau);
		user.setDiaChi(diaChi);
		user.setChucVu(chucVu);	
		boolean checkTenDangNhapTonTai = checkTenDangNhapTonTai(user);
		boolean checkEmailTonTai = checkEmailTonTai(user);
		boolean checkMail = validateEmail(user.getEmail());
		boolean checkPhone = validatePhoneNumber(user.getSoDienThoai());
		if(checkEmailTonTai == true && checkMail == true && checkPhone == true && checkTenDangNhapTonTai == true) {			
			userService.save(user);
			return "redirect:/admindangnhap";
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
			return "admin/admin-dangky";
		}
			
	}
	
	public boolean checkEmailTonTai(User user) {
		boolean check = true;
		List<User> list = userService.findByIdChucVu(1);
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
		List<User> list = userService.findByIdChucVu(1);
		for(int i = 0; i < list.size(); i++) {
			if(user.getTenDangNhap().equals(list.get(i).getTenDangNhap())) {
				check =  false;
				break;
			}
		}		
		return check;
	}
	
	

}
