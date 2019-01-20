/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import ict.bean.Question;
import ict.bean.Student_quiz;
import ict.bean.User;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author HaYYY
 */
public class Student_quizDB {

    private String dburl = "";
    private String dbUser = "";
    private String dbPassword = "";

    public Student_quizDB(String dburl, String dbUser, String dbPassword) {
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

    public void createStudent_QuizTable() {
        Connection cnnct;
        Statement stmnt = null;

        try {
            cnnct = getConnection();
            stmnt = cnnct.createStatement();
            String sql
                    = "CREATE TABLE IF NOT EXISTS student_quiz ("
                    + "id       int(11)     NOT NULL AUTO_INCREMENT,"
                    + "quiz     int(11)     NOT NULL,"
                    + "student  int(11)     NOT NULL,"
                    + "mark     int(11)     NOT NULL,"
                    + "attempt  int(11)     NOT NULL,"
                    + "PRIMARY KEY (id),"
                    + "FOREIGN KEY (quiz) REFERENCES quiz(id),"
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

    public boolean addStudent_Quiz(int quiz, long student, int mark, int attempt) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "INSERT INTO student_quiz (quiz, student, mark, attempt)"
                    + " VALUES (?,?,?,?)";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, quiz);
            pStmnt.setLong(2, student);
            pStmnt.setInt(3, mark);
            pStmnt.setInt(4, attempt);
            int rowCount = pStmnt.executeUpdate();
            if (rowCount >= 1) {
                isSuccess = true;
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
        return isSuccess;
    }

    public ArrayList<Student_quiz> getResultByStudent(long userId) {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        Student_quiz sq = null;
        ArrayList<Student_quiz> sqs = new ArrayList();
        try {
            cnnct = getConnection();
            String preQueryStatement
                    = "SELECT * FROM student_quiz, user"
                    + " WHERE student_quiz.student = user.id"
                    + " AND student_quiz.student = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setLong(1, userId);
            ResultSet rs = null;
            pStmnt.execute();
            rs = pStmnt.getResultSet();
            while (rs.next()) {
                sq = new Student_quiz();
                sq.setId(rs.getInt(1));
                sq.setQuiz(rs.getInt(2));
                sq.setStudent(rs.getInt(3));
                sq.setMark(rs.getInt(4));
                sq.setAttempt(rs.getInt(5));
                sqs.add(sq);
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
        return sqs;
    }

    public ArrayList<Student_quiz> getResultByGroup(int groupId) {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        Student_quiz sq = null;
        ArrayList<Student_quiz> sqs = new ArrayList();
        try {
            cnnct = getConnection();
            String preQueryStatement
                    = "SELECT * FROM student_quiz, user"
                    + " WHERE student_quiz.student = user.id"
                    + " AND user.usergroup = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, groupId);
            ResultSet rs = null;
            pStmnt.execute();
            rs = pStmnt.getResultSet();
            while (rs.next()) {
                sq = new Student_quiz();
                sq.setId(rs.getInt(1));
                sq.setQuiz(rs.getInt(2));
                sq.setStudent(rs.getInt(3));
                sq.setMark(rs.getInt(4));
                sq.setAttempt(rs.getInt(5));
                sqs.add(sq);
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
        return sqs;
    }

    public ArrayList<Student_quiz> getResultByQuiz(int quizId) {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        Student_quiz sq = null;
        ArrayList<Student_quiz> sqs = new ArrayList();
        try {
            cnnct = getConnection();
            String preQueryStatement
                    = "SELECT * FROM student_quiz"
                    + " WHERE quiz=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, quizId);
            ResultSet rs = null;
            pStmnt.execute();
            rs = pStmnt.getResultSet();
            while (rs.next()) {
                sq = new Student_quiz();
                sq.setId(rs.getInt(1));
                sq.setQuiz(rs.getInt(2));
                sq.setStudent(rs.getInt(3));
                sq.setMark(rs.getInt(4));
                sq.setAttempt(rs.getInt(5));
                sqs.add(sq);
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
        return sqs;
    }

    public double getAverageByQuiz(int quizId) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        double average = 0;
        try {
            cnnct = getConnection();
            String preQueryStatement
                    = "SELECT AVG(mark) FROM student_quiz"
                    + " WHERE quiz=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, quizId);
            ResultSet rs = null;
            pStmnt.execute();
            rs = pStmnt.getResultSet();
            while (rs.next()) {
                average = rs.getDouble(1);
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
        return average;
    }

    public double getAverageByStudent(int userId) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        double average = 0;
        try {
            cnnct = getConnection();
            String preQueryStatement
                    = "SELECT AVG(mark) FROM student_quiz"
                    + " WHERE student=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, userId);
            ResultSet rs = null;
            pStmnt.execute();
            rs = pStmnt.getResultSet();
            while (rs.next()) {
                average = rs.getDouble(1);
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
        return average;
    }

    public double getAverageByGroup(int groupId) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        double average = 0;
        try {
            cnnct = getConnection();
            String preQueryStatement
                    = "SELECT AVG(mark) FROM student_quiz, user"
                    + " WHERE student_quiz.student = user.id"
                    + " AND user.usergroup = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, groupId);
            ResultSet rs = null;
            pStmnt.execute();
            rs = pStmnt.getResultSet();
            while (rs.next()) {
                average = rs.getDouble(1);
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
        return average;
    }

    public ArrayList<User> getMaxByQuiz(int quizId) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        ArrayList<User> users = new ArrayList();
        User user = null;
        try {
            cnnct = getConnection();
            String preQueryStatement
                    = "SELECT * FROM student_quiz, user"
                    + " WHERE student_quiz.student = user.id"
                    + " AND student_quiz.quiz = ?"
                    + " AND mark = ( SELECT MAX(mark) FROM student_quiz)";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, quizId);
            ResultSet rs = null;
            pStmnt.execute();
            rs = pStmnt.getResultSet();
            while (rs.next()) {
                user = new User();
                user.setId(rs.getLong(6));
                user.setUsername(rs.getString(7));
                user.setFirstname(rs.getString(9));
                user.setLastname(rs.getString(10));
                user.setRoles(rs.getInt(11));
                user.setStatus(rs.getInt(12));
                user.setGroup(13);
                users.add(user);
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
        return users;
    }

    public ArrayList<Student_quiz> studentAttemptDetails(long studentId, int quizId) {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        Student_quiz sq = null;
        ArrayList<Student_quiz> sqs = new ArrayList();
        try {
            cnnct = getConnection();
            String preQueryStatement
                    = "SELECT * FROM student_quiz"
                    + " WHERE quiz=? AND student=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, quizId);
            pStmnt.setLong(2, studentId);
            ResultSet rs = null;
            pStmnt.execute();
            rs = pStmnt.getResultSet();
            while (rs.next()) {
                sq = new Student_quiz();
                sq.setId(rs.getInt(1));
                sq.setQuiz(rs.getInt(2));
                sq.setStudent(rs.getInt(3));
                sq.setMark(rs.getInt(4));
                sq.setAttempt(rs.getInt(5));
                sqs.add(sq);
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
        return sqs;
    }

    public ArrayList<User> getMinByQuiz(int quizId) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        ArrayList<User> users = new ArrayList();
        User user = null;
        try {
            cnnct = getConnection();
            String preQueryStatement
                    = "SELECT * FROM student_quiz, user"
                    + " WHERE student_quiz.student = user.id"
                    + " AND student_quiz.quiz = ?"
                    + " AND mark = ( SELECT MIN(mark) FROM student_quiz)";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, quizId);
            ResultSet rs = null;
            pStmnt.execute();
            rs = pStmnt.getResultSet();
            while (rs.next()) {
                user = new User();
                user.setId(rs.getLong(6));
                user.setUsername(rs.getString(7));
                user.setFirstname(rs.getString(9));
                user.setLastname(rs.getString(10));
                user.setRoles(rs.getInt(11));
                user.setStatus(rs.getInt(12));
                user.setGroup(13);
                users.add(user);
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
        return users;
    }

    public ArrayList<Integer> getQuizListByStudent(long userId) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        ArrayList<Integer> quizList = new ArrayList();
        try {
            cnnct = getConnection();
            String preQueryStatement
                    = "SELECT DISTINCT quiz FROM student_quiz"
                    + " WHERE student = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setLong(1, userId);
            ResultSet rs = null;
            pStmnt.execute();
            rs = pStmnt.getResultSet();
            while (rs.next()) {
                quizList.add(rs.getInt(1));
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
        return quizList;
    }

    public ArrayList<Student_quiz> getResultListByQuiz(long userId, int quizId) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        ArrayList<Student_quiz> sqs = new ArrayList();
        Student_quiz sq = null;
        try {
            cnnct = getConnection();
            String preQueryStatement
                    = "SELECT * FROM student_quiz"
                    + " WHERE student = ?"
                    + " AND quiz = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setLong(1, userId);
            pStmnt.setInt(2, quizId);
            ResultSet rs = null;
            pStmnt.execute();
            rs = pStmnt.getResultSet();
            while (rs.next()) {
                sq = new Student_quiz();
                sq.setId(rs.getInt(1));
                sq.setQuiz(rs.getInt(2));
                sq.setStudent(rs.getInt(3));
                sq.setMark(rs.getInt(4));
                sq.setAttempt(rs.getInt(5));
                sqs.add(sq);
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
        return sqs;
    }

    public int getNumberAttempt(Long studentId, int quizId) {
        int numberOfAttempt = 0;
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        try {
            cnnct = getConnection();
            String preQueryStatement
                    = "SELECT * FROM student_quiz"
                    + " WHERE student = ? AND quiz = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setLong(1, studentId);
            pStmnt.setInt(2, quizId);
            ResultSet rs = null;
            pStmnt.execute();
            rs = pStmnt.getResultSet();
            while (rs.next()) {
                numberOfAttempt++;
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
        return numberOfAttempt;
    }
    
    public double getAverageByStudentForQuiz(long userId, int quizId) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        double average = 0;
        try {
            cnnct = getConnection();
            String preQueryStatement
                    = "SELECT AVG(mark) FROM student_quiz"
                    + " WHERE student=?"
                    + " AND quiz =?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setLong(1, userId);
            pStmnt.setInt(2, quizId);
            ResultSet rs = null;
            pStmnt.execute();
            rs = pStmnt.getResultSet();
            while (rs.next()) {
                average = rs.getDouble(1);
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
        return average;
    }
    
    public double getMaxByStudentForQuiz(long userId, int quizId) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        double max = 0;
        try {
            cnnct = getConnection();
            String preQueryStatement
                    = "SELECT MAX(mark) FROM student_quiz"
                    + " WHERE student=?"
                    + " AND quiz =?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setLong(1, userId);
            pStmnt.setInt(2, quizId);
            ResultSet rs = null;
            pStmnt.execute();
            rs = pStmnt.getResultSet();
            while (rs.next()) {
                max = rs.getDouble(1);
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
        return max;
    }
    
    public double getMinByStudentForQuiz(long userId, int quizId) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        double min = 0;
        try {
            cnnct = getConnection();
            String preQueryStatement
                    = "SELECT MIN(mark) FROM student_quiz"
                    + " WHERE student=?"
                    + " AND quiz =?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setLong(1, userId);
            pStmnt.setInt(2, quizId);
            ResultSet rs = null;
            pStmnt.execute();
            rs = pStmnt.getResultSet();
            while (rs.next()) {
                min = rs.getDouble(1);
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
        return min;
    }
}
