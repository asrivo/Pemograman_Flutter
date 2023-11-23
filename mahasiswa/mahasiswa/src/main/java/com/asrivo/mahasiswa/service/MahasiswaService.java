/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.asrivo.mahasiswa.service;

import com.asrivo.mahasiswa.entity.Mahasiswa;
import com.asrivo.mahasiswa.repository.MahasiswaRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author LABP2COMDOSEN
 */
@Service
public class MahasiswaService {
    private final MahasiswaRepository mahasiswaRepository;

    @Autowired
    public MahasiswaService(MahasiswaRepository mahasiswaRepository) {
        this.mahasiswaRepository = mahasiswaRepository;
    }
    
    public List<Mahasiswa> getAllMahasiswa(){
        return mahasiswaRepository.findAll();
    } 
    
    public void insertMahasiswa(Mahasiswa mahasiswa){
        Optional<Mahasiswa> mahasiswaOptional = 
                mahasiswaRepository.findMahasiswaByEmail(mahasiswa.getEmail());
        if(mahasiswaOptional.isPresent()){
            throw new IllegalStateException("Email sudah ada");
        }
        mahasiswaRepository.save(mahasiswa);
    }
    
}