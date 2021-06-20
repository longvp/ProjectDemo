package com.phamvietlong.Demo.controller.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.phamvietlong.Demo.entity.DanhMuc;
import com.phamvietlong.Demo.entity.GioHang;
import com.phamvietlong.Demo.entity.SanPham;
import com.phamvietlong.Demo.entity.ThuongHieu;
import com.phamvietlong.Demo.service.DanhMucService;
import com.phamvietlong.Demo.service.SanPhamService;
import com.phamvietlong.Demo.service.ThuongHieuService;

@Controller
public class HomeController {
	
	@Autowired
	DanhMucService danhMucService;
	
	@Autowired
	SanPhamService sanPhamService;
	
	@Autowired
	ThuongHieuService thuongHieuService;

	@RequestMapping(path = "/home", method = RequestMethod.GET)
	public String home(Model model, HttpSession httpSession) {
		try {
			
			List<DanhMuc> listDanhMuc = danhMucService.findAll();
			model.addAttribute("listdanhmuc", listDanhMuc);
			
			List<SanPham> listSanPham = sanPhamService.findAll();
			model.addAttribute("listsanpham", listSanPham);
			
//			Pageable pageable = PageRequest.of(0, 8);
			List<SanPham> listSanPhamLimit = new ArrayList<SanPham>();
			for(int i = 0; i < listDanhMuc.size(); i++) {
				int dem = 1;
				for(int j = 0; j < listSanPham.size(); j++) {
					if(listSanPham.get(j).getDanhMuc().getId() == listDanhMuc.get(i).getId()) {
						SanPham sp = new SanPham();
						sp.setTenSanPham(listSanPham.get(j).getTenSanPham());
						sp.setGiaTien(listSanPham.get(j).getGiaTien());
						sp.setMoTa(listSanPham.get(j).getMoTa());
						sp.setHinhSanPham(listSanPham.get(j).getHinhSanPham());
						sp.setDanhMuc(listSanPham.get(j).getDanhMuc());
						sp.setThuongHieu(listSanPham.get(j).getThuongHieu());
						sp.setId(listSanPham.get(j).getId());
						
						listSanPhamLimit.add(sp);
						dem++;
					}
					if(dem > 8) {
						break;
					}
				}
			}		
			model.addAttribute("listsanphamlimit", listSanPhamLimit);
			
			Pageable pageable = PageRequest.of(0, 7);
			Page<ThuongHieu> page = thuongHieuService.findAll(pageable);
			List<ThuongHieu> listThuongHieuLimit = page.getContent();
			model.addAttribute("listthuonghieulimit", listThuongHieuLimit);
			
			if( httpSession.getAttribute("giohang") != null) {
				List<GioHang> gioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
				model.addAttribute("soluongsanphamgiohang", gioHangs.size());		
			}
			
			return "web/Home";
			
		} catch (Exception e) {
			return null;
		}
	}
	
	
}
