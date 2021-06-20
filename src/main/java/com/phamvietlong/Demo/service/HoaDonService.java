package com.phamvietlong.Demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phamvietlong.Demo.entity.HoaDon;
import com.phamvietlong.Demo.repository.HoaDonRepository;

@Service
public class HoaDonService {
	
	@Autowired
	HoaDonRepository hoaDonRepository;
	
	public void save(HoaDon hoaDon) {
		 hoaDonRepository.save(hoaDon);
	}
	
	public List<HoaDon> findAll(){
		return hoaDonRepository.findAll();
	}
	
	public void deleteById(int idhoadon) {
		hoaDonRepository.deleteById(idhoadon);
	}

}
