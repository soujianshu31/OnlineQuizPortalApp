package com.quizapp.servlet;
 
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
import com.quizapp.util.DBConnection;
 
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        String email = request.getParameter("email");
        String password = request.getParameter("password");
 
        try {
            Connection con = DBConnection.getConnection();
 
            String sql = "SELECT * FROM users WHERE email=? AND password=? AND role='admin'";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
 
            ResultSet rs = ps.executeQuery();
 
            if (rs.next()) {
                // Login success
                HttpSession session = request.getSession();
                session.setAttribute("adminName", rs.getString("name"));
 
                response.sendRedirect("admin/dashboard.jsp");
            } else {
                // Login failed
                response.sendRedirect("admin/admin.jsp?error=1");
            }
 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

 