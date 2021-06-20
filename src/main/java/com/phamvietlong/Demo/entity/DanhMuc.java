package com.phamvietlong.Demo.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "danhmuc")
public class DanhMuc {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "tendanhmuc")
	private String tenDanhMuc;
	
	@Column(name = "icon")
	private String icon;
	
	@Column(name = "madanhmuc")
	private String maDanhMuc;
	
	@Column(name = "hinhquangcao")
	private String hinhQuangCao;

	@OneToMany(mappedBy = "danhMuc")
	private List<SanPham> sanPham;
	
	public List<SanPham> getSanPham() {
		return sanPham;
	}

	public void setSanPham(List<SanPham> sanPham) {
		this.sanPham = sanPham;
	}

	public String getHinhQuangCao() {
		return hinhQuangCao;
	}

	public void setHinhQuangCao(String hinhQuangCao) {
		this.hinhQuangCao = hinhQuangCao;
	}

	public String getMaDanhMuc() {
		return maDanhMuc;
	}

	public void setMaDanhMuc(String maDanhMuc) {
		this.maDanhMuc = maDanhMuc;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTenDanhMuc() {
		return tenDanhMuc;
	}

	public void setTenDanhMuc(String tenDanhMuc) {
		this.tenDanhMuc = tenDanhMuc;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}
	

}
