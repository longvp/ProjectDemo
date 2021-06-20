package com.phamvietlong.Demo.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.phamvietlong.Demo.entity.BinhLuan;
import com.phamvietlong.Demo.entity.ChucVu;
import com.phamvietlong.Demo.entity.SanPham;
import com.phamvietlong.Demo.entity.User;
import com.phamvietlong.Demo.service.BinhLuanService;
import com.phamvietlong.Demo.service.ChucVuService;
import com.phamvietlong.Demo.service.SanPhamService;
import com.phamvietlong.Demo.service.UserService;

@Controller
public class AdminBinhLuan {
	
	@Autowired
	ChucVuService chucVuService;
	
	@Autowired
	BinhLuanService binhLuanService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	SanPhamService sanPhamService;
	
	@RequestMapping(path = "/adminbinhluan", method = RequestMethod.GET)
	public String Default(Model model) {	
		try {
			List<ChucVu> listChucVu = chucVuService.findAll();
			model.addAttribute("listchucvu", listChucVu);
			
			List<BinhLuan> listBinhLuan = binhLuanService.finAll();
			model.addAttribute("listBinhLuan", listBinhLuan);
			
			List<User> listUser = userService.findAll();
			model.addAttribute("listUser", listUser);
			
			List<SanPham> listSanPham = sanPhamService.findAll();
			model.addAttribute("listSanPham", listSanPham);
			
			return "admin/admin-binhluan";
		} catch (Exception e) {
			return null;
		}
		
	}

}
