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
 
@WebServlet("/SubmitQuizServlet")
public class SubmitQuizServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId");
        int quizId = Integer.parseInt(request.getParameter("quiz_id"));
 
        int score = 0;
 
        try {
            Connection con = DBConnection.getConnection();
 
            // Get all questions of this quiz
            String sql = "SELECT q.id, q.answer FROM questions q "
                       + "JOIN quiz_questions qq ON q.id = qq.question_id "
                       + "WHERE qq.quiz_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, quizId);
            ResultSet rs = ps.executeQuery();
 
            while (rs.next()) {
                int qid = rs.getInt("id");
                String correctAnswer = rs.getString("answer");
 
                // User-selected answer
                String userAnswer = request.getParameter("q" + qid);
                
                session.setAttribute("ans_"+ qid,  userAnswer);
 
                if (userAnswer != null && userAnswer.equalsIgnoreCase(correctAnswer)) {
                    score++;
                }
            }
 
            // Insert result into DB
            String insertSql = "INSERT INTO results(user_id, quiz_id, score) VALUES (?, ?, ?)";
            PreparedStatement ps2 = con.prepareStatement(insertSql);
            ps2.setInt(1, userId);
            ps2.setInt(2, quizId);
            ps2.setInt(3, score);
            ps2.executeUpdate();
 
            // Save score in session for result page
            session.setAttribute("latestScore", score);
 
            session.setAttribute("lastQuizId",  quizId);
            response.sendRedirect("user/reviewQuiz.jsp");
 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

 