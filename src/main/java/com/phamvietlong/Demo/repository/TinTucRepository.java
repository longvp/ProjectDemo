package com.phamvietlong.Demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.phamvietlong.Demo.entity.TinTuc;

@Repository
public interface TinTucRepository extends JpaRepository<TinTuc, Integer>{

}
