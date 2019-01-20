/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import ict.bean.Quiz;
import ict.bean.QuizAssignment;
import ict.bean.Resources;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author tszch
 */
public class QuizAssignmentDB {

    private String dburl = "";
    private String dbUser = "";
    private String dbPassword = "";
    private QuizDB quizDb;

    public QuizAssignmentDB(String dburl, String dbUser, String dbPassword) {
        this.dburl = dburl;
        this.dbUser = dbUser;
        this.dbPassword = dbPassword;
        quizDb = new QuizDB(dburl, dbUser, dbPassword);
    }

    public Connection getConnection() throws SQLException, IOException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(dburl, dbUser, dbPassword);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void createQuizAssignmentTable() {
        Connection cnnct;
        Statement stmnt = null;

        try {
            cnnct = getConnection();
            stmnt = cnnct.createStatement();
            String sql
                    = "CREATE TABLE IF NOT EXISTS Quiz_Assignment ("
                    + "id           int(11)         NOT NULL AUTO_INCREMENT,"
                    + "quiz         int(11)         NOT NULL,"
                    + "type         varchar(255)    NOT NULL,"
                    + "groups       int(11)         NULL,"
                    + "student      int(11)         NULL,"
                    + "PRIMARY KEY (id),"
                    + "FOREIGN KEY (quiz) REFERENCES quiz(id),"
                    + "FOREIGN KEY (groups) REFERENCES groups(id),"
                    + "FOREIGN KEY (student) REFERENCES user(id)"
                    + ")";
            stmnt.execute(sql);
            stmnt.close();
            cnnct.close();
        } catch (SQLException e) {
            while (e != null) {
                e.printStackTrace();
                e = e.getNextException();
            }
        } catch (IOException e) {
            while (e != null) {
                e.printStackTrace();
            }
        }
    }

    public boolean addQuizAssignment(int quiz, String type, int assignTo) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = null;
            if (type.equals("group")) {
                preQueryStatement = "INSERT INTO Quiz_Assignment (quiz, type, groups) VALUES (?, ?, ?)";
            } else {
                preQueryStatement = "INSERT INTO Quiz_Assignment (quiz, type, student) VALUES (?, ?, ?)";
            }
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, quiz);
            pStmnt.setString(2, type);
            pStmnt.setInt(3, assignTo);
            int rowCount = pStmnt.executeUpdate();
            isSuccess = rowCount >= 1;
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return isSuccess;
    }

    public boolean updateQuizAssignment(int id, String type, int assignTo) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = null;
            if (type.equals("group")) {
                preQueryStatement = "UPDATE Quiz_Assignment SET type=?, groups=? , student=NULL WHERE id=?";
            } else {
                preQueryStatement = "UPDATE Quiz_Assignment SET type=?, student=?, groups=NULL WHERE id=?";
            }
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, type);
            pStmnt.setInt(2, assignTo);
            pStmnt.setInt(3, id);
            int rowCount = pStmnt.executeUpdate();
            isSuccess = rowCount >= 1;
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return isSuccess;
    }

    public QuizAssignment getQuizAssignment(int quizID) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        QuizAssignment qa = null;
        try {
            cnnct = getConnection();
            String preQueryStatment = "SELECT * FROM Quiz_Assignment WHERE quiz = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setInt(1, quizID);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                qa = new QuizAssignment();
                qa.setId(rs.getInt(1));
                qa.setQuiz(rs.getInt(2));
                qa.setType(rs.getString(3));
                qa.setGroups(rs.getInt(4));
                qa.setStudent(rs.getInt(5));
            }
            pStmnt.close();
            cnnct.close();
        } catch (SQLException e) {
            while (e != null) {
                e.printStackTrace();
                e = e.getNextException();
            }
        } catch (IOException e) {
            while (e != null) {
                e.printStackTrace();
            }
        }
        return qa;
    }

    public ArrayList<Quiz> getAssignedQuiz(Long studentId) {
        ArrayList<Quiz> quizzes = new ArrayList<Quiz>();
        Quiz quiz = null;
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        try {
            cnnct = getConnection();
            String preQueryStatement
                    = "SELECT * FROM quiz_assignment"
                    + " WHERE student = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setLong(1, studentId);
            ResultSet rs = null;
            pStmnt.execute();
            rs = pStmnt.getResultSet();
            while (rs.next()) {
                quiz = quizDb.getActiveQuiz(rs.getInt(2));
                System.out.println(quiz);
                quizzes.add(quiz);
            }
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return quizzes;
    }
}
