
<%--
  Created by IntelliJ IDEA.
  User: TungV
  Date: 2024/03/27
  Time: 20:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Trang chủ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<h2 class="text-capitalize text-center text-info">TRANG CHỦ</h2>
<div class="container">
    <form action="/search-by-name" method="get" class="m-2">
        <div class="input-group">
            <input type="text" id="search" name="search" placeholder="tìm kiếm theo tên sinh viên" class="rounded-start-3 p-2 flex-grow-1">
            <button class="btn btn-info btn-outline-secondary" type="submit">Tìm kiếm</button>
        </div>
    </form>
</div>
<div class="container">
    <h4 class="text-success">${success}</h4>
    <h4 class="text-danger">${fail}</h4>
    <table class="table table-bordered">
        <tr>
            <th>Mã</th>
            <th>Tên</th>
            <th>Địa chỉ</th>
            <th>Ngày sinh</th>
            <th>Ảnh</th>
            <th>Điện thoại</th>
            <th>Giới tính</th>
            <th>Hành động</th>
        </tr>
        <c:forEach var="s" items="${students}"  >
            <tr>
                <td>${s.studentId}</td>
                <td>${s.studentName}</td>
                <td>${s.address}</td>
                <td><fmt:formatDate value="${s.birthday}" pattern="dd/MM/yyyy" /></td>
                <td><img src="${s.imageUrl}" alt="${s.studentName}" ></td>
                <td>${s.phoneNumber}</td>
                <td>${s.sex ? "Nam" : "Nữ"}</td>
                <td>
                    <button type="button"><a href="/update/${s.studentId}">Edit</a></button>
                    <button type="button"><a href="/delete-student/${s.studentId}" onclick="confirm('Bạn có muốn xóa không')">Delete</a></button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</html>
