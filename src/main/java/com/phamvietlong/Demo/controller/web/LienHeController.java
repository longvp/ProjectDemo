package com.phamvietlong.Demo.controller.web;

import java.sql.Timestamp;
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

import com.phamvietlong.Demo.entity.DanhMuc;
import com.phamvietlong.Demo.entity.GioHang;
import com.phamvietlong.Demo.entity.LienHe;
import com.phamvietlong.Demo.service.DanhMucService;
import com.phamvietlong.Demo.service.LienHeService;

@Controller
public class LienHeController {
	
	@Autowired
	DanhMucService danhMucService;
	
	@Autowired
	LienHeService lienHeService;
	
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

	@RequestMapping(path = "/lienhe", method = RequestMethod.GET)
	public String Default(Model model , HttpSession httpSession) {
		try {
			List<DanhMuc> listDanhMuc = danhMucService.findAll();
			
			if( httpSession.getAttribute("giohang") != null) {
				List<GioHang> gioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
				model.addAttribute("soluongsanphamgiohang", gioHangs.size());		
			}
			
			model.addAttribute("listdanhmuc", listDanhMuc);
			return "web/Lienhe";
		} catch (Exception e) {
			return null;
		}
	}
	
	@RequestMapping(path = "/lienhe", method = RequestMethod.POST)
	public String lienHe(@RequestParam String hoTen, @RequestParam String email,
			@RequestParam String soDienThoai, @RequestParam String diaChi, 
			@RequestParam String noiDung, Model model) {
		
		LienHe lienHe = new LienHe();
		lienHe.setHoTen(hoTen);
		lienHe.setEmail(email);
		lienHe.setSoDienThoai(soDienThoai);
		lienHe.setDiaChi(diaChi);
		lienHe.setNoiDung(noiDung);
		lienHe.setNgayLienHe(new Timestamp(System.currentTimeMillis()));
		
		boolean checkMail = validateEmail(lienHe.getEmail());
		boolean checkPhone = validatePhoneNumber(lienHe.getSoDienThoai());
		if(checkMail == true && checkPhone == true) {			
			lienHeService.save(lienHe);
			return "redirect:/home";
		}else {
			String message = "";
			if(checkMail == false) {
				message = "Vui lòng nhập đúng định dạng email !";
			}
			if(checkPhone == false) {
				message = "Vui lòng nhập đúng số điện thoại, gồm 10 chữ số !";
			}
			model.addAttribute("message", message);
			return "web/Lienhe";
		}
	}
	
}
