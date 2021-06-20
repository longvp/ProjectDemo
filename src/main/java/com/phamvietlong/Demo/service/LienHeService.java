package com.phamvietlong.Demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phamvietlong.Demo.entity.LienHe;
import com.phamvietlong.Demo.repository.LienHeRepository;

@Service
public class LienHeService {
	
	@Autowired
	LienHeRepository lienHeRepository;
	
	public List<LienHe> findAll(){
		return lienHeRepository.findAll();
	}
	
	public void save(LienHe lienHe) {
		lienHeRepository.save(lienHe);
	}

}
