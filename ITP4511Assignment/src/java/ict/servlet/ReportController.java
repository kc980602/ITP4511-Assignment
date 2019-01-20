/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.bean.Groups;
import ict.bean.Question;
import ict.bean.Quiz;
import ict.bean.Student_quiz;
import ict.bean.User;
import ict.db.GroupDB;
import ict.db.QuestionDB;
import ict.db.QuizAssignmentDB;
import ict.db.QuizDB;
import ict.db.Quiz_questionDB;
import ict.db.Student_quizDB;
import ict.db.UserDB;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tszch
 */
@WebServlet(name = "ReportController", urlPatterns = {"/report"})
public class ReportController extends HttpServlet {

    private QuizDB quizDb;
    private GroupDB groupDb;
    private UserDB userDb;
    private Student_quizDB sqDb;
    private Quiz_questionDB quizQuestionDb;
    public User user;

    @Override
    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        quizDb = new QuizDB(dbUrl, dbUser, dbPassword);
        groupDb = new GroupDB(dbUrl, dbUser, dbPassword);
        userDb = new UserDB(dbUrl, dbUser, dbPassword);
        sqDb = new Student_quizDB(dbUrl, dbUser, dbPassword);
        quizQuestionDb = new Quiz_questionDB(dbUrl, dbUser, dbPassword);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (isAuthenticated(request)) {
            HttpSession session = request.getSession();
            user = (User) session.getAttribute("user");
            request.setAttribute("user", user);
            String action;
            if ((action = request.getParameter("action")) != null) {
                switch (action) {
                    case "generate":
                        generateReport(request, response);
                        break;
                    case "view":
                        viewResult(request, response);
                        break;
                    default:
                        response.sendError(HttpServletResponse.SC_NOT_IMPLEMENTED);
                }
            } else {
                showPage(request, response);
            }

        } else {
            response.sendRedirect("login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private boolean isAuthenticated(HttpServletRequest request) {
        boolean result = false;
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            result = true;
        }
        return result;
    }

    private void showPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (user.getRoles() == 0) {
            ArrayList<Quiz> quizzes = quizDb.getQuizzes();
            ArrayList<User> student = userDb.getAllStudent();
            ArrayList<Groups> groups = groupDb.getAllGroups();
            request.setAttribute("quizList", quizzes);
            request.setAttribute("studentList", student);
            request.setAttribute("groupList", groups);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/portal/report.jsp");
            rd.forward(request, response);
        } else if (user.getRoles() == 1) {
            ArrayList<Integer> quizzes = sqDb.getQuizListByStudent(user.getId());
            ArrayList<Quiz> allQuizzes = quizDb.getQuizzes();
            request.setAttribute("quizList", quizzes);
            request.setAttribute("allQuizList", allQuizzes);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/portal/report_student.jsp");
            rd.forward(request, response);
        } else {
            response.sendRedirect("main");
        }
    }

    private void generateReport(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (user.getRoles() == 0) {
            String report_select = request.getParameter("report_select");
            String title = null;
            double average = 0;
            ArrayList<User> maxStudent = new ArrayList();
            ArrayList<User> minStudent = new ArrayList();
            ArrayList<Student_quiz> sqs = new ArrayList();
            if (report_select != null) {
                if (report_select.equals("quiz")) {
                    int quiz_id = Integer.parseInt(request.getParameter("quiz_select"));
                    Quiz q = quizDb.getQuiz(quiz_id);
                    title = q.getName();
                    sqs = sqDb.getResultByQuiz(quiz_id);
                    average = sqDb.getAverageByQuiz(quiz_id);
                    minStudent = sqDb.getMinByQuiz(quiz_id);
                    maxStudent = sqDb.getMaxByQuiz(quiz_id);
                } else if (report_select.equals("group")) {
                    int group_id = Integer.parseInt(request.getParameter("group_select"));
                    Groups g = groupDb.queryGroupById(group_id);
                    title = g.getName();
                    sqs = sqDb.getResultByGroup(group_id);
                    average = sqDb.getAverageByGroup(group_id);
                } else {
                    int student_id = Integer.parseInt(request.getParameter("student_select"));
                    User u = userDb.getUser(student_id);
                    title = u.getFirstname() + " " + u.getLastname();
                    sqs = sqDb.getResultByStudent(student_id);
                    average = sqDb.getAverageByStudent(student_id);
                }
                request.setAttribute("resultList", sqs);
                request.setAttribute("minStudent", minStudent);
                request.setAttribute("maxStudent", maxStudent);
                request.setAttribute("report_select", report_select);
                request.setAttribute("title", title);
                request.setAttribute("average", average);
                ArrayList<User> student = userDb.getAllStudent();
                request.setAttribute("studentList", student);
                ArrayList<Quiz> quizzes = quizDb.getQuizzes();
                request.setAttribute("quizList", quizzes);
                ArrayList<Groups> groups = groupDb.getAllGroups();
                request.setAttribute("groupList", groups);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/portal/generate_report.jsp");
                rd.forward(request, response);
            } else {
                response.sendRedirect("main");
            }
        } else {
            response.sendRedirect("main");
        }
    }

    private void viewResult(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (user.getRoles() == 1) {
            if (request.getParameter("id") != null) {
                int quizId = Integer.parseInt(request.getParameter("id"));
                Quiz quiz = quizDb.getQuiz(quizId);
                ArrayList<Student_quiz> quizList = sqDb.getResultListByQuiz(user.getId(), quizId);
                double average = sqDb.getAverageByStudentForQuiz(user.getId(), quizId);
                double max = sqDb.getMaxByStudentForQuiz(user.getId(), quizId);
                double min = sqDb.getMinByStudentForQuiz(user.getId(), quizId);
                request.setAttribute("quizList", quizList);
                request.setAttribute("quiz", quiz);
                request.setAttribute("user", user);
                request.setAttribute("average", average);
                request.setAttribute("max", max);
                request.setAttribute("min", min);

                RequestDispatcher rd = getServletContext().getRequestDispatcher("/portal/quiz_result.jsp");
                rd.forward(request, response);

            } else {
                response.sendRedirect("report?failed=true&message=Invalid id");
            }
        }
    }
}
