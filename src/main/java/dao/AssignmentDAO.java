package dao;

import database.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AssignmentDAO {

    // Lấy danh sách phân công hiển thị lên giao diện (Dùng Map để truyền dữ liệu linh hoạt ra JSP)
    public List<Map<String, Object>> getAllAssignments() {
        List<Map<String, Object>> list = new ArrayList<>();
        String sql = "SELECT c.ClubCode, c.ClubName, a.AdvisorCode, a.FullName, ca.AssignmentDate "
                + "FROM ClubAssignments ca "
                + "JOIN Clubs c ON ca.ClubID = c.ClubID "
                + "JOIN Advisors a ON ca.AdvisorID = a.AdvisorID "
                + "ORDER BY ca.AssignmentDate DESC";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Map<String, Object> map = new HashMap<>();
                map.put("clubCode", rs.getString("ClubCode"));
                map.put("clubName", rs.getString("ClubName"));
                map.put("advisorCode", rs.getString("AdvisorCode"));
                map.put("advisorName", rs.getString("FullName"));
                map.put("assignmentDate", rs.getDate("AssignmentDate"));
                list.add(map);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Thêm phân công mới bằng cách quy đổi từ Code sang ID để lưu đúng ràng buộc FK
    public boolean assignAdvisor(String clubCode, String advisorCode) {
        String findClubSql = "SELECT ClubID FROM Clubs WHERE ClubCode = ?";
        String findAdvisorSql = "SELECT AdvisorID FROM Advisors WHERE AdvisorCode = ?";
        String insertSql = "INSERT INTO ClubAssignments (ClubID, AdvisorID, AssignmentDate) VALUES (?, ?, ?)";

        try (Connection conn = DBConnection.getConnection()) {
            int clubId = -1, advisorId = -1;

            // 1. Tìm ClubID
            try (PreparedStatement ps = conn.prepareStatement(findClubSql)) {
                ps.setString(1, clubCode);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        clubId = rs.getInt("ClubID");
                    }
                }
            }

            // 2. Tìm AdvisorID
            try (PreparedStatement ps = conn.prepareStatement(findAdvisorSql)) {
                ps.setString(1, advisorCode);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        advisorId = rs.getInt("AdvisorID");
                    }
                }
            }

            // 3. Nếu tìm thấy cả 2 thì tiến hành INSERT
            if (clubId != -1 && advisorId != -1) {
                try (PreparedStatement ps = conn.prepareStatement(insertSql)) {
                    ps.setInt(1, clubId);
                    ps.setInt(2, advisorId);
                    ps.setDate(3, new java.sql.Date(System.currentTimeMillis())); // Ngày hiện tại
                    return ps.executeUpdate() > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
