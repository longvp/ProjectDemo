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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.phamvietlong.Demo.entity.DanhMuc;
import com.phamvietlong.Demo.entity.GioHang;
import com.phamvietlong.Demo.entity.SanPham;
import com.phamvietlong.Demo.entity.SoSanPhamTrenMotPage;
import com.phamvietlong.Demo.entity.ThuongHieu;
import com.phamvietlong.Demo.service.DanhMucService;
import com.phamvietlong.Demo.service.SanPhamService;
import com.phamvietlong.Demo.service.ThuongHieuService;

@Controller
public class SanPhamController {

	@Autowired
	DanhMucService danhMucService;

	@Autowired
	SanPhamService sanPhamService;

	@Autowired
	ThuongHieuService thuongHieuService;

	@RequestMapping(path = "/danh-muc/{iddanhmuc}", method = RequestMethod.GET)
	public String danhMuc(@PathVariable int iddanhmuc, Model model, HttpSession httpSession) {
		try {		
			List<DanhMuc> listDanhMuc = danhMucService.findAll();
			
			String tenDanhMuc = "";
			for(int i = 0; i < listDanhMuc.size(); i++) {
				if(listDanhMuc.get(i).getId() == iddanhmuc) {
					tenDanhMuc = listDanhMuc.get(i).getTenDanhMuc();
				}
			}

			List<SanPham> listSanPham = sanPhamService.findAll();		
			
			int currentPage = 1;
			Page<SanPham> page = sanPhamService.findAllByIdDanhMucAndPageWeb(iddanhmuc, currentPage);
			int totalPage = page.getTotalPages();
			List<SanPham> listSanPhamLimit = page.getContent();
			
			List<ThuongHieu> listThuongHieuTheoDanhMuc = layThuongHieuTheoDanhMuc(iddanhmuc);
			
			model.addAttribute("listsanphamlimit", listSanPhamLimit);		
			model.addAttribute("iddanhmuc", iddanhmuc);
			model.addAttribute("listdanhmuc", listDanhMuc);
			model.addAttribute("tendanhmuc", tenDanhMuc);
			model.addAttribute("listsanpham", listSanPham);
			model.addAttribute("listthuonghieutheodanhmuc", listThuongHieuTheoDanhMuc);
			
			
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("totalPage", totalPage);

			
			
			if( httpSession.getAttribute("giohang") != null) {
				List<GioHang> gioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
				model.addAttribute("soluongsanphamgiohang", gioHangs.size());		
			}

			return "web/SanPhamTheoDanhMuc";
		} catch (Exception e) {
			return null;
		}
		
	}
	
	@RequestMapping(path = "/{tendanhmuc}/thuong-hieu/{idthuonghieu}", method = RequestMethod.GET)
	public String thuongHieu(@PathVariable int idthuonghieu, @PathVariable String tendanhmuc , Model model) {
		try {
			
			List<DanhMuc> listDanhMuc = danhMucService.findAll();
			int iddanhmuc = 0;
			for(int i = 0; i < listDanhMuc.size(); i++) {
				if(listDanhMuc.get(i).getTenDanhMuc().equalsIgnoreCase(tendanhmuc)) {
					iddanhmuc = listDanhMuc.get(i).getId();
				}
			}
			
			String tenthuonghieu = "";
			List<ThuongHieu> listThuongHieu = thuongHieuService.findAll();
			for(int i = 0; i < listThuongHieu.size(); i++) {
				if(listThuongHieu.get(i).getId() == idthuonghieu) {
					tenthuonghieu = listThuongHieu.get(i).getTenThuongHieu();
				}
			}
			
			model.addAttribute("listdanhmuc", listDanhMuc);
			model.addAttribute("iddanhmuc", iddanhmuc);
			model.addAttribute("tenthuonghieu", tenthuonghieu);
			 
			return "web/SanPhamTheoThuongHieu";
		} catch (Exception e) {
			return null;
		}	
	}

	public List<ThuongHieu> layThuongHieuTheoDanhMuc(int idDanhMuc) {
		List<ThuongHieu> listThuongHieu = thuongHieuService.findAll();
		List<SanPham> listSanPham = sanPhamService.findAll();
		List<ThuongHieu> list = new ArrayList<ThuongHieu>();
		try {
			for (int i = 0; i < listThuongHieu.size(); i++) {
				int dem = 0;
				ThuongHieu th = new ThuongHieu();
				for (int j = 0; j < listSanPham.size(); j++) {
					if (listSanPham.get(j).getDanhMuc().getId() == idDanhMuc
							&& listSanPham.get(j).getThuongHieu().getId() == listThuongHieu.get(i).getId()) {
						dem++;
						th.setHinhThuongHieu(listSanPham.get(j).getThuongHieu().getHinhThuongHieu());
						th.setId(listSanPham.get(j).getThuongHieu().getId());
						th.setSanPham(listSanPham.get(j).getThuongHieu().getSanPham());
						th.setTenThuongHieu(listSanPham.get(j).getThuongHieu().getTenThuongHieu());
						break;
					}
				}
				if (dem > 0) {
					list.add(th);
				}
			}
		} catch (Exception e) {
			return null;
		}
		return list;
	}

}
