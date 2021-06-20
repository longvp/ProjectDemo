package com.phamvietlong.Demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.phamvietlong.Demo.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

	@Query(value = "select * from user where email = ?1 and matkhau = ?2", nativeQuery = true)
	public User findByEmailAndMatKhau(String email, String matKhau);
	
	@Query(value = "select * from user where idchucvu = ?1", nativeQuery = true)
	public List<User> findByIdChucVu(int idchucvu);
	
	@Query(value = "select * from user where idchucvu = ?1 and email = ?2 and matkhau = ?3", nativeQuery = true)
	public User findByIdChucVuAndEmailAndMatKhau(int idchucvu, String email, String matKhau);
}
