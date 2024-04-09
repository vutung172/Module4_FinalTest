package com.ra.web.service;

import com.ra.web.entity.StudentEntity;
import com.ra.web.entity.StudentRequest;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface StudentService {
    StudentEntity create(StudentRequest request);
    StudentEntity edit(Integer id,StudentRequest newStudent, MultipartFile newfile);
    boolean remove(StudentEntity studentEntity);
    List<StudentEntity> findByName(String name);
}
