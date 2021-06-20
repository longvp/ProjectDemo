package com.phamvietlong.Demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.phamvietlong.Demo.entity.HoaDon;

@Repository
public interface HoaDonRepository extends JpaRepository<HoaDon, Integer> {

}
