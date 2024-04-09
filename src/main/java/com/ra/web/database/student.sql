CREATE DATABASE students;
use students;

CREATE TABLE student(
    student_id int primary key auto_increment,
    student_name varchar(100),
    address varchar(255),
    birthday date,
    image_url varchar(255),
    phone_number varchar(15),
    sex bit default 1
);
