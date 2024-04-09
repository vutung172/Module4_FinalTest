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
    <title>Cập nhật sinh viên</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<div class="container mb-2 center">
    <h2>${fail}</h2>
    <f:form modelAttribute="updateStudent" method="post" cssClass="form-control" enctype="multipart/form-data">
        <div class="container flex-box ">
            <div class="mb-3">
                <label class="form-label">Mã sinh viên</label>
                <f:input path="studentId"  readonly="true" type="text" class="form-control" />
            </div>
            <div class="mb-3">
                <label class="form-label">Họ và tên</label>
                <f:input path="studentName"  type="text" class="form-control" />
            </div>
            <div class="mb-3">
                <label class="form-label">Địa chỉ</label>
                <f:input path="address"  type="text" class="form-control"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Ngày tháng năm sinh</label>
                <f:input path="birthday"  type="date" pattern="dd/MM/yyyy" cssClass="form-control"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Ảnh</label><br>
                <img src="${student.imageUrl}" alt="${student.studentName}" class="thumbnail img-rounded" width="100px">
                <f:input path="imageUrl" type="file" class="form-control"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Số điện thoại</label>
                <f:input path="phoneNumber" type="text" class="form-control"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Giới tính</label>
                <f:select path="sex" class="form-control">
                    <option value="true">Nam</option>
                    <option value="false">Nữ</option>
                </f:select>
            </div>
            <div class="btn-group-justified m-3">
                <button class=" btn btn-primary" type="submit">Sửa</button>
                <button class="btn btn-info" type="button"><a href="/index">Trở về</a></button>
            </div>

        </div>
    </f:form>
</div>
</body>
</html>
