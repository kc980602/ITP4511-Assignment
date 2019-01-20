/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import ict.bean.Quiz;
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
public class QuizDB {

    private String dburl = "";
    private String dbUser = "";
    private String dbPassword = "";

    public QuizDB(String dburl, String dbUser, String dbPassword) {
        this.dburl = dburl;
        this.dbUser = dbUser;
        this.dbPassword = dbPassword;
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

    public void createQuizTable() {
        Connection cnnct;
        Statement stmnt = null;

        try {
            cnnct = getConnection();
            stmnt = cnnct.createStatement();
            String sql
                    = "CREATE TABLE IF NOT EXISTS quiz ("
                    + "id           int(11)         NOT NULL AUTO_INCREMENT,"
                    + "name         varchar(255)    NOT NULL,"
                    + "intro        varchar(255)    NULL,"
                    + "timeopen     timestamp       NOT NULL,"
                    + "timeclose    timestamp       NOT NULL,"
                    + "attempts     int(11)         NOT NULL,"
                    + "timelimit    int(11)         NULL,"
                    + "timecreated  timestamp       NOT NULL,"
                    + "status       int(11)         DEFAULT 0 NOT NULL,"
                    + "PRIMARY KEY (id)"
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

    public boolean addQuiz(String name, String intro, Timestamp timeopen, Timestamp timeclose, int attempts, int timelimit, Timestamp timecreated) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "INSERT INTO Quiz (name, intro, timeopen, timeclose, attempts, timelimit, timecreated) VALUES (?, ?, ?, ?, ?, ?, ?)";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, name);
            pStmnt.setString(2, intro);
            pStmnt.setTimestamp(3, timeopen);
            pStmnt.setTimestamp(4, timeclose);
            pStmnt.setInt(5, attempts);
            pStmnt.setInt(6, timelimit);
            pStmnt.setTimestamp(7, timecreated);
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

    public boolean editQuiz(int id, String name, String intro, Timestamp timeopen, Timestamp timeclose, int attempts, int timelimit, int status) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "UPDATE Quiz SET name=?, intro=?, timeopen=?, timeclose=?, attempts=?, timelimit=? , status=? WHERE id=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, name);
            pStmnt.setString(2, intro);
            pStmnt.setTimestamp(3, timeopen);
            pStmnt.setTimestamp(4, timeclose);
            pStmnt.setInt(5, attempts);
            pStmnt.setInt(6, timelimit);
            pStmnt.setInt(7, status);
            pStmnt.setInt(8, id);
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

    public ArrayList<Quiz> getQuizzes() {
        Connection cnnct = null;
        Statement stmnt = null;
        ArrayList<Quiz> quizzes = new ArrayList<>();
        try {
            cnnct = getConnection();
            String queryStatment = "SELECT * FROM Quiz WHERE status !=2";
            stmnt = cnnct.createStatement();
            ResultSet rs = stmnt.executeQuery(queryStatment);
            while (rs.next()) {
                Quiz quiz = new Quiz();
                quiz.setId(rs.getInt(1));
                quiz.setName(rs.getString(2));
                quiz.setIntro(rs.getString(3));
                quiz.setTimeOpen(rs.getTimestamp(4));
                quiz.setTimeClose(rs.getTimestamp(5));
                quiz.setAttempts(rs.getInt(6));
                quiz.setTimeLimit(rs.getInt(7));
                quiz.setTimeCreated(rs.getTimestamp(8));
                quiz.setStatus(rs.getInt(9));
                quizzes.add(quiz);
            }
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
        return quizzes;
    }

    public Quiz getQuiz(int quizId) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        Quiz quiz = null;
        try {
            cnnct = getConnection();
            String preQueryStatment = "SELECT * FROM Quiz WHERE id = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setInt(1, quizId);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                quiz = new Quiz();
                quiz.setId(rs.getInt(1));
                quiz.setName(rs.getString(2));
                quiz.setIntro(rs.getString(3));
                quiz.setTimeOpen(rs.getTimestamp(4));
                quiz.setTimeClose(rs.getTimestamp(5));
                quiz.setAttempts(rs.getInt(6));
                quiz.setTimeLimit(rs.getInt(7));
                quiz.setTimeCreated(rs.getTimestamp(8));
                quiz.setStatus(rs.getInt(9));
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
        return quiz;
    }

    public Quiz getActiveQuiz(int quizId) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        Quiz quiz = null;
        try {
            cnnct = getConnection();
            String preQueryStatment = "SELECT * FROM Quiz WHERE id = ? AND status = 0";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setInt(1, quizId);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                quiz = new Quiz();
                quiz.setId(rs.getInt(1));
                quiz.setName(rs.getString(2));
                quiz.setIntro(rs.getString(3));
                quiz.setTimeOpen(rs.getTimestamp(4));
                quiz.setTimeClose(rs.getTimestamp(5));
                quiz.setAttempts(rs.getInt(6));
                quiz.setTimeLimit(rs.getInt(7));
                quiz.setTimeCreated(rs.getTimestamp(8));
                quiz.setStatus(rs.getInt(9));
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
        return quiz;
    }

    public ArrayList<Quiz> getQuiz(String keyword) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        ArrayList<Quiz> quizzes = new ArrayList<>();
        try {
            cnnct = getConnection();
            String preQueryStatment = "SELECT * FROM Quiz WHERE name LIKE ?";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setString(1, "%" + keyword + "%");
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                Quiz quiz = new Quiz();
                quiz.setId(rs.getInt(1));
                quiz.setName(rs.getString(2));
                quiz.setIntro(rs.getString(3));
                quiz.setTimeOpen(rs.getTimestamp(4));
                quiz.setTimeClose(rs.getTimestamp(5));
                quiz.setAttempts(rs.getInt(6));
                quiz.setTimeLimit(rs.getInt(7));
                quiz.setTimeCreated(rs.getTimestamp(8));
                quiz.setStatus(rs.getInt(9));
                quizzes.add(quiz);
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
        return quizzes;
    }

    public boolean deleteQuiz(int itemId) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "UPDATE Quiz SET status=2 WHERE id=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, itemId);
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

    public int getLatestID() {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        int latestID = 0;
        try {
            cnnct = getConnection();
            String preQueryStatment = "SELECT MAX(id) FROM quiz";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                latestID = rs.getInt(1);
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
        return latestID;
    }

}
