package com.phamvietlong.Demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.phamvietlong.Demo.entity.ThuongHieu;
import com.phamvietlong.Demo.repository.ThuongHieuRepository;

@Service
public class ThuongHieuService {
	
	@Autowired
	ThuongHieuRepository thuongHieuRepository;
	
	public List<ThuongHieu> findAll(){
		return thuongHieuRepository.findAll();
	}
	
	public Page<ThuongHieu> findAll(Pageable pageable){
		return thuongHieuRepository.findAll(pageable);
	}

}
