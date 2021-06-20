package com.phamvietlong.Demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phamvietlong.Demo.entity.ChucVu;
import com.phamvietlong.Demo.repository.ChucVuRepository;

@Service
public class ChucVuService {
	
	@Autowired
	ChucVuRepository chucVuRepository;
	
	public ChucVu getOne(int id) {
		return chucVuRepository.getOne(id);
	}
	
	public List<ChucVu> findAll(){
		return chucVuRepository.findAll();
	}

}
