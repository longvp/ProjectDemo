package com.phamvietlong.Demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.phamvietlong.Demo.entity.LienHe;

@Repository
public interface LienHeRepository extends JpaRepository<LienHe, Integer> {

}
