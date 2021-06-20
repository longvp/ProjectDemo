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
@Table(name="thuonghieu")
public class ThuongHieu {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="tenthuonghieu")
	private String tenThuongHieu;
	
	@Column(name="hinhthuonghieu")
	private String hinhThuongHieu;
	
	@OneToMany(mappedBy = "thuongHieu")
	private List<SanPham> sanPham;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTenThuongHieu() {
		return tenThuongHieu;
	}

	public void setTenThuongHieu(String tenThuongHieu) {
		this.tenThuongHieu = tenThuongHieu;
	}

	public String getHinhThuongHieu() {
		return hinhThuongHieu;
	}

	public void setHinhThuongHieu(String hinhThuongHieu) {
		this.hinhThuongHieu = hinhThuongHieu;
	}

	public List<SanPham> getSanPham() {
		return sanPham;
	}

	public void setSanPham(List<SanPham> sanPham) {
		this.sanPham = sanPham;
	}
	
	
}
