package com.phamvietlong.Demo.json;

import java.sql.Timestamp;

import com.phamvietlong.Demo.entity.SanPham;
import com.phamvietlong.Demo.entity.User;

public class JsonBinhLuan {
	private int id;
	private User user;
	private SanPham sanPham;
	private String textBinhLuan;
	private Timestamp ngayBinhLuan;
	
	public Timestamp getNgayBinhLuan() {
		return ngayBinhLuan;
	}
	public void setNgayBinhLuan(Timestamp ngayBinhLuan) {
		this.ngayBinhLuan = ngayBinhLuan;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public SanPham getSanPham() {
		return sanPham;
	}
	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}
	public String getTextBinhLuan() {
		return textBinhLuan;
	}
	public void setTextBinhLuan(String textBinhLuan) {
		this.textBinhLuan = textBinhLuan;
	}

}
