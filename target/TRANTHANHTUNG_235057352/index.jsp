<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/comon/header.jsp" %>

<% if (request.getAttribute("message") != null) {%>
<div style="padding: 15px; background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; border-radius: 5px; margin-bottom: 25px; font-weight: bold;">
    <%= request.getAttribute("message")%>
</div>
<% }%>

<h2 class="section-title">📊 Tổng quan hoạt động hệ thống</h2>

<div class="dashboard-grid">
    <div class="stat-card">
        <h4>Tổng số Câu Lạc Bộ</h4>
        <div class="value">24</div>
        <p class="desc">● 18 CLB đang mở cổng</p>
    </div>
    <div class="stat-card" style="border-left-color: #007bff;">
        <h4>Cố vấn học tập</h4>
        <div class="value">12</div>
        <p class="desc" style="color: #007bff;">● Đã hoàn thành phân công</p>
    </div>
    <div class="stat-card" style="border-left-color: #ffc107;">
        <h4>Đơn đăng ký mới</h4>
        <div class="value">45</div>
        <p class="desc" style="color: #ffc107;">⏳ Cần phê duyệt (Pending)</p>
    </div>
    <div class="stat-card" style="border-left-color: #28a745;">
        <h4>Thành viên chính thức</h4>
        <div class="value">1,250</div>
        <p class="desc">📈 Tăng 12% so với tháng trước</p>
    </div>
</div>

<div style="display: flex; gap: 30px; margin-top: 20px;">
    <div style="flex: 1;" class="card-form">
        <h3 style="color:#cc0000; margin-top:0;">⚡ Thao tác nhanh</h3>
        <p style="color:#666; font-size:14px;">Chọn nhanh các phân hệ chức năng dành cho Quản trị viên và Sinh viên:</p>
        <hr style="border: 0; border-top: 1px solid #eee; margin: 15px 0;">

        <a href="registrations?action=viewAvailable" class="btn btn-success" style="display:block; text-align:center; margin-bottom:12px;">✍️ Đăng ký tham gia CLB mới</a>
        <a href="assignments?action=list" class="btn btn-primary" style="display:block; text-align:center; margin-bottom:12px;">👔 Điều phối & Cập nhật Cố vấn</a>
        <a href="registrations?action=list" class="btn btn-danger" style="display:block; text-align:center;">🛡️ Xét duyệt danh sách thành viên</a>
    </div>

    <div style="flex: 2;" class="card-form">
        <h3 style="color:#cc0000; margin-top:0;">📢 Thông báo từ Phòng Công tác Sinh viên (SALS)</h3>
        <div style="padding: 10px 0; border-bottom: 1px solid #eee;">
            <span style="font-size: 12px; background: #cc0000; color: white; padding: 2px 6px; border-radius: 3px; font-weight: bold;">MỚI</span>
            <strong style="margin-left: 5px; font-size: 15px;">Hạn chót duyệt danh sách thành viên chiến dịch Mùa Hè Xanh</strong>
            <p style="margin: 5px 0 0 0; font-size: 13px; color: #777;">Yêu cầu các Ban chủ nhiệm và Cố vấn CLB hoàn tất danh sách trước ngày 30/06.</p>
        </div>
        <div style="padding: 10px 0; border-bottom: 1px solid #eee;">
            <span style="font-size: 12px; background: #6c757d; color: white; padding: 2px 6px; border-radius: 3px; font-weight: bold;">TIN TỨC</span>
            <strong style="margin-left: 5px; font-size: 15px;">Khen thưởng Câu lạc bộ IT (UEF-IT) đạt thành tích xuất sắc quý II</strong>
            <p style="margin: 5px 0 0 0; font-size: 13px; color: #777;">Chúc mừng CLB IT đã tổ chức thành công cuộc thi lập trình Java công nghệ Web.</p>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/comon/footer.jsp" %>