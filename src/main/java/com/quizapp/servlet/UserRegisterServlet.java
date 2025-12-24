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
 
@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
 
        try {
            Connection con = DBConnection.getConnection();
 
            String sql = "INSERT INTO users(name, email, password, role) VALUES (?, ?, ?, 'user')";
            PreparedStatement ps = con.prepareStatement(sql);
 
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
 
            ps.executeUpdate();
 
            response.sendRedirect("user/login.jsp");
 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

 