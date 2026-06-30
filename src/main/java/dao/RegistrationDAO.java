package dao;

import database.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RegistrationDAO {

    // 1. Lấy danh sách các CLB đang mở (Status = 'Open') để nạp vào Listbox đơn đăng ký
    public List<Map<String, Object>> getAvailableClubs() {
        List<Map<String, Object>> list = new ArrayList<>();
        String sql = "SELECT ClubID, ClubCode, ClubName, Category, MaxMembers FROM Clubs WHERE Status = 'Open'";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Map<String, Object> map = new HashMap<>();
                map.put("clubId", rs.getInt("ClubID"));
                map.put("clubCode", rs.getString("ClubCode"));
                map.put("clubName", rs.getString("ClubName"));
                map.put("membershipType", rs.getString("Category")); // Dùng tạm trường hiển thị phân loại
                map.put("registrationId", rs.getInt("MaxMembers"));  // Dùng tạm trường hiển thị số giới hạn
                list.add(map);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // 2. Thêm đơn đăng ký mới (Dựa vào ClubID từ Listbox và StudentCode nhập vào)
    public String registerClub(int clubId, String studentCode, String membershipType) {
        String findStudentSql = "SELECT StudentID FROM Students WHERE StudentCode = ?";
        String insertSql = "INSERT INTO ClubRegistrations (ClubID, StudentID, MembershipType, RegistrationStatus, RegistrationDate) VALUES (?, ?, ?, 'Pending', ?)";

        try (Connection conn = DBConnection.getConnection()) {
            int studentId = -1;

            // Tìm xem sinh viên có tồn tại trong hệ thống chưa
            try (PreparedStatement ps = conn.prepareStatement(findStudentSql)) {
                ps.setString(1, studentCode);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        studentId = rs.getInt("StudentID");
                    }
                }
            }

            if (studentId == -1) {
                return "Mã sinh viên không tồn tại trong hệ thống UEF! Vui lòng kiểm tra lại.";
            }

            // Tiến hành thêm đơn
            try (PreparedStatement ps = conn.prepareStatement(insertSql)) {
                ps.setInt(1, clubId);
                ps.setInt(2, studentId);
                ps.setString(3, membershipType);
                ps.setDate(4, new java.sql.Date(System.currentTimeMillis()));

                if (ps.executeUpdate() > 0) {
                    return "Nộp đơn đăng ký tham gia câu lạc bộ thành công! Vui lòng chờ phê duyệt.";
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return "Lỗi hệ thống: Bạn đã nộp đơn vào câu lạc bộ này trước đó rồi.";
        }
        return "Đăng ký thất bại.";
    }

    // 3. Lấy toàn bộ danh sách đơn đăng ký phục vụ cho trang Quản trị xét duyệt
    public List<Map<String, Object>> getAllRegistrations(String keyword) {
        List<Map<String, Object>> list = new ArrayList<>();
        String sql = "SELECT cr.RegistrationID, s.StudentCode, c.ClubCode, c.ClubName, cr.MembershipType, cr.RegistrationDate, cr.RegistrationStatus "
                + "FROM ClubRegistrations cr "
                + "JOIN Clubs c ON cr.ClubID = c.ClubID "
                + "JOIN Students s ON cr.StudentID = s.StudentID ";

        if (keyword != null && !keyword.trim().isEmpty()) {
            sql += "WHERE s.StudentCode LIKE ? OR c.ClubCode LIKE ? ";
        }
        sql += "ORDER BY cr.RegistrationID DESC";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            if (keyword != null && !keyword.trim().isEmpty()) {
                String k = "%" + keyword.trim() + "%";
                ps.setString(1, k);
                ps.setString(2, k);
            }

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> map = new HashMap<>();
                    map.put("registrationId", rs.getInt("RegistrationID"));
                    map.put("studentCode", rs.getString("StudentCode"));
                    map.put("clubCode", rs.getString("ClubCode"));
                    map.put("clubName", rs.getString("ClubName"));
                    map.put("membershipType", rs.getString("MembershipType"));
                    map.put("registrationDate", rs.getDate("RegistrationDate"));
                    map.put("status", rs.getString("RegistrationStatus"));
                    list.add(map);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // 4. Cập nhật trạng thái Approve / Reject đơn đăng ký
    public boolean updateStatus(int registrationId, String status) {
        String sql = "UPDATE ClubRegistrations SET RegistrationStatus = ? WHERE RegistrationID = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, registrationId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
