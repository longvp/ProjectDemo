package com.phamvietlong.Demo.entity;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "sanpham")
public class SanPham {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="tensanpham")
	private String tenSanPham;
	
	@Column(name="giatien")
	private long giaTien;
	
	@Column(name="mota")
	private String moTa;
	
	@Column(name="hinhsanpham")
	private String hinhSanPham;
	
	@Column(name="hots")
	private String hots;
	
	@Column(name="news")
	private String news;
	
	@Column(name="buys")
	private String buys;
	
	@Column(name = "ngaythem")
	private Timestamp ngayThem;
	
	@Column(name = "thongsokythuat")
	private String thongSoKyThuat;
	
	@OneToOne
	@JoinColumn(name = "iddanhmuc")
	private DanhMuc danhMuc;
	
	@OneToOne
	@JoinColumn(name = "idthuonghieu")
	private ThuongHieu thuongHieu;
	
	@OneToMany(mappedBy = "sanPham", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<ChiTietHoaDon> chiTietHoaDons;
	
	@OneToMany(mappedBy = "sanPham")
	private List<BinhLuan> binhLuans;
	
	
	
	public String getThongSoKyThuat() {
		return thongSoKyThuat;
	}

	public void setThongSoKyThuat(String thongSoKyThuat) {
		this.thongSoKyThuat = thongSoKyThuat;
	}

	public Timestamp getNgayThem() {
		return ngayThem;
	}

	public void setNgayThem(Timestamp ngayThem) {
		this.ngayThem = ngayThem;
	}

	public List<ChiTietHoaDon> getChiTietHoaDons() {
		return chiTietHoaDons;
	}

	public void setChiTietHoaDons(List<ChiTietHoaDon> chiTietHoaDons) {
		this.chiTietHoaDons = chiTietHoaDons;
	}

	public ThuongHieu getThuongHieu() {
		return thuongHieu;
	}
	
	public void setThuongHieu(ThuongHieu thuongHieu) {
		this.thuongHieu = thuongHieu;
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
	
	
	
}
