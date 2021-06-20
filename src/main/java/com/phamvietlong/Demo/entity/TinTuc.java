package com.phamvietlong.Demo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tintuc")
public class TinTuc {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "hinhtintuc")
	private String hinhTinTuc;
	
	@Column(name = "tieude")
	private String tieuDe;
	
	@Column(name = "motangan")
	private String moTaNgan;
	
	@Column(name = "noidung")
	private String noiDung;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getHinhTinTuc() {
		return hinhTinTuc;
	}

	public void setHinhTinTuc(String hinhTinTuc) {
		this.hinhTinTuc = hinhTinTuc;
	}

	public String getTieuDe() {
		return tieuDe;
	}

	public void setTieuDe(String tieuDe) {
		this.tieuDe = tieuDe;
	}

	public String getMoTaNgan() {
		return moTaNgan;
	}

	public void setMoTaNgan(String moTaNgan) {
		this.moTaNgan = moTaNgan;
	}

	public String getNoiDung() {
		return noiDung;
	}

	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}
	

}
