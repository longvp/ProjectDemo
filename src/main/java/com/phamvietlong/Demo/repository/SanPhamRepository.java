package com.phamvietlong.Demo.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.phamvietlong.Demo.entity.SanPham;

@Repository
public interface SanPhamRepository extends JpaRepository<SanPham, Integer> {
	
	@Query(value="select * from sanpham s where s.giatien = ?1", nativeQuery = true)
	List<SanPham> sanPhamQueryGiaTien(String giaTien, Pageable pageable);
	
	@Query(value="select * from sanpham s where s.iddanhmuc = ?1", nativeQuery = true)
	List<SanPham> findAllByIdDanhMuc(int idDanhMuc);
	
//	@Query(value="select * from sanpham s where s.iddanhmuc = ?1", nativeQuery = true)
//	List<SanPham> findAllByIdDanhMuc(int idDanhMuc, Pageable pageable);
	
	@Query(value="select * from sanpham s where s.iddanhmuc = ?1", nativeQuery = true)
	Page<SanPham> findAllByIdDanhMuc(int idDanhMuc, Pageable pageable);
	
	@Query(value="select * from sanpham s where s.iddanhmuc = ?1 and s.idthuonghieu = ?2", nativeQuery = true)
	List<SanPham> findAllByIdDanhMucAndIdThuongHieu(int idDanhMuc, int idThuongHieu);
	
//	SEARCH NAME
	@Query(value = "select * from sanpham s where s.tensanpham like %?1%", nativeQuery = true)
	List<SanPham> findAllBySearchName(String tenSanPham);

}
