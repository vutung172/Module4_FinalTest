package com.ra.web.entity;

import org.springframework.web.multipart.MultipartFile;

import javax.persistence.Basic;
import javax.persistence.Column;
import java.sql.Date;

public class StudentRequest {
    @Basic
    @Column(name = "student_name")
    private String studentName;
    @Basic
    @Column(name = "address")
    private String address;
    @Basic
    @Column(name = "birthday")
    private Date birthday;
    @Basic
    @Column(name = "image_url")
    private MultipartFile imageUrl;
    @Basic
    @Column(name = "phone_number")
    private String phoneNumber;
    @Basic
    @Column(name = "sex")
    private Boolean sex;

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public MultipartFile getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(MultipartFile imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Boolean getSex() {
        return sex;
    }

    public void setSex(Boolean sex) {
        this.sex = sex;
    }
}
