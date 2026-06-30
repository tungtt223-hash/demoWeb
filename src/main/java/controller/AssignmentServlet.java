package controller;

import dao.AssignmentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/assignments")
public class AssignmentServlet extends HttpServlet {

    private AssignmentDAO assignmentDAO = new AssignmentDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("assignmentList", assignmentDAO.getAllAssignments());
        request.getRequestDispatcher("/assign-advisor.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("assign".equals(action)) {
            String clubCode = request.getParameter("clubCode");
            String advisorCode = request.getParameter("advisorCode");

            boolean success = assignmentDAO.assignAdvisor(clubCode, advisorCode);
            if (success) {
                request.setAttribute("message", "✅ Phân công cố vấn thành công!");
            } else {
                request.setAttribute("message", "❌ Thất bại: Mã CLB hoặc Mã Cố vấn không đúng thực tế!");
            }
        }
        doGet(request, response);
    }
}
