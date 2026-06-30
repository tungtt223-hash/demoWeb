<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>UEF Club Management System</title>

        <style>
            /* Toàn bộ Font & Cấu trúc nền */
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f8f9fa;
                color: #333;
            }

            /* Banner Header */
            .header-banner {
                background: linear-gradient(135deg, #cc0000 0%, #990000 100%);
                color: white;
                padding: 30px;
                text-align: center;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            }
            .header-banner h1 {
                margin: 0;
                font-size: 28px;
                text-transform: uppercase;
                letter-spacing: 1px;
                text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
            }
            .header-banner p {
                margin: 10px 0 0 0;
                opacity: 0.8;
                font-size: 16px;
            }

            /* Thanh Điều Hướng Menu */
            nav {
                background-color: #222;
                padding: 0;
                margin-bottom: 30px;
                box-shadow: 0 4px 6px rgba(0,0,0,0.1);
                display: flex;
                justify-content: center;
            }
            nav a {
                color: #bbb;
                padding: 15px 25px;
                text-decoration: none;
                font-weight: 600;
                font-size: 15px;
                transition: all 0.3s ease;
                display: inline-block;
                border-bottom: 3px solid transparent;
            }
            nav a:hover {
                color: #fff;
                background-color: #cc0000;
                border-bottom: 3px solid #fff;
            }

            /* Khu vực hiển thị nội dung chính */
            .container-fluid {
                padding: 0 40px 40px 40px;
                max-width: 1300px;
                margin: 0 auto;
            }

            /* Dashboard Grid & Cards */
            .dashboard-grid {
                display: grid;
                grid-template-columns: repeat(4, 1fr);
                gap: 20px;
                margin-bottom: 35px;
            }
            .stat-card {
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 6px rgba(0,0,0,0.05);
                border-left: 5px solid #cc0000;
                transition: transform 0.3s ease;
            }
            .stat-card:hover {
                transform: translateY(-5px);
            }
            .stat-card h4 {
                margin: 0;
                color: #777;
                font-size: 14px;
                text-transform: uppercase;
            }
            .stat-card .value {
                font-size: 28px;
                font-weight: bold;
                color: #222;
                margin: 10px 0 5px 0;
            }
            .stat-card .desc {
                font-size: 12px;
                color: #28a745;
                margin: 0;
            }

            /* Cấu trúc Form và Bảng */
            .card-form {
                background: #ffffff;
                padding: 25px;
                border-radius: 8px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.05);
                margin-bottom: 25px;
                border-top: 4px solid #cc0000;
            }
            .table {
                width: 100%;
                border-collapse: collapse;
                background: white;
                border-radius: 8px;
                overflow: hidden;
                box-shadow: 0 4px 6px rgba(0,0,0,0.02);
            }
            .table th {
                background-color: #cc0000;
                color: white;
                padding: 12px 15px;
                font-weight: 600;
                text-align: left;
            }
            .table td {
                padding: 12px 15px;
                border-bottom: 1px solid #eee;
            }
            .table-striped tbody tr:nth-of-type(odd) {
                background-color: #fdfdfd;
            }
            .table-striped tbody tr:hover {
                background-color: #f1f1f1;
            }

            /* Tiêu đề mục */
            .section-title {
                color: #cc0000;
                border-bottom: 2px solid #cc0000;
                padding-bottom: 8px;
                margin-top: 30px;
                margin-bottom: 20px;
                font-size: 22px;
            }

            /* Các nút bấm */
            .btn {
                display: inline-block;
                font-weight: bold;
                padding: 8px 18px;
                font-size: 14px;
                border-radius: 5px;
                text-decoration: none;
                border: none;
                cursor: pointer;
                transition: background 0.2s;
                color: white;
            }
            .btn-primary {
                background-color: #007bff;
            }
            .btn-primary:hover {
                background-color: #0056b3;
            }
            .btn-success {
                background-color: #28a745;
            }
            .btn-success:hover {
                background-color: #218838;
            }
            .btn-danger {
                background-color: #dc3545;
            }
            .btn-danger:hover {
                background-color: #c82333;
            }
            .form-control {
                width: 100%;
                padding: 10px;
                font-size: 14px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
                margin-bottom: 15px;
            }
        </style>
    </head>
    <body>
        <div class="header-banner">
            <h1>Hệ thống Quản lý Câu lạc bộ Sinh viên - UEF</h1>
            <p>Cổng thông tin điều phối hoạt động ngoại khóa & phong trào sinh viên xuất sắc</p>
        </div>

        <nav>
            <a href="${pageContext.request.contextPath}/index.jsp">🏠 Trang chủ</a>
            <a href="${pageContext.request.contextPath}/assignments?action=list">👔 Phân công Cố vấn</a>
            <a href="${pageContext.request.contextPath}/registrations?action=viewAvailable">📝 Sinh viên Đăng ký</a>
            <a href="${pageContext.request.contextPath}/registrations?action=list">🛡️ Quản lý duyệt Đăng ký</a>
        </nav>

        <div class="container-fluid">