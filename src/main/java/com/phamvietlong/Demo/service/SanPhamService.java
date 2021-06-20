package com.phamvietlong.Demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.phamvietlong.Demo.entity.SanPham;
import com.phamvietlong.Demo.repository.SanPhamRepository;

@Service
public class SanPhamService {

	@Autowired
	SanPhamRepository sanPhamRepository;
	
	public List<SanPham> findAll(){
		return sanPhamRepository.findAll();
	}
	
	public Page<SanPham> findAllByIdDanhMucAndPageWeb(int idDanhMuc, int page){
		Pageable pageable = PageRequest.of(page-1, 8);
		return sanPhamRepository.findAllByIdDanhMuc(idDanhMuc, pageable);
	}
	
	public Page<SanPham> findAllByPageAdmin(int page){
		Pageable pageable = PageRequest.of(page-1, 20);
		return sanPhamRepository.findAll(pageable);
	}
	
	public SanPham getOne(int id) {
		return sanPhamRepository.getOne(id);
	}
	
	public List<SanPham> findAllByIdDanhMuc(int idDanhMuc){
		return sanPhamRepository.findAllByIdDanhMuc(idDanhMuc);
	}
	
	public List<SanPham> findAllByIdDanhMucAndIdThuongHieu(int idDanhMuc, int idThuongHieu){
		return sanPhamRepository.findAllByIdDanhMucAndIdThuongHieu(idDanhMuc, idThuongHieu);
	}
	
//	SEARCH NAME
	public List<SanPham> findAllBySearchName(String tenSanPham){
		return sanPhamRepository.findAllBySearchName(tenSanPham);
	}
	
	public void deleteById(int idsanpham) {
		sanPhamRepository.deleteById(idsanpham);
	}
	
	public void save(SanPham sanpham) {
		sanPhamRepository.save(sanpham);
	}
		
}
