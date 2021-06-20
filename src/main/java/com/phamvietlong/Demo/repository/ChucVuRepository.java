package com.phamvietlong.Demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.phamvietlong.Demo.entity.ChucVu;

@Repository
public interface ChucVuRepository extends JpaRepository<ChucVu, Integer> {

}
