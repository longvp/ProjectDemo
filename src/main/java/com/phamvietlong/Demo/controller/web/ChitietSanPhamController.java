package com.phamvietlong.Demo.controller.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.phamvietlong.Demo.entity.BinhLuan;
import com.phamvietlong.Demo.entity.DanhMuc;
import com.phamvietlong.Demo.entity.GioHang;
import com.phamvietlong.Demo.entity.SanPham;
import com.phamvietlong.Demo.service.BinhLuanService;
import com.phamvietlong.Demo.service.DanhMucService;
import com.phamvietlong.Demo.service.SanPhamService;

@Controller
@SessionAttributes("giohang")
public class ChitietSanPhamController {
	
	@Autowired
	DanhMucService danhMucService;
	
	@Autowired
	SanPhamService sanPhamService;
	
	@Autowired
	BinhLuanService binhLuanService;
	
	@RequestMapping(path = "/chitiet/{idsanpham}", method = RequestMethod.GET)
	public String chiTiet(@PathVariable int idsanpham, Model model, HttpSession httpSession) {
		try {			
			List<DanhMuc> listDanhMuc = danhMucService.findAll();			
			SanPham sp = sanPhamService.getOne(idsanpham);			
			
			if( httpSession.getAttribute("giohang") != null) {
				List<GioHang> gioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
				model.addAttribute("soluongsanphamgiohang", gioHangs.size());		
			}
			
			List<BinhLuan> listBinhLuan = binhLuanService.finAll();
			int soLuongBinhLuanTrenMotSanPham = binhLuanService.findByIdSanPham(idsanpham).size();
			
			model.addAttribute("soLuongBinhLuan", soLuongBinhLuanTrenMotSanPham);
			model.addAttribute("listBinhLuan", listBinhLuan);
			model.addAttribute("listdanhmuc", listDanhMuc);
			model.addAttribute("sanpham", sp);
			return "web/Chitiet";
			
		} catch (Exception e) {
			return null;
		}
		
	}


}
