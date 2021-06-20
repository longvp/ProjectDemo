package com.phamvietlong.Demo.controller.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.phamvietlong.Demo.entity.DanhMuc;
import com.phamvietlong.Demo.entity.GioHang;
import com.phamvietlong.Demo.service.DanhMucService;

@Controller
public class KhuyenMaiController {
	
	@Autowired
	DanhMucService danhMucService;
	
	@RequestMapping(path="/khuyenmai", method = RequestMethod.GET)
	public String Default(Model model, HttpSession httpSession) {
		
		List<DanhMuc> listDanhMuc = danhMucService.findAll();
		model.addAttribute("listdanhmuc", listDanhMuc);
		
		if( httpSession.getAttribute("giohang") != null) {
			List<GioHang> gioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
			model.addAttribute("soluongsanphamgiohang", gioHangs.size());		
		}
		
		return "web/Khuyenmai";
	}

}
