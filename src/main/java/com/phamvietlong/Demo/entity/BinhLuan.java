package com.phamvietlong.Demo.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "binhluan")
public class BinhLuan {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "idsanpham")
	private SanPham sanPham;
	
	@OneToOne
	@JoinColumn(name = "iduser")
	private User user;
	
	@Column(name = "textbinhluan")
	private String textBinhLuan;
	
	@Column(name = "ngaybinhluan")
	private Timestamp ngayBinhLuan;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public SanPham getSanPham() {
		return sanPham;
	}

	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getTextBinhLuan() {
		return textBinhLuan;
	}

	public void setTextBinhLuan(String textBinhLuan) {
		this.textBinhLuan = textBinhLuan;
	}

	public Timestamp getNgayBinhLuan() {
		return ngayBinhLuan;
	}

	public void setNgayBinhLuan(Timestamp ngayBinhLuan) {
		this.ngayBinhLuan = ngayBinhLuan;
	}
	

}
