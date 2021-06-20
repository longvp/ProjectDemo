package com.phamvietlong.Demo.api;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.phamvietlong.Demo.entity.BinhLuan;
import com.phamvietlong.Demo.entity.ChiTietHoaDon;
import com.phamvietlong.Demo.entity.DanhMuc;
import com.phamvietlong.Demo.entity.HoaDon;
import com.phamvietlong.Demo.entity.SanPham;
import com.phamvietlong.Demo.entity.ThuongHieu;
import com.phamvietlong.Demo.entity.User;
import com.phamvietlong.Demo.json.JsonBinhLuan;
import com.phamvietlong.Demo.json.JsonSanPham;
import com.phamvietlong.Demo.service.BinhLuanService;
import com.phamvietlong.Demo.service.ChiTietHoaDonService;
import com.phamvietlong.Demo.service.DanhMucService;
import com.phamvietlong.Demo.service.HoaDonService;
import com.phamvietlong.Demo.service.SanPhamService;

@RestController
public class AdminAPI {

	@Autowired
	SanPhamService sanPhamService;

	@Autowired
	DanhMucService danhMucService;

	@Autowired
	BinhLuanService binhLuanService;

	@Autowired
	ChiTietHoaDonService chiTietHoaDonService;

	@Autowired
	HoaDonService hoaDonService;

// --------------------------------- SAN PHAM -------------------------------------------------

//	PHÂN TRANG
	@RequestMapping(path = "api-admin/laysanphamlimit", method = RequestMethod.GET)
	@ResponseBody
	public String LaySanPhamLimit(@RequestParam int currentPage) {
		Page<SanPham> page = sanPhamService.findAllByPageAdmin(currentPage);
		List<SanPham> list = page.getContent();
		String html = "";
		for (SanPham sp : list) {
			html += "<tr>";
			html += "<td>";
			html += "<div class='checkbox'>";
			html += "<label><input id='checkall' type='checkbox' value='" + sp.getId() + "'></label>";
			html += "</div>";
			html += "</td>";
			html += "<td> <img src='/resources/web/imgs/" + sp.getDanhMuc().getMaDanhMuc() + "/" + sp.getHinhSanPham()
					+ "' width='100px'> </td>";
			html += "<td class='ten-sp' data-idsanpham='" + sp.getId() + "'>" + sp.getTenSanPham() + "</td>";
			html += "<td>" + sp.getGiaTien() + "</td>";
			html += "<td style='text-transform: uppercase;'>" + sp.getThuongHieu().getTenThuongHieu() + "</td>";
			html += "<td>" + sp.getNgayThem() + "</td>";
			html += "<td><button type='button' class='btn btn-primary btn-sua' data-idsanpham='" + sp.getId()
					+ "' data-toggle='modal' data-target='#myModal'><i class='far fa-edit'></i></button></td>";
			html += "</tr>";
		}
		return html;
	}

//	XOA SAN PHAM
	@RequestMapping(path = "api-admin/xoasanpham", method = RequestMethod.GET)
	@ResponseBody
	public String xoaSanPham(@RequestParam int idsanpham) {
		sanPhamService.deleteById(idsanpham);
		return "";
	}

	@Autowired
	ServletContext context;

//	LAY MA DANH MUC DE UPLOAD FILE
	private static String madanhmuc = "";

