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
 
@WebServlet("/AssignQuestionsServlet")
public class AssignQuestionsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        int quizId = Integer.parseInt(request.getParameter("quiz_id"));
        String[] questionIds = request.getParameterValues("question_ids");
 
        if (questionIds != null) {
            try {
                Connection con = DBConnection.getConnection();
 
                // 1. Insert selected questions into quiz_questions table
                String insertSQL = "INSERT INTO quiz_questions(quiz_id, question_id) VALUES (?, ?)";
                PreparedStatement psInsert = con.prepareStatement(insertSQL);
 
                for (String qid : questionIds) {
                    psInsert.setInt(1, quizId);
                    psInsert.setInt(2, Integer.parseInt(qid));
                    psInsert.executeUpdate();
                }
 
                // 2. Update total questions count inside quiz table
                String updateSQL = "UPDATE quiz SET total_questions = ? WHERE id = ?";
                PreparedStatement psUpdate = con.prepareStatement(updateSQL);
                psUpdate.setInt(1, questionIds.length);
                psUpdate.setInt(2, quizId);
                psUpdate.executeUpdate();
 
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
 
        // 3. Redirect back to quiz list
        response.sendRedirect("admin/quizList.jsp");
    }
}

 