package com.phamvietlong.Demo.api;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.phamvietlong.Demo.entity.BinhLuan;
import com.phamvietlong.Demo.entity.GioHang;
import com.phamvietlong.Demo.entity.SanPham;
import com.phamvietlong.Demo.entity.TinTuc;
import com.phamvietlong.Demo.entity.User;
import com.phamvietlong.Demo.service.BinhLuanService;
import com.phamvietlong.Demo.service.SanPhamService;
import com.phamvietlong.Demo.service.TinTucService;
import com.phamvietlong.Demo.service.UserService;

@RestController
@SessionAttributes({"user", "giohang"})
public class WebAPI {
	
	@Autowired
	SanPhamService sanPhamService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	TinTucService tinTucService;
	
	@Autowired
	BinhLuanService binhLuanService;
	
// --------------------------------- SAN PHAM -------------------------------------------------
	
	// PHAN TRANG
	@RequestMapping(path = "api/laysanphamlimit", method = RequestMethod.GET)
	@ResponseBody
	public String LaySanPhamLimit(@RequestParam int iddanhmuc, @RequestParam int currentPage) {
		Page<SanPham> page = sanPhamService.findAllByIdDanhMucAndPageWeb(iddanhmuc, currentPage);
		List<SanPham> listSanPham = page.getContent();
		String html = "<div class='row product'>";
		for (SanPham sp : listSanPham) {
			html += "<div class='col-md-3 col-sm-6'>";
			html += "<div class='sp'>";
			html += "<a href='/chitiet/"+sp.getId()+"'><img src='/resources/web/imgs/"+sp.getDanhMuc().getMaDanhMuc()+"/"+sp.getHinhSanPham()+"' width='100%'></a>";
			html += "<a href='/chitiet/"+sp.getId()+"' class='name-sp'>"+sp.getTenSanPham()+"</a>";
			html += "<div class='price'>"+sp.getGiaTien()+"</div>";
			
			html += "</div>";
			html += "</div>";
		}
		html += "</div>";
		return html;
		
	}
	
	// LAY SAN PHAM THEO THUONG HIEU
	@RequestMapping(path = "api/laysanphamtheothuonghieu", method = RequestMethod.GET)
	@ResponseBody
	public String LaySanPhamTheoThuongHieu(@RequestParam int iddanhmuc, @RequestParam int idthuonghieu) {		
		List<SanPham> listSanPhamTheoThuongHieu = sanPhamService.findAllByIdDanhMucAndIdThuongHieu(iddanhmuc, idthuonghieu);		
		String html = "<div class='row product'>";
		for (SanPham sp : listSanPhamTheoThuongHieu) {
			html += "<div class='col-md-3 col-sm-6'>";
			html += "<div class='sp'>";
			html += "<a href='/chitiet/"+sp.getId()+"'><img src='/resources/web/imgs/"+sp.getDanhMuc().getMaDanhMuc()+"/"+sp.getHinhSanPham()+"' width='100%'></a>";
			html += "<a href='/chitiet/"+sp.getId()+"' class='name-sp'>"+sp.getTenSanPham()+"</a>";
			html += "<div class='price'>"+sp.getGiaTien()+"</div>";
			
			html += "</div>";
			html += "</div>";
		}
		html += "</div>";
		return html;
		
	}
	
//	THEM GIO HANG
	@RequestMapping(path = "api/themgiohang", method = RequestMethod.GET)
	@ResponseBody
	public String themGioHang(@ModelAttribute GioHang gioHang, HttpSession httpSession) {
		int soLuongBanDau = gioHang.getSoLuong();
		if(httpSession.getAttribute("giohang") == null) {
			List<GioHang> gioHangs = new ArrayList<>();
			gioHangs.add(gioHang);
			httpSession.setAttribute("giohang", gioHangs);
			return gioHangs.size() + "";
		}else {
			List<GioHang> listGioHang = (List<GioHang>) httpSession.getAttribute("giohang");
			int vitri = kiemTraSanPhamDaTonTaiTrongGioHang(listGioHang, gioHang.getIdSanPham(), httpSession);
			if(vitri == -1) {
				listGioHang.add(gioHang);
			}
			else {
				int soLuongMoi = listGioHang.get(vitri).getSoLuong() + soLuongBanDau;				
				listGioHang.get(vitri).setSoLuong(soLuongMoi);
			}
			return listGioHang.size() + "";
		}
		
	}
	
