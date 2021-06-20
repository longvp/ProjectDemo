package com.phamvietlong.Demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phamvietlong.Demo.entity.TinTuc;
import com.phamvietlong.Demo.repository.TinTucRepository;

@Service
public class TinTucService {
	
	@Autowired
	TinTucRepository tinTucRepository;

	public List<TinTuc> findAll(){
		return tinTucRepository.findAll();
	}
	
	public TinTuc getOne(int id) {
		return tinTucRepository.getOne(id);
	}
	
}
