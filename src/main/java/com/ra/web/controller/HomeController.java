package com.ra.web.controller;

import com.ra.web.entity.StudentEntity;
import com.ra.web.entity.StudentRequest;
import com.ra.web.service.Impl.StudentServiceImpl;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class HomeController {

    private StudentServiceImpl studentService;

    public HomeController(StudentServiceImpl studentServiceImpl) {
        this.studentService = studentServiceImpl;
    }

    @GetMapping(value = {"/","/index"})
    public String index(Model model){
        if (model.getAttribute("students") == null) {
            List<StudentEntity> students = studentService.findAll();
            model.addAttribute("students", students);
        }
        return "index";
    }

    @GetMapping("/create")
    public String create(Model model){
        StudentRequest studentRequest = new StudentRequest();
        model.addAttribute("student",studentRequest);
        return "create";
    }

    @PostMapping("/create-student")
    public String createStudent(@ModelAttribute("student") StudentRequest student, BindingResult bindingResult, Model model){
        StudentEntity studentEntity = studentService.create(student);
        if (studentEntity != null){
            model.addAttribute("success","Tạo thành công");
        } else {
           model.addAttribute("fail","Tạo thất bại");
        }
        return "create";
    }

    @GetMapping("/update/{id}")
    public String update(@PathVariable Integer id, Model model){
          StudentEntity oldStudent = studentService.findById(id);
          if (oldStudent != null){
              model.addAttribute("updateStudent",oldStudent);
              return "update";
          } else {
              model.addAttribute("fail","Mã sinh viên không tồn tại");
              return index(model);
          }
    }

    @PostMapping("/update/{id}")
    public String update(@PathVariable Integer id,@ModelAttribute("updateStudent") StudentRequest student,@RequestParam("imageUrl") MultipartFile newFile, Model model){
        StudentEntity updateStudent = studentService.edit(id,student,newFile);
        if (updateStudent != null){
            model.addAttribute("success", "Cập nhật thành công");
        } else {
            model.addAttribute("fail","Cập nhật thất bại");
        }
        return index(model);
    }

    @GetMapping("/delete-student/{id}")
    public String delete(@PathVariable Integer id, Model model){
        ModelAndView view = new ModelAndView("index");
        StudentEntity student = studentService.findById(id);
        if (student != null){
            if(studentService.remove(student)){
                model.addAttribute("success","Xóa thành công");
            }else {
                model.addAttribute("fail","Xóa thất bại");
            }
        }
        return index(model);
    }

    @GetMapping("/search-by-name")
    public String searchByName(@RequestParam("search") String search, Model model){
        model.addAttribute("students",studentService.findByName(search));
        return index(model);
    }
}