	private int kiemTraSanPhamDaTonTaiTrongGioHang(List<GioHang> listGioHang, int idsanpham, HttpSession httpSession) {
		for(int i = 0; i < listGioHang.size(); i++) {
			if(listGioHang.get(i).getIdSanPham() == idsanpham) {
				return i;
			}
		}	
		return -1;
	}
	
	// CAP NHAT SO LUONG GIO HANG
	@RequestMapping(path = "api/capnhatsoluonggiohang", method = RequestMethod.GET)
	@ResponseBody
	public void capNhatSoLuongGioHang(@RequestParam int idsanpham, @RequestParam int soluong, HttpSession httpSession) {
		if(httpSession.getAttribute("giohang") != null) {
			List<GioHang> listGioHang = (List<GioHang>) httpSession.getAttribute("giohang");
			int vitri = kiemTraSanPhamDaTonTaiTrongGioHang(listGioHang, idsanpham, httpSession);
			listGioHang.get(vitri).setSoLuong(soluong);
		}
	}
	
	// XOA GIO HANG
	@RequestMapping(path = "api/xoagiohang", method = RequestMethod.GET)
	public void xoaGioHang(@RequestParam int idsanpham, HttpSession httpSession) {	
		if(httpSession.getAttribute("giohang") != null) {
			List<GioHang> listGioHang = (List<GioHang>) httpSession.getAttribute("giohang");
			int vitri = kiemTraSanPhamDaTonTaiTrongGioHang(listGioHang, idsanpham, httpSession);
			listGioHang.remove(vitri);
		}
		
	}
	
	
	
/// --------------------------------- TIN TUC -------------------------------------------------
	
	@RequestMapping(path = "api/tintuc", method = RequestMethod.GET)
	public String tinTuc(@RequestParam int idTinTuc) {
		TinTuc tinTuc = tinTucService.getOne(idTinTuc);
		String html = "";
		html += "<h3>Tin tức</h3>";          			
		html += "<div class='text-center'>";
		html +=	"<img alt='' src='/resources/web/imgs/tintuc/"+tinTuc.getHinhTinTuc()+"'>";
		html += "</div>";
		html += "<div>";
		html +=	"<h3 class='mb-5 mt-5'>"+tinTuc.getTieuDe()+"</h3>";
		html +=	"<div ><i class='far fa-calendar-alt'></i><i>Ngày: 18-05-2021</i></div>";
		html += "<h5 class='mt-5' style='text-align: justify;'>"+tinTuc.getMoTaNgan()+"</h5>";
		html +=	"<p>"+tinTuc.getNoiDung()+"</p>";
		html += "</div>";
		
		return html;
	}
	
	
/// --------------------------------- BINH LUAN -------------------------------------------------
	
	@RequestMapping(path = "api/binhluan", method = RequestMethod.GET)
	@ResponseBody
	public void binhLuan(@RequestParam int idSanPham, @RequestParam int idUser, @RequestParam String textBinhLuan) {		
		if(textBinhLuan != "") {
			SanPham sanPham = new SanPham();
			sanPham.setId(idSanPham);
			
			User user = new User();
			user.setId(idUser);
			
			BinhLuan binhLuan = new BinhLuan();
			binhLuan.setNgayBinhLuan(new Timestamp(System.currentTimeMillis()));
			binhLuan.setSanPham(sanPham);
			binhLuan.setUser(user);
			binhLuan.setTextBinhLuan(textBinhLuan);
			
			binhLuanService.save(binhLuan);
		}	
	}
	
}
