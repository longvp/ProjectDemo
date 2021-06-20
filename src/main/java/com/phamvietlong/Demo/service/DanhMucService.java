package com.phamvietlong.Demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phamvietlong.Demo.entity.DanhMuc;
import com.phamvietlong.Demo.repository.DanhMucRepository;

@Service
public class DanhMucService {

	@Autowired
	DanhMucRepository danhMucRepository;
	
	public List<DanhMuc> findAll() {
		return danhMucRepository.findAll();
	}
	
	public DanhMuc getOne(int id) {
		return danhMucRepository.getOne(id);
	}
	
	public void deleteById(int iddanhmuc) {
		danhMucRepository.deleteById(iddanhmuc);
	}
}
