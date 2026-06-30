<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <title>Danh sách Câu lạc bộ</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
        <h1>Quản lý Câu lạc bộ</h1>
        <nav>
            <a href="index.jsp">Trang chủ</a>
            <a href="clubs?action=list">Danh sách CLB</a>
        </nav>

        <div style="margin-bottom: 15px;">
            <a href="club-form.jsp" class="btn btn-success">+ Thêm câu lạc bộ mới</a>
        </div>

        <form action="clubs" method="get" style="margin-bottom: 15px;">
            <input type="hidden" name="action" value="search">
            <input type="text" name="keyword" value="${param.keyword}" placeholder="Tìm kiếm theo mã hoặc tên CLB..." style="width: 300px; padding: 7px; border: 1px solid #ccc; border-radius: 4px;">
            <button type="submit" class="btn">Tìm kiếm</button>
        </form>

        <table>
            <thead>
                <tr>
                    <th>Mã CLB</th>
                    <th>Tên Câu Lạc Bộ</th>
                    <th>Phân loại</th>
                    <th>Mô tả</th>
                    <th>Ngày thành lập</th>
                    <th>Số TV tối đa</th>
                    <th>Trạng thái</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="club" items="${clubList}">
                <tr>
                    <td><strong>${club.clubCode}</strong></td>
                    <td>${club.clubName}</td>
                    <td>${club.category}</td>
                    <td>${club.description}</td>
                    <td>${club.establishmentDate}</td>
                    <td>${club.maxMembers}</td>
                    <td>
                        <span style="color: ${club.status == 'Open' ? 'green' : 'red'}; font-weight: bold;">
                            ${club.status}
                        </span>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>