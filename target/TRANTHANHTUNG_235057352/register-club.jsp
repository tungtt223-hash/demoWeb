<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/comon/header.jsp" %>

<h2 class="section-title">📝 Không gian Đăng ký gia nhập Câu lạc bộ</h2>

<c:if test="${not empty message}">
    <div style="padding: 12px 20px; margin-bottom: 25px; border-radius: 6px; background-color: #e2f0d9; color: #385723; border: 1px solid #c5e0b4; font-weight: 600;">
        ${message}
    </div>
</c:if>

<div style="display: flex; gap: 30px; align-items: flex-start;">
    <div style="flex: 1; display: flex; flex-direction: column; gap: 25px;">

        <div class="card-form" style="margin-bottom: 0; width: auto;">
            <h3 style="color: #28a745; margin-top: 0; margin-bottom: 20px; font-size: 18px; border-bottom: 1px solid #eee; padding-bottom: 10px;">
                ✍️ Điền đơn tham gia
            </h3>
            <form action="registrations" method="post">
                <input type="hidden" name="action" value="register">

                <label style="font-weight:600; display:block; margin-bottom:6px;">Mã số sinh viên (MSSV):</label>
                <input type="text" name="studentCode" class="form-control" required placeholder="Ví dụ: 235057352...">

                <label style="font-weight:600; display:block; margin-bottom:6px;">Mã Câu lạc bộ muốn vào:</label>
                <select name="clubId" class="form-control" required>
                    <option value="">-- Chọn Câu lạc bộ tham gia --</option>
                    <option value="1">CLB_IT - Câu lạc bộ Công nghệ thông tin UEF</option>
                    <option value="2">CLB_BA - Câu lạc bộ Quản trị kinh doanh (SBA)</option>
                    <option value="3">CLB_EN - Câu lạc bộ Tiếng Anh (UEF-EC)</option>
                    <option value="4">CLB_ART - Câu lạc bộ Nghệ thuật (UEF-Art)</option>
                </select>

                <label style="font-weight:600; display:block; margin-bottom:6px;">Vai trò ứng tuyển:</label>
                <select name="membershipType" class="form-control">
                    <option value="Member">Thành viên thông thường (Member)</option>
                    <option value="Executive Committee">Ban chấp hành / Cán sự (Executive Committee)</option>
                </select>

                <button type="submit" class="btn btn-success" style="width:100%; padding: 12px; font-size: 15px; margin-top: 5px;">
                    ✉️ Nộp đơn đăng ký ngay
                </button>
            </form>
        </div>

        <div style="background: white; padding: 20px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.05); border-top: 4px solid #007bff;">
            <h3 style="color: #007bff; margin-top: 0; margin-bottom: 15px; font-size: 16px;">🔍 Tra cứu trạng thái đơn cá nhân</h3>
            <form action="registrations" method="get">
                <input type="hidden" name="action" value="viewStudentReg">
                <input type="text" name="studentCode" class="form-control" required placeholder="Nhập MSSV cần kiểm tra..." style="margin-bottom: 12px;">
                <button type="submit" class="btn btn-primary" style="width:100%; font-size: 14px;">Xem lịch sử của tôi</button>
            </form>
        </div>
    </div>

    <div style="flex: 2; background: white; padding: 25px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.05);">
        <h3 style="margin-top: 0; margin-bottom: 20px; font-size: 18px; color: #222;">📢 Các Câu lạc bộ đang nhận thành viên</h3>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th style="width: 90px;">Mã CLB</th>
                    <th>Tên Câu Lạc Bộ</th>
                    <th>Phân loại / Lĩnh vực</th>
                    <th style="width: 130px; text-align: center;">Quy mô giới hạn</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="c" items="${availableClubs}">
                    <tr>
                        <td><strong style="color:#cc0000;">${c.clubCode}</strong></td>
                        <td style="font-weight: 600; color: #333;">${c.clubName}</td>
                        <td><span style="background: #f1f3f5; padding: 4px 10px; border-radius: 20px; font-size: 13px; color: #495057;">${c.membershipType}</span></td>
                        <td style="font-weight: bold; color: #28a745; text-align: center;">${c.registrationId} TV</td>
                    </tr>
                </c:forEach>

                <c:if test="${empty availableClubs}">
                    <tr>
                        <td><strong style="color:#cc0000;">CLB_IT</strong></td>
                        <td style="font-weight: 600;">Câu lạc bộ Công nghệ thông tin UEF (UEF-IT)</td>
                        <td><span style="background: #e3f2fd; color: #0d47a1; padding: 4px 10px; border-radius: 20px; font-size: 13px;">Học thuật & Công nghệ</span></td>
                        <td style="font-weight: bold; color: #28a745; text-align: center;">100 TV</td>
                    </tr>
                    <tr>
                        <td><strong style="color:#cc0000;">CLB_BA</strong></td>
                        <td style="font-weight: 600;">Câu lạc bộ Quản trị kinh doanh (SBA)</td>
                        <td><span style="background: #e3f2fd; color: #0d47a1; padding: 4px 10px; border-radius: 20px; font-size: 13px;">Học thuật</span></td>
                        <td style="font-weight: bold; color: #28a745; text-align: center;">80 TV</td>
                    </tr>
                    <tr>
                        <td><strong style="color:#cc0000;">CLB_EN</strong></td>
                        <td style="font-weight: 600;">Câu lạc bộ Tiếng Anh (UEF-EC)</td>
                        <td><span style="background: #e3f2fd; color: #0d47a1; padding: 4px 10px; border-radius: 20px; font-size: 13px;">Ngoại ngữ</span></td>
                        <td style="font-weight: bold; color: #28a745; text-align: center;">150 TV</td>
                    </tr>
                    <tr>
                        <td><strong style="color:#cc0000;">CLB_ART</strong></td>
                        <td style="font-weight: 600;">Câu lạc bộ Nghệ thuật (UEF-Art)</td>
                        <td><span style="background: #e3f2fd; color: #0d47a1; padding: 4px 10px; border-radius: 20px; font-size: 13px;">Văn thể mỹ</span></td>
                        <td style="font-weight: bold; color: #28a745; text-align: center;">60 TV</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

<%@ include file="/WEB-INF/comon/footer.jsp" %>