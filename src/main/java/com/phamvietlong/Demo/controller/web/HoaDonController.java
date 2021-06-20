package com.phamvietlong.Demo.controller.web;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.phamvietlong.Demo.entity.ChiTietHoaDon;
import com.phamvietlong.Demo.entity.GioHang;
import com.phamvietlong.Demo.entity.HoaDon;
import com.phamvietlong.Demo.entity.SanPham;
import com.phamvietlong.Demo.service.HoaDonService;

@Controller
public class HoaDonController {
	
	@Autowired
	HoaDonService hoaDonService;

	@RequestMapping(path="/hoadon", method = RequestMethod.GET)
	public String hoaDon(Model model, HttpSession httpSession) {
		if(httpSession.getAttribute("giohang") != null) {
			List<GioHang> listGioHang = (List<GioHang>) httpSession.getAttribute("giohang");
			long tongtien = 0;
			for(int i = 0; i < listGioHang.size(); i++) {
				tongtien += listGioHang.get(i).getGiaTien() * listGioHang.get(i).getSoLuong();
			}
			model.addAttribute("listgiohang", listGioHang);
			model.addAttribute("tongtien", tongtien);
			model.addAttribute("soluongsanphamgiohang", listGioHang.size());	
		}
		return "web/Hoadon";
	}
	
	@RequestMapping(path="/hoadon", method = RequestMethod.POST)
	public String themHoaDon(@RequestParam String hoTen, @RequestParam String email, 
			@RequestParam String soDienThoai, @RequestParam String diaChi, 
			@RequestParam String ghiChu,
			@RequestParam String phuongThucThanhToan,
			HttpSession httpSession) {
		
		if(httpSession.getAttribute("giohang") != null) {
			List<GioHang> listGioHang = (List<GioHang>) httpSession.getAttribute("giohang");
			
			HoaDon hoaDon = new HoaDon();
			hoaDon.setHoTen(hoTen);
			hoaDon.setEmail(email);
			hoaDon.setSoDienThoai(soDienThoai);
			hoaDon.setDiaChi(diaChi);
			hoaDon.setPhuongThucThanhToan(phuongThucThanhToan);
			hoaDon.setGhiChu(ghiChu);
			hoaDon.setNgayDatHang(new Timestamp(System.currentTimeMillis()));
			
			List<ChiTietHoaDon> listChiTietHoaDon = new ArrayList<ChiTietHoaDon>();
			for (GioHang gioHang : listGioHang) {
				
				ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
				
				SanPham sanPham = new SanPham();				
				sanPham.setId(gioHang.getIdSanPham());
				sanPham.setTenSanPham(gioHang.getTenSanPham());	
				
				chiTietHoaDon.setSanPham(sanPham);
				chiTietHoaDon.setTenSanPham(gioHang.getTenSanPham());	
				chiTietHoaDon.setSoLuong(gioHang.getSoLuong());
				chiTietHoaDon.setThanhTien(gioHang.getGiaTien()*gioHang.getSoLuong());							
				chiTietHoaDon.setHoaDon(hoaDon);
				
				listChiTietHoaDon.add(chiTietHoaDon);
			}
			
			hoaDon.setChiTietHoaDons(listChiTietHoaDon);
			
			hoaDonService.save(hoaDon);		
			
		}
		return "redirect:/home";
	}
	
}
