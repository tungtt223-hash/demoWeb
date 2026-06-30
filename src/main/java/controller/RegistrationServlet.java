package controller;

import dao.RegistrationDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/registrations")
public class RegistrationServlet extends HttpServlet {

    private RegistrationDAO registrationDAO = new RegistrationDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        // Đảm bảo tránh lỗi NullPointerException nếu action bị truyền rỗng
        if (action == null) {
            action = "list";
        }

        if ("viewAvailable".equals(action)) {
            // Sinh viên vào xem danh sách CLB mở để điền đơn đăng ký
            request.setAttribute("availableClubs", registrationDAO.getAvailableClubs());
            request.getRequestDispatcher("/register-club.jsp").forward(request, response);

        } else if ("viewStudentReg".equals(action)) {
            // Sinh viên tra cứu lịch sử đăng ký cá nhân dựa trên MSSV nhập vào
            String studentCode = request.getParameter("studentCode");

            // Tái sử dụng hàm getAllRegistrations để lọc theo đúng MSSV của sinh viên đó
            request.setAttribute("allRegistrations", registrationDAO.getAllRegistrations(studentCode));
            request.setAttribute("isStudentView", true); // Đánh dấu để giao diện biết đây là chế độ xem cá nhân
            request.setAttribute("studentCode", studentCode);

            // Trả về lại giao diện đăng ký nhưng có kèm danh sách kết quả tra cứu ở dưới
            request.setAttribute("availableClubs", registrationDAO.getAvailableClubs());
            request.getRequestDispatcher("/register-club.jsp").forward(request, response);

        } else {
            // Mặc định (action = "list" hoặc quản trị viên tìm kiếm)
            String keyword = request.getParameter("keyword");
            request.setAttribute("allRegistrations", registrationDAO.getAllRegistrations(keyword));
            request.getRequestDispatcher("/manage-registrations.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("register".equals(action)) {
            // Đọc trực tiếp ClubID dạng INT từ Listbox cố định hoặc động trên giao diện
            int clubId = Integer.parseInt(request.getParameter("clubId"));
            String studentCode = request.getParameter("studentCode");
            String membershipType = request.getParameter("membershipType");

            // Gọi xuống tầng DAO xử lý chèn dữ liệu
            String resultMsg = registrationDAO.registerClub(clubId, studentCode, membershipType);
            request.setAttribute("message", resultMsg);

            // Nạp lại danh sách để hiển thị giao diện không bị trống dữ liệu
            request.setAttribute("availableClubs", registrationDAO.getAvailableClubs());
            request.getRequestDispatcher("/register-club.jsp").forward(request, response);
            return; // Ngắt luồng, không chạy xuống dòng sendRedirect ở dưới

        } else if ("updateStatus".equals(action)) {
            // Xử lý phê duyệt (Approve) hoặc từ chối (Reject) của cán bộ quản lý
            int regId = Integer.parseInt(request.getParameter("registrationId"));
            String status = request.getParameter("status");

            registrationDAO.updateStatus(regId, status);
        }

        // Sau khi cập nhật trạng thái đơn, điều hướng làm mới (Refresh) lại trang quản trị
        response.sendRedirect(request.getContextPath() + "/registrations?action=list");
    }
}
