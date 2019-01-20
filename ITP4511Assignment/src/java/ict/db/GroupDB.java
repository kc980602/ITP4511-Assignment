/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import ict.bean.Groups;
import ict.bean.Module;
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
 * @author Kevin
 */
public class GroupDB {

    private String dburl = "";
    private String dbUser = "";
    private String dbPassword = "";

    public GroupDB(String dburl, String dbUser, String dbPassword) {
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

    public void createGroupTable() {
        Connection cnnct;
        Statement stmnt = null;

        try {
            cnnct = getConnection();
            stmnt = cnnct.createStatement();
            String sql
                    = "CREATE TABLE IF NOT EXISTS groups ("
                    + "id int(11) NOT NULL AUTO_INCREMENT,"
                    + "name varchar(255) NOT NULL,"
                    + "description varchar(510) NOT NULL,"
                    + "status int(11) DEFAULT 0 NOT NULL,"
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

    public boolean addGroup(String name, String desc) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "INSERT INTO groups (`name`, `description`) VALUES (?, ?)";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, name);
            pStmnt.setString(2, desc);
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

    public int countRecord() {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        int numOfRecord = 0;
        try {
            cnnct = getConnection();
            String preQueryStatment = preQueryStatment = "SELECT COUNT(*) AS count FROM groups";
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

    public ArrayList<Groups> searchGroup(int page, long id, String name, int status) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        ArrayList<Groups> gbs = new ArrayList();
        try {
            cnnct = getConnection();
            String preQueryStatment;
            String where = " WHERE ";

            where += id != -1 ? "id=" + id : "id!=0";
            if (name != null) {
                where += " AND name LIKE '%" + name + "%'";
            }
            if (status != -1) {
                where += " AND status=" + status;
            }
            preQueryStatment = "SELECT * FROM groups" + where + " LIMIT 10 OFFSET " + String.valueOf(page * 10 - 10);
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

    public boolean editRecord(Groups gb) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatment = "UPDATE groups SET name=?,description=?,status=? WHERE id=?";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setString(1, gb.getName());
            pStmnt.setString(2, gb.getDescription());
            pStmnt.setInt(3, gb.getStatus());
            pStmnt.setLong(4, gb.getId());
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

    
    public ArrayList<Groups> getAllGroups() {
        Connection cnnct = null;
        Statement stmnt = null;
        ArrayList<Groups> groups = new ArrayList<>();
        try {
            cnnct = getConnection();
            String queryStatment = "SELECT * FROM Groups";
            stmnt = cnnct.createStatement();
            ResultSet rs = stmnt.executeQuery(queryStatment);
            while (rs.next()) {
                Groups group = new Groups();
                group.setId(rs.getLong(1));
                group.setName(rs.getString(2));
                group.setDescription(rs.getString(3));
                group.setStatus(rs.getInt(4));
                groups.add(group);
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
        return groups;
    }


    public Groups queryGroupById(int id) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        Groups gb = null;
        try {
            cnnct = getConnection();
            String preQueryStatment = "SELECT * FROM GROUPS WHERE id=?";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setInt(1, id);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                gb = new Groups();
                gb.setId(rs.getLong(1));
                gb.setName(rs.getString(2));
                gb.setDescription(rs.getString(3));
                gb.setStatus(rs.getInt(4));
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
        return gb;
    }

    public ArrayList<User> queryUserByGroup(int groupid) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        ArrayList<User> ubs = new ArrayList();
        try {
            cnnct = getConnection();
            String preQueryStatment;
            preQueryStatment = "SELECT * FROM user t1, groups t2 WHERE t1.usergroup = t2.id AND t1.usergroup = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setInt(1, groupid);
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
    
    public ArrayList<Module> getModules(int groupid) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        ArrayList<Module> moduels = new ArrayList();
        try {
            cnnct = getConnection();
            String preQueryStatment;
            preQueryStatment = "SELECT t2.* FROM module_selections as t1, module as t2 WHERE t2.id = t1.moduleid AND t1.groupid = ? AND t2.status = 0";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setInt(1, groupid);
            ResultSet rs = pStmnt.executeQuery();
            while (rs.next()) {
                Module ub = new Module();
                ub.setId(rs.getInt(1));
                ub.setName(rs.getString(2));
                ub.setCode(rs.getString(3));
                ub.setStatus(rs.getInt(4));
                moduels.add(ub);
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
        return moduels;
    }
}
