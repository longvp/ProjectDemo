package com.phamvietlong.Demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.phamvietlong.Demo.entity.BinhLuan;

@Repository
public interface BinhLuanRepository extends JpaRepository<BinhLuan, Integer> {
	
	@Query(value = "select * from binhluan where idsanpham = ?1", nativeQuery = true)
	List<BinhLuan> findByIdSanPham(int idSanPham);

}
