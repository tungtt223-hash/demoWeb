<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/comon/header.jsp" %>

<h2 class="section-title">🛡️ Trung tâm Kiểm soát & Phê duyệt Thành viên</h2>

<div style="background: white; padding: 15px 25px; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.04); margin-bottom: 25px;">
    <form action="registrations" method="get" style="display:flex; gap:12px; align-items: center;">
        <input type="hidden" name="action" value="searchReg">
        <span style="font-weight: 600; color:#555; white-space: nowrap;">Bộ lọc tìm kiếm:</span>
        <input type="text" name="keyword" value="${param.keyword}" class="form-control" style="width: 400px; margin-bottom:0;" placeholder="Nhập mã sinh viên hoặc mã CLB...">
        <button type="submit" class="btn btn-primary" style="background-color: #222; padding: 10px 25px;">Tìm kiếm</button>
        <a href="registrations?action=list" class="btn" style="background-color: #6c757d;">Reset</a>
    </form>
</div>

<div style="background: white; padding: 25px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.05);">
    <table class="table table-striped" style="vertical-align: middle;">
        <thead>
            <tr>
                <th style="width: 60px;">ID</th>
                <th>Mã Sinh Viên</th>
                <th>Thông tin Câu Lạc Bộ</th>
                <th>Chức vụ ứng tuyển</th>
                <th>Ngày nộp đơn</th>
                <th>Trạng thái</th>
                <th style="text-align: center; width: 180px;">Hành động quản trị</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="r" items="${allRegistrations}">
                <tr>
                    <td><small style="color:#aaa;">#${r.registrationId}</small></td>
                    <td><strong style="color: #007bff; font-size:15px;">${r.studentCode}</strong></td>
                    <td>
                        <strong style="color: #cc0000;">${r.clubCode}</strong> - <span style="font-size: 13px; color: #666;">${r.clubName}</span>
                    </td>
                    <td><span style="font-style: italic;">${r.membershipType}</span></td>
                    <td style="color:#666; font-size:13px;">${r.registrationDate}</td>
                    <td>
                        <c:choose>
                            <c:when test="${r.status == 'Pending'}">
                                <span style="color: #856404; background-color: #fff3cd; padding: 5px 12px; border-radius: 4px; font-weight: bold; font-size: 13px; display: inline-block;">⏳ Đang chờ duyệt</span>
                            </c:when>
                            <c:when test="${r.status == 'Approved'}">
                                <span style="color: #155724; background-color: #d4edda; padding: 5px 12px; border-radius: 4px; font-weight: bold; font-size: 13px; display: inline-block;">✅ Đã đồng ý</span>
                            </c:when>
                            <c:otherwise>
                                <span style="color: #721c24; background-color: #f8d7da; padding: 5px 12px; border-radius: 4px; font-weight: bold; font-size: 13px; display: inline-block;">❌ Từ chối</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td style="text-align: center;">
                        <c:if test="${r.status == 'Pending'}">
                            <div style="display: flex; gap: 6px; justify-content: center;">
                                <form action="registrations" method="post" style="margin:0;">
                                    <input type="hidden" name="action" value="updateStatus">
                                    <input type="hidden" name="registrationId" value="${r.registrationId}">
                                    <input type="hidden" name="status" value="Approved">
                                    <button type="submit" class="btn btn-success" style="padding: 5px 10px; font-size: 12px;">Approve</button>
                                </form>
                                <form action="registrations" method="post" style="margin:0;">
                                    <input type="hidden" name="action" value="updateStatus">
                                    <input type="hidden" name="registrationId" value="${r.registrationId}">
                                    <input type="hidden" name="status" value="Rejected">
                                    <button type="submit" class="btn btn-danger" style="padding: 5px 10px; font-size: 12px;">Reject</button>
                                </form>
                            </div>
                        </c:if>
                        <c:if test="${r.status != 'Pending'}">
                            <span style="color:#aaa; font-size: 13px; font-style: italic;">Hồ sơ đóng</span>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<%@ include file="/WEB-INF/comon/footer.jsp" %>