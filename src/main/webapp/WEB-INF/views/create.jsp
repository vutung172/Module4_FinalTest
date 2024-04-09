<%--
  Created by IntelliJ IDEA.
  User: TungV
  Date: 2024/03/27
  Time: 22:30
  To change labelis template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Tạo mới sinh viên</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<h2 class="header text-center text-capitalize text-info">Thêm mới sinh viên</h2>
<div class="container mb-2 center">
    <h4 class="text-success">${success}</h4>
    <h4 class="text-danger">${fail}</h4>
<f:form action="/create-student" modelAttribute="student" method="post" cssClass="form-control" enctype="multipart/form-data">
    <div class="container flex-box ">
        <div class="mb-3">
            <label class="form-label">Họ và tên</label>
            <input name="studentName" type="text" class="form-control">
        </div>
        <div class="mb-3">
            <label class="form-label">Địa chỉ</label>
            <input name="address" type="text" class="form-control"/>
        </div>
        <div class="mb-3">
            <label class="form-label">Ngày tháng năm sinh</label>
            <f:input path="birthday" type="date" pattern="dd/MM/yyyy" cssClass="form-control"/>
        </div>
        <div class="mb-3">
            <label class="form-label">Ảnh</label>
            <input name="imageUrl" type="file"  class="form-control"/>
        </div>
        <div class="mb-3">
            <label class="form-label">Số điện thoại</label>
            <input name="phoneNumber" type="text" class="form-control"/>
        </div>
        <div class="mb-3">
            <label class="form-label">Giới tính</label>
            <select name="sex" class="form-control">
                <option value="true">Nam</option>
                <option value="false">Nữ</option>
            </select>
        </div>
        <div class="btn-group-justified m-3">
            <button class=" btn btn-primary" type="submit">Thêm</button>
            <button class="btn btn-info"><a href="index" class="btn-link">Trang chủ</a></button>
        </div>
    </div>
</f:form>
    </div>
</body>
</html>
