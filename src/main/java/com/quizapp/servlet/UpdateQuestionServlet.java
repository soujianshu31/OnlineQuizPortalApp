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
 
@WebServlet("/UpdateQuestionServlet")
public class UpdateQuestionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        int id = Integer.parseInt(request.getParameter("id"));
        String question = request.getParameter("question");
        String opt1 = request.getParameter("opt1");
        String opt2 = request.getParameter("opt2");
        String opt3 = request.getParameter("opt3");
        String opt4 = request.getParameter("opt4");
        String answer = request.getParameter("answer");
 
        try {
            Connection con = DBConnection.getConnection();
            String sql = "UPDATE questions SET question=?, option1=?, option2=?, option3=?, option4=?, answer=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
 
            ps.setString(1, question);
            ps.setString(2, opt1);
            ps.setString(3, opt2);
            ps.setString(4, opt3);
            ps.setString(5, opt4);
            ps.setString(6, answer);
            ps.setInt(7, id);
 
            ps.executeUpdate();
 
            response.sendRedirect("admin/questionList.jsp");
 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

 