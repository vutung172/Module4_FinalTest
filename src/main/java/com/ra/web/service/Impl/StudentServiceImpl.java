package com.ra.web.service.Impl;

import com.ra.web.entity.StudentEntity;
import com.ra.web.entity.StudentRequest;
import com.ra.web.repository.StudentRepository;
import com.ra.web.service.StudentService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class StudentServiceImpl implements StudentService{
    private final StudentRepository studentRepository;

    private final FileServiceImpl fileService;

    public StudentServiceImpl(StudentRepository studentRepository,FileServiceImpl fileService) {
        this.studentRepository = studentRepository;
        this.fileService = fileService;
    }

    @Override
    public StudentEntity create(StudentRequest request){
        StudentEntity student = new StudentEntity();
        if (request.getImageUrl().getSize() >0){
            student.setImageUrl(fileService.upload(request.getImageUrl()));
        }
        student.setStudentName(request.getStudentName());
        student.setAddress(request.getAddress());
        student.setBirthday(request.getBirthday());
        student.setPhoneNumber(request.getPhoneNumber());
        student.setSex(request.getSex());
        return studentRepository.save(student);
    }

    @Override
    public StudentEntity edit(Integer id,StudentRequest newStudent, MultipartFile newFile){
        StudentEntity oldStudent = studentRepository.findById(id).orElse(null);
        if (oldStudent != null){
            if (newFile.getSize() > 0){
                oldStudent.setImageUrl(fileService.upload(newFile));
            }
            oldStudent.setStudentName(newStudent.getStudentName());
            oldStudent.setAddress(newStudent.getAddress());
            oldStudent.setBirthday(newStudent.getBirthday());
            oldStudent.setPhoneNumber(newStudent.getPhoneNumber());
            oldStudent.setSex(newStudent.getSex());
            return studentRepository.save(oldStudent);
        } else {
            return null;
        }
    }

    @Override
    public boolean remove(StudentEntity studentEntity){
        studentRepository.delete(studentEntity);
        return true;
    }

    @Override
    public List<StudentEntity> findByName(String name){
        List<StudentEntity> students;
        students = studentRepository.findAll(Pageable.ofSize(10)).stream().filter(s -> s.getStudentName().contains(name)).collect(Collectors.toList());
        return students;
    }
    public List<StudentEntity> findAll(){
        return studentRepository.findAll();
    }
    public StudentEntity findById(Integer id){
        return studentRepository.findById(id).orElse(null);
    }
}