	@RequestMapping(path = "api-admin/laymadanhmuc", method = RequestMethod.GET)
	@ResponseBody
	public void layMaDanhMuc(@RequestParam int iddanhmuc) {
		DanhMuc danhMuc = danhMucService.getOne(iddanhmuc);
		madanhmuc = danhMuc.getMaDanhMuc();
	}

//	UPLOAD FILE
	@RequestMapping(path = "api-admin/uploadfile", method = RequestMethod.POST)
	@ResponseBody
	public String uploadFile(MultipartHttpServletRequest request) {
		String pathSaveFile = context.getRealPath("/resources/web/imgs/" + madanhmuc + "/");
		Iterator<String> list = request.getFileNames();
		MultipartFile mpf = request.getFile(list.next());
		File fileSave = new File(pathSaveFile + mpf.getOriginalFilename());
		try {
			mpf.transferTo(fileSave);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

//	THEM SAN PHAM
	@RequestMapping(path = "api-admin/themsanpham", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public void themSanPham(@RequestParam String dataJson) {
		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode jsonObject;
		try {
			SanPham sanPham = new SanPham();
			jsonObject = objectMapper.readTree(dataJson);

			String tenSanPham = jsonObject.get("tenSanPham").asText();
			long giaTien = jsonObject.get("giaTien").asLong();
			String hinhSanPham = jsonObject.get("hinhSanPham").asText();
			String moTa = jsonObject.get("moTa").asText();
			String thongSoKyThuat = jsonObject.get("thongSoKyThuat").asText();

			DanhMuc danhMuc = new DanhMuc();
			danhMuc.setId(jsonObject.get("danhMuc").asInt());

			ThuongHieu thuongHieu = new ThuongHieu();
			thuongHieu.setId(jsonObject.get("thuongHieu").asInt());

			sanPham.setTenSanPham(tenSanPham);
			sanPham.setGiaTien(giaTien);
			sanPham.setHinhSanPham(hinhSanPham);
			sanPham.setNgayThem(new Timestamp(System.currentTimeMillis()));
			sanPham.setMoTa(moTa);
			sanPham.setThongSoKyThuat(thongSoKyThuat);
			sanPham.setDanhMuc(danhMuc);
			sanPham.setThuongHieu(thuongHieu);

			sanPhamService.save(sanPham);

		} catch (Exception e) {

		}
	}

// LAY THONG TIN SAN PHAM
	@RequestMapping(path = "api-admin/laythongtinsanpham", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public JsonSanPham layThongTinSanPham(@RequestParam int idsanpham) {
		JsonSanPham jsonSanPham = new JsonSanPham();
		SanPham sanPham = sanPhamService.getOne(idsanpham);

		DanhMuc danhMuc = new DanhMuc();
		danhMuc.setId(sanPham.getDanhMuc().getId());
		danhMuc.setTenDanhMuc(sanPham.getDanhMuc().getTenDanhMuc());
		danhMuc.setMaDanhMuc(sanPham.getDanhMuc().getMaDanhMuc());

		ThuongHieu thuongHieu = new ThuongHieu();
		thuongHieu.setId(sanPham.getThuongHieu().getId());
		thuongHieu.setTenThuongHieu(sanPham.getThuongHieu().getTenThuongHieu());

		jsonSanPham.setId(sanPham.getId());
		jsonSanPham.setTenSanPham(sanPham.getTenSanPham());
		jsonSanPham.setGiaTien(sanPham.getGiaTien());
		jsonSanPham.setMoTa(sanPham.getMoTa());
		jsonSanPham.setHinhSanPham(sanPham.getHinhSanPham());
		jsonSanPham.setDanhMuc(sanPham.getDanhMuc());
		// jsonSanPham.setChiTietHoaDons(sanPham.getChiTietHoaDons());
		jsonSanPham.setNgayThem(sanPham.getNgayThem());
		jsonSanPham.setThongSoKyThuat(sanPham.getThongSoKyThuat());
		jsonSanPham.setDanhMuc(danhMuc);
		jsonSanPham.setThuongHieu(thuongHieu);

		return jsonSanPham;
	}

	// CAP NHAT SAN PHAM
	@RequestMapping(path = "api-admin/capnhatsanpham", method = RequestMethod.POST)
	@ResponseBody
	public String capNhatSanPham(@RequestParam String dataJson) {
		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode jsonObject;
		try {
			SanPham sanPham = new SanPham();
			jsonObject = objectMapper.readTree(dataJson);

			String tenSanPham = jsonObject.get("tenSanPham").asText();
			long giaTien = jsonObject.get("giaTien").asLong();
			String hinhSanPham = jsonObject.get("hinhSanPham").asText();
			String moTa = jsonObject.get("moTa").asText();
			String thongSoKyThuat = jsonObject.get("thongSoKyThuat").asText();

			DanhMuc danhMuc = new DanhMuc();
			danhMuc.setId(jsonObject.get("danhMuc").asInt());

			ThuongHieu thuongHieu = new ThuongHieu();
			thuongHieu.setId(jsonObject.get("thuongHieu").asInt());

			sanPham.setTenSanPham(tenSanPham);
			sanPham.setGiaTien(giaTien);
			sanPham.setHinhSanPham(hinhSanPham);
			sanPham.setMoTa(moTa);
			sanPham.setNgayThem(new Timestamp(System.currentTimeMillis()));
			sanPham.setThongSoKyThuat(thongSoKyThuat);
			sanPham.setDanhMuc(danhMuc);
			sanPham.setThuongHieu(thuongHieu);

			int idsanpham = jsonObject.get("idsanpham").asInt();
			sanPham.setId(idsanpham);

			sanPhamService.save(sanPham);

		} catch (Exception e) {

		}
		return "";
	}

// --------------------------------- DANH MUC -------------------------------------------------
// XOA DANH MUC
//	@RequestMapping(path = "api-admin/xoadanhmuc", method = RequestMethod.GET)
//	@ResponseBody
//	public String xoaDanhMuc(@RequestParam int iddanhmuc) {	
//		DanhMuc danhMuc = danhMucService.getOne(iddanhmuc);
//		List<SanPham> list = sanPhamService.findAllByIdDanhMuc(iddanhmuc);
//		for (SanPham sanPham : list) {
//			sanPhamService.deleteById(sanPham.getId());
//		}
//		danhMucService.deleteById(iddanhmuc);
//		return "";
//	}

// --------------------------------- BINH LUAN -------------------------------------------------
//	XOA BINH LUAN
	@RequestMapping(path = "api-admin/xoabinhluan", method = RequestMethod.GET)
	@ResponseBody
	public String xoaBinhLuan(@RequestParam int id) {
		binhLuanService.deleteById(id);
		return "";
	}

// THEM BINH LUAN
	@RequestMapping(path = "api-admin/thembinhluan", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public void themBinhLuan(@RequestParam String dataJson) {
		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode jsonObject;
		try {
			BinhLuan binhLuan = new BinhLuan();
			jsonObject = objectMapper.readTree(dataJson);

			User user = new User();
			user.setTenDangNhap(jsonObject.get("user").asText());
			user.setId(jsonObject.get("user").asInt());

			SanPham sanPham = new SanPham();
			sanPham.setId(jsonObject.get("sanPham").asInt());

			String textBinhLuan = jsonObject.get("textBinhLuan").asText();

			binhLuan.setUser(user);
			binhLuan.setSanPham(sanPham);
			binhLuan.setTextBinhLuan(textBinhLuan);
			binhLuan.setNgayBinhLuan(new Timestamp(System.currentTimeMillis()));

			binhLuanService.save(binhLuan);

		} catch (Exception e) {

		}
	}

	// LAY THONG TIN SAN PHAM
//		@RequestMapping(path = "api-admin/laythongtinsanpham", method = RequestMethod.POST, produces="application/json; charset=utf-8")
//		@ResponseBody
//		public JsonSanPham layThongTinSanPham(@RequestParam int idsanpham) {
//			JsonSanPham jsonSanPham = new JsonSanPham();
//			SanPham sanPham = sanPhamService.getOne(idsanpham);	
//			
//			DanhMuc danhMuc = new DanhMuc();
//			danhMuc.setId(sanPham.getDanhMuc().getId());
//			danhMuc.setTenDanhMuc(sanPham.getDanhMuc().getTenDanhMuc());
//			danhMuc.setMaDanhMuc(sanPham.getDanhMuc().getMaDanhMuc());
//				
//			ThuongHieu thuongHieu = new ThuongHieu();
//			thuongHieu.setId(sanPham.getThuongHieu().getId());
//			thuongHieu.setTenThuongHieu(sanPham.getThuongHieu().getTenThuongHieu());
//			
//			jsonSanPham.setId(sanPham.getId());
//			jsonSanPham.setTenSanPham(sanPham.getTenSanPham());
//			jsonSanPham.setGiaTien(sanPham.getGiaTien());
//			jsonSanPham.setMoTa(sanPham.getMoTa());
//			jsonSanPham.setHinhSanPham(sanPham.getHinhSanPham()); 
//			jsonSanPham.setDanhMuc(sanPham.getDanhMuc());
//			jsonSanPham.setChiTietHoaDons(sanPham.getChiTietHoaDons());
//			jsonSanPham.setNgayThem(sanPham.getNgayThem());
//			jsonSanPham.setThongSoKyThuat(sanPham.getThongSoKyThuat());
//			jsonSanPham.setDanhMuc(danhMuc);
//			jsonSanPham.setThuongHieu(thuongHieu);
//					
//			return jsonSanPham;
//		}

// LAY THONG TIN BINH LUAN
	@RequestMapping(path = "api-admin/laythongtinbinhluan", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public JsonBinhLuan layThongTinBinhLuan(@RequestParam int idbinhluan) {
		JsonBinhLuan jsonBinhLuan = new JsonBinhLuan();
		BinhLuan binhLuan = binhLuanService.getOne(idbinhluan);

		User user = new User();
		user.setId(binhLuan.getUser().getId());
		user.setTenDangNhap(binhLuan.getUser().getTenDangNhap());

		SanPham sanPham = new SanPham();
		sanPham.setId(binhLuan.getSanPham().getId());

		jsonBinhLuan.setId(binhLuan.getId());
		jsonBinhLuan.setSanPham(sanPham);
		jsonBinhLuan.setUser(user);
		jsonBinhLuan.setTextBinhLuan(binhLuan.getTextBinhLuan());
		jsonBinhLuan.setNgayBinhLuan(binhLuan.getNgayBinhLuan());

		return jsonBinhLuan;
	}

// CAP NHAT BINH LUAN
	@RequestMapping(path = "api-admin/capnhatbinhluan", method = RequestMethod.POST)
	@ResponseBody
	public String capNhatBinhLuan(@RequestParam String dataJson) {
		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode jsonObject;
		try {
			BinhLuan binhLuan = new BinhLuan();
			jsonObject = objectMapper.readTree(dataJson);

			String textBinhLuan = jsonObject.get("textBinhLuan").asText();

			User user = new User();
			user.setId(jsonObject.get("user").asInt());

			SanPham sanPham = new SanPham();
			sanPham.setId(jsonObject.get("sanPham").asInt());
			
			binhLuan.setUser(user);
			binhLuan.setSanPham(sanPham);
			binhLuan.setTextBinhLuan(textBinhLuan);
			binhLuan.setNgayBinhLuan(new Timestamp(System.currentTimeMillis()));

			int idbinhluan = jsonObject.get("idbinhluan").asInt();
			binhLuan.setId(idbinhluan);

			binhLuanService.save(binhLuan);

		} catch (Exception e) {

		}
		return "";
	}

}
