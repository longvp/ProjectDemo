package com.phamvietlong.Demo.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.phamvietlong.Demo.entity.ChucVu;
import com.phamvietlong.Demo.entity.DanhMuc;
import com.phamvietlong.Demo.entity.ThuongHieu;
import com.phamvietlong.Demo.service.ChucVuService;
import com.phamvietlong.Demo.service.ThuongHieuService;

@Controller
public class AdminThuongHieu {
	
	@Autowired
	ChucVuService chucVuService;
	
	@Autowired
	ThuongHieuService thuongHieuService;
	
	@RequestMapping(path = "/adminthuonghieu", method = RequestMethod.GET)
	public String Default(Model model) {
		try {
			List<ChucVu> listChucVu = chucVuService.findAll();
			model.addAttribute("listchucvu", listChucVu);
			List<ThuongHieu> listThuongHieu = thuongHieuService.findAll();
			model.addAttribute("listThuongHieu", listThuongHieu);
			return "admin/admin-thuonghieu";
		} catch (Exception e) {
			return null;
		}
	}

}
