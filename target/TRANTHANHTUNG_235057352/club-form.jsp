<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Thêm Câu lạc bộ</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
        <h1>Thêm Câu lạc bộ Mới</h1>
        <nav>
            <a href="index.jsp">Trang chủ</a>
            <a href="clubs?action=list">Quay lại danh sách</a>
        </nav>

        <div class="form-container">
            <form action="clubs" method="post">
                <input type="hidden" name="action" value="add">

                <div class="form-group">
                    <label>Mã Câu lạc bộ:</label>
                    <input type="text" name="clubCode" required placeholder="Ví dụ: CLB_IT">
                </div>
                <div class="form-group">
                    <label>Tên Câu lạc bộ:</label>
                    <input type="text" name="clubName" required>
                </div>
                <div class="form-group">
                    <label>Phân loại (Category):</label>
                    <input type="text" name="category" required placeholder="Thể thao, Học thuật, Nghệ thuật...">
                </div>
                <div class="form-group">
                    <label>Mô tả ngắn:</label>
                    <textarea name="description" rows="3"></textarea>
                </div>
                <div class="form-group">
                    <label>Số lượng thành viên tối đa:</label>
                    <input type="number" name="maxMembers" required min="1" value="50">
                </div>
                <div class="form-group">
                    <label>Trạng thái hoạt động:</label>
                    <select name="status">
                        <option value="Open">Open</option>
                        <option value="Closed">Closed</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-success">Lưu thông tin</button>
            </form>
        </div>
    </body>
</html>