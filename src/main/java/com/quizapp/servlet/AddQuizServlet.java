package com.quizapp.servlet;
 
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import com.quizapp.util.DBConnection;
 
@WebServlet("/AddQuizServlet")
public class AddQuizServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        String title = request.getParameter("title");
        String description = request.getParameter("description");
 
        try {
            Connection con = DBConnection.getConnection();
 
            String sql = "INSERT INTO quiz(title, description) VALUES (?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, description);
 
            ps.executeUpdate();
 
            response.sendRedirect("admin/quizList.jsp");
 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

 