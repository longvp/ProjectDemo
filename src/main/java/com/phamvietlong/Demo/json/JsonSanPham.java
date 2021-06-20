package com.phamvietlong.Demo.json;

import java.sql.Timestamp;
import java.util.List;

import com.phamvietlong.Demo.entity.ChiTietHoaDon;
import com.phamvietlong.Demo.entity.DanhMuc;
import com.phamvietlong.Demo.entity.ThuongHieu;

public class JsonSanPham {
	private int id;
	private String tenSanPham;
	private long giaTien;
	private String moTa;
	private String hinhSanPham;
	private String hots;
	private String news;
	private String buys;
	private DanhMuc danhMuc;
	private ThuongHieu thuongHieu;
	private List<ChiTietHoaDon> chiTietHoaDons;
	private Timestamp ngayThem;
	private String thongSoKyThuat;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTenSanPham() {
		return tenSanPham;
	}
	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}
	public long getGiaTien() {
		return giaTien;
	}
	public void setGiaTien(long giaTien) {
		this.giaTien = giaTien;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	public String getHinhSanPham() {
		return hinhSanPham;
	}
	public void setHinhSanPham(String hinhSanPham) {
		this.hinhSanPham = hinhSanPham;
	}
	public String getHots() {
		return hots;
	}
	public void setHots(String hots) {
		this.hots = hots;
	}
	public String getNews() {
		return news;
	}
	public void setNews(String news) {
		this.news = news;
	}
	public String getBuys() {
		return buys;
	}
	public void setBuys(String buys) {
		this.buys = buys;
	}
	public DanhMuc getDanhMuc() {
		return danhMuc;
	}
	public void setDanhMuc(DanhMuc danhMuc) {
		this.danhMuc = danhMuc;
	}
	public ThuongHieu getThuongHieu() {
		return thuongHieu;
	}
	public void setThuongHieu(ThuongHieu thuongHieu) {
		this.thuongHieu = thuongHieu;
	}
	public List<ChiTietHoaDon> getChiTietHoaDons() {
		return chiTietHoaDons;
	}
	public void setChiTietHoaDons(List<ChiTietHoaDon> chiTietHoaDons) {
		this.chiTietHoaDons = chiTietHoaDons;
	}
	public Timestamp getNgayThem() {
		return ngayThem;
	}
	public void setNgayThem(Timestamp ngayThem) {
		this.ngayThem = ngayThem;
	}
	public String getThongSoKyThuat() {
		return thongSoKyThuat;
	}
	public void setThongSoKyThuat(String thongSoKyThuat) {
		this.thongSoKyThuat = thongSoKyThuat;
	}
	
	

}
