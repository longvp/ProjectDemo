package com.phamvietlong.Demo.controller.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.phamvietlong.Demo.entity.DanhMuc;
import com.phamvietlong.Demo.entity.SanPham;
import com.phamvietlong.Demo.service.DanhMucService;
import com.phamvietlong.Demo.service.SanPhamService;

@Controller
public class TrangTimKiemController {
	
	@Autowired
	SanPhamService sanPhamService;
	
	@Autowired
	DanhMucService danhMucService;
	
	@RequestMapping(path = "/timkiem", method = RequestMethod.GET)
	public String Default(Model model) {
		
		return "web/Trangtimkiem";
	}
	
	@RequestMapping(path = "/timkiem", method = RequestMethod.POST)
	public String timKiem(@RequestParam String tenSanPham, Model model) {
		
		List<DanhMuc> listDanhMuc = danhMucService.findAll();
		model.addAttribute("listdanhmuc", listDanhMuc);
		
		List<SanPham> listSanPhamTheoTen = sanPhamService.findAllBySearchName(tenSanPham);
		model.addAttribute("listsanphamtheoten", listSanPhamTheoTen);
		model.addAttribute("soKetQua", listSanPhamTheoTen.size());
		model.addAttribute("tenSearch", tenSanPham);

		
		return "web/Trangtimkiem";
	}

}
