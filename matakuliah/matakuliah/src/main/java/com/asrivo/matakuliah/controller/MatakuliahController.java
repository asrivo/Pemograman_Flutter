/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.asrivo.matakuliah.controller;

import com.asrivo.matakuliah.entity.Matakuliah;
import com.asrivo.matakuliah.service.MatakuliahService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author asrivo
 */
@RestController
@RequestMapping("api/v1/matakuliah")
public class MatakuliahController {
    @Autowired
    private MatakuliahService matakuliahService;
    @GetMapping
    public List<Matakuliah> getAll(){
        return matakuliahService.getAll();
    }
    
    @PostMapping
    public void insert(@RequestBody Matakuliah matakuliah){
        matakuliahService.insert(matakuliah);
    }
}