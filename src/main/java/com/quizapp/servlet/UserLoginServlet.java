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
 
@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        String email = request.getParameter("email");
        String password = request.getParameter("password");
 
        try {
            Connection con = DBConnection.getConnection();
 
            String sql = "SELECT * FROM users WHERE email=? AND password=? AND role='user'";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
 
            ResultSet rs = ps.executeQuery();
 
            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("userName", rs.getString("name"));
                session.setAttribute("userId", rs.getInt("id"));
 
                response.sendRedirect("user/userDashboard.jsp");
            } 
            else {
                response.sendRedirect("user/login.jsp?error=1");
            }
 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

 