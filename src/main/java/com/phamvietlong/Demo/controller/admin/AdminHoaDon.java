package com.phamvietlong.Demo.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.phamvietlong.Demo.entity.ChiTietHoaDon;
import com.phamvietlong.Demo.entity.ChucVu;
import com.phamvietlong.Demo.service.ChiTietHoaDonService;
import com.phamvietlong.Demo.service.ChucVuService;

@Controller
public class AdminHoaDon {
	
	@Autowired
	ChucVuService chucVuService;
	
	@Autowired
	ChiTietHoaDonService chiTietHoaDonService;
	
	@RequestMapping(path = "/adminhoadon", method = RequestMethod.GET)
	public String Default(Model model) {
		try {
			List<ChucVu> listChucVu = chucVuService.findAll();
			model.addAttribute("listchucvu", listChucVu);
			
			List<ChiTietHoaDon> listChiTietHoaDon = chiTietHoaDonService.findAll();
			model.addAttribute("listChiTietHoaDon", listChiTietHoaDon);
			return "admin/admin-hoadon";
		} catch (Exception e) {
			return null;
		}
		
		
	}

}
