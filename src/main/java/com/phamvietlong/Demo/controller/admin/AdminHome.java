package com.phamvietlong.Demo.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.phamvietlong.Demo.entity.ChiTietHoaDon;
import com.phamvietlong.Demo.entity.ChucVu;
import com.phamvietlong.Demo.entity.User;
import com.phamvietlong.Demo.service.ChiTietHoaDonService;
import com.phamvietlong.Demo.service.ChucVuService;
import com.phamvietlong.Demo.service.HoaDonService;
import com.phamvietlong.Demo.service.SanPhamService;
import com.phamvietlong.Demo.service.UserService;

@Controller
public class AdminHome {
	
	@Autowired
	ChucVuService chucVuService;
	
	@Autowired
	SanPhamService sanPhamService;
	
	@Autowired
	ChiTietHoaDonService chiTietHoaDonService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping(path="/admin", method = RequestMethod.GET)
	public String adminHome(Model model) {	
		try {
			List<ChucVu> listChucVu = chucVuService.findAll();
			model.addAttribute("listchucvu", listChucVu);
			
			int tongSoSanPham = sanPhamService.findAll().size();
			model.addAttribute("tongSoSanPham", tongSoSanPham);
			
			List<ChiTietHoaDon> listChiTiet = chiTietHoaDonService.findAll();
			int tongHoaDon = listChiTiet.size();
			model.addAttribute("tongHoaDon", tongHoaDon);
			
			int tongSoTien = 0;
			for(int i = 0; i < listChiTiet.size(); i++) {
				tongSoTien += listChiTiet.get(i).getThanhTien();
			}
			model.addAttribute("tongSoTien", tongSoTien);
			
			int soAdmin = 0;
			int soKhachHang = 0;
			List<User> listUser = userService.findAll();
			for(int i = 0; i < listUser.size(); i++) {
				if(listUser.get(i).getChucVu().getId() == 1) {
					soAdmin++;
				}
				if(listUser.get(i).getChucVu().getId() == 2) {
					soKhachHang++;
				}
			}
			model.addAttribute("soAdmin", soAdmin);
			model.addAttribute("soKhachHang", soKhachHang);
			
			
			return "admin/admin-home";
		} catch (Exception e) {
			return null;
		}
	}

}
