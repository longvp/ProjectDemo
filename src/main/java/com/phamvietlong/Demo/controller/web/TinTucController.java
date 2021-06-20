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
import com.phamvietlong.Demo.entity.TinTuc;
import com.phamvietlong.Demo.service.DanhMucService;
import com.phamvietlong.Demo.service.TinTucService;

@Controller
public class TinTucController {
	
	@Autowired
	DanhMucService danhMucService;
	
	@Autowired
	TinTucService tinTucService;
	
	@RequestMapping(path="/tintuc", method = RequestMethod.GET)
	public String Default(Model model, HttpSession httpSession) {		
		try {
			List<DanhMuc> listDanhMuc = danhMucService.findAll();
			model.addAttribute("listdanhmuc", listDanhMuc);
			
			if( httpSession.getAttribute("giohang") != null) {
				List<GioHang> gioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
				model.addAttribute("soluongsanphamgiohang", gioHangs.size());		
			}
			
			List<TinTuc> listTinTuc = tinTucService.findAll();
			model.addAttribute("listTinTuc", listTinTuc);
			
			return "web/Tintuc";
		} catch (Exception e) {
			return null;
		}
		
	}

}
