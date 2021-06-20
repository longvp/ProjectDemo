package com.phamvietlong.Demo.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.phamvietlong.Demo.entity.ChucVu;
import com.phamvietlong.Demo.entity.DanhMuc;
import com.phamvietlong.Demo.service.ChucVuService;
import com.phamvietlong.Demo.service.DanhMucService;

@Controller
public class AdminDanhMuc {
	
	@Autowired
	ChucVuService chucVuService;
	
	@Autowired
	DanhMucService danhMucService;
	
	@RequestMapping(path = "/admindanhmuc", method = RequestMethod.GET)
	public String Default(Model model) {
		try {
			List<ChucVu> listChucVu = chucVuService.findAll();
			model.addAttribute("listchucvu", listChucVu);
			List<DanhMuc> listDanhMuc = danhMucService.findAll();
			model.addAttribute("listDanhMuc", listDanhMuc);
			return "admin/admin-danhmuc";
		} catch (Exception e) {
			return null;
		}
	}

}
