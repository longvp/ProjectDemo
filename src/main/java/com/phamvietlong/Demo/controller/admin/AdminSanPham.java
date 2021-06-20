package com.phamvietlong.Demo.controller.admin;

import java.io.File;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.phamvietlong.Demo.entity.ChucVu;
import com.phamvietlong.Demo.entity.DanhMuc;
import com.phamvietlong.Demo.entity.SanPham;
import com.phamvietlong.Demo.entity.ThuongHieu;
import com.phamvietlong.Demo.service.ChucVuService;
import com.phamvietlong.Demo.service.DanhMucService;
import com.phamvietlong.Demo.service.SanPhamService;
import com.phamvietlong.Demo.service.ThuongHieuService;

@Controller
public class AdminSanPham {
	
	@Autowired
	SanPhamService sanPhamService;	
	
	@Autowired
	DanhMucService danhMucService;
	
	@Autowired 
	ThuongHieuService thuongHieuService;
	
	@Autowired
	ChucVuService chucVuService;
	
	
//	DANH SACH SAN PHAM	
//	PHÂN TRANG
	@RequestMapping(path="/danhsachsanpham", method = RequestMethod.GET)
	public String danhSachSanPham(Model model) {	
		try {		
			List<ChucVu> listChucVu = chucVuService.findAll();
			model.addAttribute("listchucvu", listChucVu);
			
			int currentPage = 1;
			Page<SanPham> page = sanPhamService.findAllByPageAdmin(currentPage);
			int totalPage = page.getTotalPages();
			int totalItem = (int) page.getTotalElements();
			List<SanPham> listSanPhams = page.getContent();
			List<DanhMuc> listDanhMuc = danhMucService.findAll();
			List<ThuongHieu> listThuongHieu = thuongHieuService.findAll();
			
			model.addAttribute("listthuonghieu", listThuongHieu);
			model.addAttribute("listdanhmuc", listDanhMuc);
			model.addAttribute("listsanphams", listSanPhams);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("totalPage", totalPage);
			model.addAttribute("totalItem", totalItem);
			return "admin/admin-sanpham";
		} catch (Exception e) {
			return null;
		}
		
	}	
	
	
	


}
