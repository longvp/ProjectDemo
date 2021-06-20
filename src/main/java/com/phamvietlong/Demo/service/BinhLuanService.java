package com.phamvietlong.Demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phamvietlong.Demo.entity.BinhLuan;
import com.phamvietlong.Demo.repository.BinhLuanRepository;

@Service
public class BinhLuanService {
	
	@Autowired
	BinhLuanRepository binhLuanRepository;
	
	public BinhLuan getOne(int id) {
		return binhLuanRepository.getOne(id);
	}
	
	public List<BinhLuan> finAll(){
		return binhLuanRepository.findAll();
	}
	
	public List<BinhLuan> findByIdSanPham(int idSanPham){
		return binhLuanRepository.findByIdSanPham(idSanPham);
	}
	
	public void save(BinhLuan binhLuan) {
		binhLuanRepository.save(binhLuan);
	}
	
	public void deleteById(int idbinhluan) {
		binhLuanRepository.deleteById(idbinhluan);
	}

}
