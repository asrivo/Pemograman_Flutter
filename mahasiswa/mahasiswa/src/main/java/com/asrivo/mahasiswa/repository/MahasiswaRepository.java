/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.asrivo.mahasiswa.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import com.asrivo.mahasiswa.entity.Mahasiswa;
import java.util.Optional;
import org.springframework.stereotype.Repository;

/**
 *
 * @author LABP2COMDOSEN
 */
@Repository
public interface MahasiswaRepository extends JpaRepository<Mahasiswa,Long> {

    public Optional<Mahasiswa> findMahasiswaByEmail(String email);
    
}