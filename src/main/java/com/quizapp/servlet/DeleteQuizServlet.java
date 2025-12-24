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
 
@WebServlet("/DeleteQuizServlet")
public class DeleteQuizServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        int id = Integer.parseInt(request.getParameter("id"));
 
        try {
            Connection con = DBConnection.getConnection();
            String sql = "DELETE FROM quiz WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
 
            // quiz_questions rows auto-deleted because of ON DELETE CASCADE
 
            response.sendRedirect("admin/quizList.jsp");
 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

 