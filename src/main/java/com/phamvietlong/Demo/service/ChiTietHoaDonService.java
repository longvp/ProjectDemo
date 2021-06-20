package com.phamvietlong.Demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phamvietlong.Demo.entity.ChiTietHoaDon;
import com.phamvietlong.Demo.repository.ChiTietHoaDonRepository;

@Service
public class ChiTietHoaDonService {
	
	@Autowired
	ChiTietHoaDonRepository chiTietHoaDonRepository;
	
	public List<ChiTietHoaDon> findAll(){
		return chiTietHoaDonRepository.findAll();
	}
	
	public void deleteById(int idchitiet) {
		chiTietHoaDonRepository.deleteById(idchitiet);
	}

}
