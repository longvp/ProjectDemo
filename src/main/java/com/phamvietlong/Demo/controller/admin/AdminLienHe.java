package com.phamvietlong.Demo.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.phamvietlong.Demo.entity.ChucVu;
import com.phamvietlong.Demo.entity.LienHe;
import com.phamvietlong.Demo.service.ChucVuService;
import com.phamvietlong.Demo.service.LienHeService;

@Controller
public class AdminLienHe {
	
	@Autowired
	ChucVuService chucVuService;
	
	@Autowired
	LienHeService lienHeService;
	
	@RequestMapping(path = "/adminlienhe", method = RequestMethod.GET)
	public String Default(Model model) {
		try {
			List<ChucVu> listChucVu = chucVuService.findAll();
			model.addAttribute("listchucvu", listChucVu);
			
			List<LienHe> listLienHe = lienHeService.findAll();
			model.addAttribute("listLienHe", listLienHe);
			
			return "admin/admin-lienhe";
		} catch (Exception e) {
			return null;
		}
		
		
	}
	

}
