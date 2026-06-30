<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/comon/header.jsp" %>

<h2 class="section-title">👔 Phân công Cố vấn Câu lạc bộ</h2>

<c:if test="${not empty message}">
    <div style="padding: 12px 20px; margin-bottom: 25px; border-radius: 6px; background-color: #fff3cd; color: #856404; border: 1px solid #ffeeba; font-weight: 600;">
        ${message}
    </div>
</c:if>

<div style="display: flex; gap: 30px; align-items: flex-start;">
    <div class="card-form" style="flex: 1; margin-bottom: 0;">
        <h3 style="color: #cc0000; margin-top: 0; margin-bottom: 20px; font-size: 18px; border-bottom: 1px solid #eee; padding-bottom: 10px;">
            🔑 Thiết lập phân công mới
        </h3>
        <form action="assignments" method="post">
            <input type="hidden" name="action" value="assign">

            <div style="margin-bottom: 15px;">
                <label style="font-weight: 600; display: block; margin-bottom: 8px;">Mã Câu lạc bộ (Club Code):</label>
                <input type="text" name="clubCode" class="form-control" required placeholder="Ví dụ: CLB_IT" style="margin-bottom:0;">
            </div>

            <div style="margin-bottom: 20px;">
                <label style="font-weight: 600; display: block; margin-bottom: 8px;">Mã Cố vấn (Advisor ID):</label>
                <input type="text" name="advisorCode" class="form-control" required placeholder="Ví dụ: ADV001" style="margin-bottom:0;">
            </div>

            <button type="submit" class="btn btn-primary" style="width: 100%; padding: 12px; font-size: 15px; background-color: #cc0000;">
                🚀 Xác nhận Phân công
            </button>
        </form>
    </div>

    <div style="flex: 2; background: white; padding: 25px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.05);">
        <h3 style="margin-top: 0; margin-bottom: 20px; font-size: 18px; color: #333;">📋 Danh sách câu lạc bộ đã có cố vấn</h3>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Mã CLB</th>
                    <th>Tên Câu Lạc Bộ</th>
                    <th>Mã Cố Vấn</th>
                    <th>Tên Cố Vấn</th>
                    <th>Ngày phân công</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="asg" items="${assignmentList}">
                    <tr>
                        <td><span style="background: #e3f2fd; color: #0d47a1; padding: 3px 8px; border-radius: 4px; font-weight: bold; font-size: 13px;">${asg.clubCode}</span></td>
                        <td style="font-weight: 500;">${asg.clubName}</td>
                        <td><code>${asg.advisorCode}</code></td>
                        <td style="color: #cc0000; font-weight: bold;">${asg.advisorName}</td>
                        <td style="color: #777; font-size: 13px;">${asg.assignmentDate}</td>
                    </tr>
                </c:forEach>
                <c:if test="${empty assignmentList}">
                    <tr>
                        <td colspan="5" style="text-align: center; color: #999; font-style: italic; padding: 20px;">Chưa có dữ liệu phân công cố vấn nào được thiết lập.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

<%@ include file="/WEB-INF/comon/footer.jsp" %>