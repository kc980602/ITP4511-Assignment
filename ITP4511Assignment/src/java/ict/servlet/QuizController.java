/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import com.mysql.jdbc.StringUtils;
import ict.bean.*;
import ict.db.*;
import java.io.IOException;
import static java.lang.Integer.parseInt;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
@WebServlet(name = "QuizController", urlPatterns = {"/quiz"})
public class QuizController extends HttpServlet {

    private QuizDB quizDb;
    private GroupDB groupDb;
    private UserDB userDb;
    private QuizAssignmentDB qaDb;
    private Quiz_questionDB quizQuestionDb;
    private QuestionDB questionDb;
    public User user;

    @Override
    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        quizDb = new QuizDB(dbUrl, dbUser, dbPassword);
        groupDb = new GroupDB(dbUrl, dbUser, dbPassword);
        userDb = new UserDB(dbUrl, dbUser, dbPassword);
        qaDb = new QuizAssignmentDB(dbUrl, dbUser, dbPassword);
        quizQuestionDb = new Quiz_questionDB(dbUrl, dbUser, dbPassword);
        questionDb = new QuestionDB(dbUrl, dbUser, dbPassword);

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
                    case "view":
                        showQuiz(request, response);
                        break;
                    case "search":
                        showSearch(request, response);
                        break;
                    case "add":
                        addQuiz(request, response);
                        break;
                    case "edit":
                        editQuiz(request, response);
                        break;
                    case "delete":
                        deleteQuiz(request, response);
                        break;
                    case "addQuestion":
                        addQuestion(request, response);
                        break;
                    case "deleteQuestion":
                        deleteQuestion(request, response);
                        break;
                    default:
                        response.sendError(HttpServletResponse.SC_NOT_IMPLEMENTED);
                }
            } else {
                showList(request, response);
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

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (user.getRoles() == 0) {
            ArrayList<Quiz> quizzes = quizDb.getQuizzes();
            ArrayList<User> student = userDb.getAllStudent();
            ArrayList<Groups> groups = groupDb.getAllGroups();
            request.setAttribute("quizList", quizzes);
            request.setAttribute("studentList", student);
            request.setAttribute("groupList", groups);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/portal/quiz.jsp");
            rd.forward(request, response);
        } else {
            response.sendRedirect("main");
        }
    }

    private void showQuiz(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (user.getRoles() == 0) {
            String id = request.getParameter("id");
            if (id != null) {
                Quiz quiz = quizDb.getQuiz(Integer.parseInt(id));
                QuizAssignment qa = qaDb.getQuizAssignment(Integer.parseInt(id));
                request.setAttribute("quiz", quiz);
                request.setAttribute("quizAssignment", qa);
                ArrayList<User> student = userDb.getAllStudent();
                ArrayList<Groups> groups = groupDb.getAllGroups();
                ArrayList<Question> selectedQuestions = quizQuestionDb.queryQuiz_questionByQuizId(Integer.parseInt(id));
                ArrayList<Question> questions = questionDb.getAllQuestion();
                request.setAttribute("studentList", student);
                request.setAttribute("groupList", groups);
                request.setAttribute("selectedQuestionList", selectedQuestions);
                request.setAttribute("questionList", questions);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/portal/quiz_details.jsp");
                rd.forward(request, response);
            } else {
                response.sendRedirect("main");
            }
        } else {
            response.sendRedirect("main");
        }
    }

    private void showSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (user.getRoles() == 0) {
            String keyword = request.getParameter("keyword");
            if (keyword != null) {
                ArrayList<Quiz> quizzes = quizDb.getQuiz(keyword);
                ArrayList<User> student = userDb.getAllStudent();
                ArrayList<Groups> groups = groupDb.getAllGroups();
                request.setAttribute("quizList", quizzes);
                request.setAttribute("studentList", student);
                request.setAttribute("groupList", groups);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/portal/quiz.jsp");
                rd.forward(request, response);
            } else {
                response.sendRedirect("main");
            }
        } else {
            response.sendRedirect("main");
        }
    }

    private void addQuiz(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (user.getRoles() == 0) {
            String action = request.getParameter("action");
            if (action != null) {
                String name = request.getParameter("name");
                String intro = request.getParameter("intro");
                Timestamp startTime = stringToTime(request.getParameter("startTime"));
                Timestamp endTime = stringToTime(request.getParameter("endTime"));
                int attempt = parseInt(request.getParameter("attempt"));
                int timeLimit = parseInt(request.getParameter("timeLimit"));
                String assign = request.getParameter("assign");
                int assignTo;
                if (assign.equals("group")) {
                    assignTo = parseInt(request.getParameter("group_select"));
                } else {
                    assignTo = parseInt(request.getParameter("student_select"));
                }
                Timestamp createdTime = new Timestamp(System.currentTimeMillis());
                quizDb.addQuiz(name, intro, startTime, endTime, attempt, timeLimit, createdTime);
                int quiz = quizDb.getLatestID();
                qaDb.addQuizAssignment(quiz, assign, assignTo);

                response.sendRedirect("quiz?failed=false&message=Quiz added successfully");
            } else {
                response.sendRedirect("main");
            }
        } else {
            response.sendRedirect("main");
        }
    }

    private void editQuiz(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (user.getRoles() == 0) {
            String action = request.getParameter("action");
            if (action != null) {
                int quiz_id = parseInt(request.getParameter("quiz_id"));
                int qa_id = parseInt(request.getParameter("qa_id"));
                String name = request.getParameter("name");
                String intro = request.getParameter("intro");
                Timestamp startTime = stringToTime(request.getParameter("startTime"));
                Timestamp endTime = stringToTime(request.getParameter("endTime"));
                int attempt = parseInt(request.getParameter("attempt"));
                int timeLimit = parseInt(request.getParameter("timeLimit"));
                int status = parseInt(request.getParameter("status"));
                String assign = request.getParameter("assign");
                int assignTo = 0;
                if (assign.equals("group")) {
                    assignTo = parseInt(request.getParameter("group_select"));
                } else {
                    assignTo = parseInt(request.getParameter("student_select"));
                }
                quizDb.editQuiz(quiz_id, name, intro, startTime, endTime, attempt, timeLimit, status);
                qaDb.updateQuizAssignment(qa_id, assign, assignTo);

                response.sendRedirect("quiz?failed=false&message=Quiz edited successfully");
            } else {
                response.sendRedirect("main");
            }
        } else {
            response.sendRedirect("main");
        }
    }

    private void deleteQuiz(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (user.getRoles() == 0) {
            String action = request.getParameter("action");
            if (action != null) {
                int id = parseInt(request.getParameter("id"));
                quizDb.deleteQuiz(id);
                
                response.sendRedirect("quiz?failed=false&message=Quiz deleted successfully");
            } else {
                response.sendRedirect("main");
            }
        } else {
            response.sendRedirect("main");
        }
    }

    private void deleteQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (user.getRoles() == 0) {
            String action = request.getParameter("action");
            if (action != null) {
                int quiz_id = parseInt(request.getParameter("quiz_id"));
                int question_id = parseInt(request.getParameter("question_id"));
                quizQuestionDb.deleteQuestion(quiz_id, question_id);
                Quiz quiz = quizDb.getQuiz(quiz_id);
                QuizAssignment qa = qaDb.getQuizAssignment(quiz_id);
                request.setAttribute("quiz", quiz);
                request.setAttribute("quizAssignment", qa);
                ArrayList<User> student = userDb.getAllStudent();
                ArrayList<Groups> groups = groupDb.getAllGroups();
                ArrayList<Question> selectedQuestions = quizQuestionDb.queryQuiz_questionByQuizId(quiz_id);
                ArrayList<Question> questions = questionDb.getAllQuestion();
                request.setAttribute("studentList", student);
                request.setAttribute("groupList", groups);
                request.setAttribute("selectedQuestionList", selectedQuestions);
                request.setAttribute("questionList", questions);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/portal/quiz_details.jsp");
                rd.forward(request, response);
            } else {
                response.sendRedirect("main");
            }
        } else {
            response.sendRedirect("main");
        }
    }

    private Timestamp stringToTime(String s) {
        s = s.replace("T", " ");
        try {
            return Timestamp.valueOf(s);
        } catch (Exception e) {
            s += ":00";
            return Timestamp.valueOf(s);
        }
    }

    private void addQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (user.getRoles() == 0) {
            String id = request.getParameter("quiz_id");
            if (id != null) {
                int question_id = parseInt(request.getParameter("question_select"));
                quizQuestionDb.addQuiz_question(Integer.parseInt(id), question_id);
                Quiz quiz = quizDb.getQuiz(Integer.parseInt(id));
                QuizAssignment qa = qaDb.getQuizAssignment(Integer.parseInt(id));
                request.setAttribute("quiz", quiz);
                request.setAttribute("quizAssignment", qa);
                ArrayList<User> student = userDb.getAllStudent();
                ArrayList<Groups> groups = groupDb.getAllGroups();
                ArrayList<Question> selectedQuestions = quizQuestionDb.queryQuiz_questionByQuizId(Integer.parseInt(id));
                ArrayList<Question> questions = questionDb.getAllQuestion();
                request.setAttribute("studentList", student);
                request.setAttribute("groupList", groups);
                request.setAttribute("selectedQuestionList", selectedQuestions);
                request.setAttribute("questionList", questions);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/portal/quiz_details.jsp");
                rd.forward(request, response);
            } else {
                response.sendRedirect("main");
            }
        } else {
            response.sendRedirect("main");
        }
    }

}
