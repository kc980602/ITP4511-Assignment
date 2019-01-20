package ict.db;

import ict.bean.Groups;
import ict.bean.Quiz;
import ict.bean.User;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class UserDB {

    private String dburl = "";
    private String dbUser = "";
    private String dbPassword = "";

    public UserDB(String dburl, String dbUser, String dbPassword) {
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

    public void createUserTable() {
        Connection cnnct;
        Statement stmnt = null;

        try {
            cnnct = getConnection();
            stmnt = cnnct.createStatement();
            String sql
                    = "CREATE TABLE IF NOT EXISTS user ("
                    + "id int(11) NOT NULL AUTO_INCREMENT,"
                    + "username varchar(100) NOT NULL UNIQUE,"
                    + "password varchar(255) NOT NULL,"
                    + "firstname varchar(100) NOT NULL,"
                    + "lastname varchar(255) NOT NULL,"
                    + "roles int(11) NOT NULL,"
                    + "status int(11) DEFAULT 0 NOT NULL,"
                    + "usergroup int(11) DEFAULT 0 NULL,"
                    + "PRIMARY KEY (id),"
                    + "FOREIGN KEY (usergroup) REFERENCES groups(id)"
                    + ")";
            stmnt.execute(sql);
            System.out.println("user table created");
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

    public boolean addUser(String username, String fname, String lname, int roles, int usergroup) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "INSERT INTO USER (`username`, `password`, `firstname`, `lastname`, `roles`, `usergroup`) VALUES (?, ?, ?, ?, ?, ?)";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, username);
            pStmnt.setString(2, username);
            pStmnt.setString(3, fname);
            pStmnt.setString(4, lname);
            pStmnt.setInt(5, roles);
            pStmnt.setInt(6, usergroup);
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

    public boolean isValidUser(String username, String pwd) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isValid = false;
        try {
            cnnct = getConnection();
            String preQueryStaement = "SELECT * FROM USER WHERE username=? and password=?";
            pStmnt = cnnct.prepareStatement(preQueryStaement);
            pStmnt.setString(1, username);
            pStmnt.setString(2, pwd);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                isValid = true;
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
        return isValid;
    }

    public User queryCustByName(String username) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        User ub = null;
        try {
            cnnct = getConnection();
            String preQueryStatment = "SELECT * FROM USER WHERE username=?";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setString(1, username);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                ub = new User();
                ub.setId(rs.getLong(1));
                ub.setUsername(rs.getString(2));
                ub.setFirstname(rs.getString(4));
                ub.setLastname(rs.getString(5));
                ub.setRoles(rs.getInt(6));
                ub.setStatus(rs.getInt(7));
                ub.setGroup(rs.getInt(8));
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
        return ub;
    }

    public ArrayList<User> queryUser(int page) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        ArrayList<User> ubs = new ArrayList();
        try {
            cnnct = getConnection();
            String preQueryStatment;
            if (page == 0) {
                preQueryStatment = "SELECT * FROM User";
            } else {
                preQueryStatment = "SELECT * FROM User LIMIT 10 OFFSET " + String.valueOf(page * 10 - 10);
            }
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            ResultSet rs = pStmnt.executeQuery();
            while (rs.next()) {
                User ub = new User();
                ub.setId(rs.getLong(1));
                ub.setUsername(rs.getString(2));
                ub.setFirstname(rs.getString(4));
                ub.setLastname(rs.getString(5));
                ub.setRoles(rs.getInt(6));
                ub.setStatus(rs.getInt(7));
                ub.setGroup(rs.getInt(8));
                ubs.add(ub);
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
        return ubs;
    }

    public int countRecord() {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        int numOfRecord = 0;
        try {
            cnnct = getConnection();
            String preQueryStatment = preQueryStatment = "SELECT COUNT(*) AS count FROM User";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            ResultSet rs = pStmnt.executeQuery();
            if (rs.next()) {
                numOfRecord = rs.getInt("count");
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
        return numOfRecord;
    }

    public ArrayList<User> searchUser(int page, long id, String username, String fname, String lname, int roles, int status, int group) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        ArrayList<User> ubs = new ArrayList();
        try {
            cnnct = getConnection();
            String preQueryStatment;
            String where = " WHERE ";

            where += id != -1 ? "id=" + id : "id!=0";
            if (username != null) {
                where += " AND username LIKE '%" + username + "%'";
            }
            if (fname != null) {
                where += " AND firstname LIKE '%" + fname + "%'";
            }
            if (lname != null) {
                where += " AND lastname LIKE '%" + lname + "%'";
            }
            if (roles != -1) {
                where += " AND roles=" + roles;
            }
            if (status != -1) {
                where += " AND status=" + status;
            }
            if (status != 0) {
                where += " AND usergroup=" + group;
            }
            preQueryStatment = "SELECT * FROM User" + where + " LIMIT 10 OFFSET " + String.valueOf(page * 10 - 10);
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            ResultSet rs = pStmnt.executeQuery();
            while (rs.next()) {
                User ub = new User();
                ub.setId(rs.getLong(1));
                ub.setUsername(rs.getString(2));
                ub.setFirstname(rs.getString(4));
                ub.setLastname(rs.getString(5));
                ub.setRoles(rs.getInt(6));
                ub.setStatus(rs.getInt(7));
                ub.setGroup(rs.getInt(8));
                ubs.add(ub);
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
        return ubs;
    }

    public boolean editRecord(User ub) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatment = "UPDATE USER SET username=?,firstname=?,lastname=?,roles=?,status=?,usergroup=? WHERE id=?";
            if (ub.getPassword().equals("reset")) {
                preQueryStatment = "UPDATE USER SET username=?,password=" + ub.getUsername() + ",firstname=?,lastname=?,roles=?,status=?,usergroup=? WHERE id=?";
            }
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setString(1, ub.getUsername());
            pStmnt.setString(2, ub.getFirstname());
            pStmnt.setString(3, ub.getLastname());
            pStmnt.setInt(4, ub.getRoles());
            pStmnt.setInt(5, ub.getStatus());
            pStmnt.setInt(6, ub.getGroup());
            pStmnt.setLong(7, ub.getId());
            int rowCount = pStmnt.executeUpdate();
            if (rowCount >= 1) {
                isSuccess = true;
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
        return isSuccess;
    }
    
    public boolean editProfile(User user, boolean reset) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatment = "UPDATE USER SET firstname=?,lastname=? WHERE id=?";
            if (reset) {
                preQueryStatment = "UPDATE USER SET firstname=?,lastname=?,password=? WHERE id=?";
            }
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setString(1, user.getFirstname());
            pStmnt.setString(2, user.getLastname());
            if (reset) {
                pStmnt.setString(3, user.getPassword());
                pStmnt.setLong(4, user.getId());
            } else {
                pStmnt.setLong(3, user.getId());
            }
            int rowCount = pStmnt.executeUpdate();
            isSuccess = rowCount >= 1;
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
        return isSuccess;
    }

    public ArrayList<Groups> queryGroup(int page) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        ArrayList<Groups> gbs = new ArrayList();
        try {
            cnnct = getConnection();
            String preQueryStatment;
            if (page == 0) {
                preQueryStatment = "SELECT * FROM groups";
            } else {
                preQueryStatment = "SELECT * FROM groups LIMIT 10 OFFSET " + String.valueOf(page * 10 - 10);
            }
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            ResultSet rs = pStmnt.executeQuery();
            while (rs.next()) {
                Groups gb = new Groups();
                gb.setId(rs.getLong(1));
                gb.setName(rs.getString(2));
                gb.setDescription(rs.getString(3));
                gb.setStatus(rs.getInt(4));
                gbs.add(gb);
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
        return gbs;
    }
    
    public ArrayList<User> getAllStudent() {
        Connection cnnct = null;
        Statement stmnt = null;
        ArrayList<User> users = new ArrayList<>();
        try {
            cnnct = getConnection();
            String queryStatment = "SELECT * FROM User WHERE roles=1";
            stmnt = cnnct.createStatement();
            ResultSet rs = stmnt.executeQuery(queryStatment);
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getLong(1));
                user.setUsername(rs.getString(2));
                user.setFirstname(rs.getString(4));
                user.setLastname(rs.getString(5));
                user.setRoles(rs.getInt(6));
                user.setStatus(rs.getInt(7));
                users.add(user);
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
        return users;
    }
    
    public User getUser(int userId) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        User user = null;
        try {
            cnnct = getConnection();
            String preQueryStatment = "SELECT * FROM User WHERE id = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setInt(1, userId);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getLong(1));
                user.setUsername(rs.getString(2));
                user.setFirstname(rs.getString(4));
                user.setLastname(rs.getString(5));
                user.setRoles(rs.getInt(6));
                user.setStatus(rs.getInt(7));
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
        return user;
    }

}
