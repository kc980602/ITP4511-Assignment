/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import ict.bean.Module;
import ict.bean.Module_sections;
import ict.bean.Module_selection;
import ict.bean.Resources;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author HaYYY
 */
public class ModuleDB {

    private String dburl = "";
    private String dbUser = "";
    private String dbPassword = "";

    public ModuleDB(String dburl, String dbUser, String dbPassword) {
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

    public void createModuleTable() {
        Connection cnnct;
        Statement stmnt = null;

        try {
            cnnct = getConnection();
            stmnt = cnnct.createStatement();
            String sql
                    = "CREATE TABLE IF NOT EXISTS module ("
                    + "id       int(11)         NOT NULL AUTO_INCREMENT,"
                    + "name     varchar(100)    NOT NULL UNIQUE,"
                    + "code     varchar(10)     NOT NULL,"
                    + "status   int(11)         DEFAULT 0 NOT NULL,"
                    + "PRIMARY KEY (id)"
                    + ")";
            stmnt.execute(sql);
            System.out.println("module table created");
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

    public boolean addModule(String name, String code) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "INSERT INTO module (name, code) VALUES (?,?)";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, name);
            pStmnt.setString(2, code);
            int rowCount = pStmnt.executeUpdate();
            if (rowCount >= 1) {
                isSuccess = true;
                System.out.println(code + " is added.");
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

    public Module queryModuleByName(String name) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        Module module = null;
        try {
            cnnct = getConnection();
            String preQueryStatment = "SELECT * FROM module WHERE name = ? AND status = 0";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setString(1, name);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                module = new Module();
                module.setId(rs.getInt(1));
                module.setName(rs.getString(2));
                module.setCode(rs.getString(3));
                module.setStatus(rs.getInt(4));
                System.out.println(rs.getInt(1) + " " + rs.getString(2) + " "
                        + rs.getString(3) + " " + rs.getInt(4));
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
        return module;
    }

    public Module queryModuleByCode(String code) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        Module module = null;
        try {
            cnnct = getConnection();
            String preQueryStatment = "SELECT * FROM module WHERE code LIKE ? AND status = 0";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setString(1, "%" + code + "%");
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                module = new Module();
                module.setId(rs.getInt(1));
                module.setName(rs.getString(2));
                module.setCode(rs.getString(3));
                module.setStatus(rs.getInt(4));
                System.out.println(rs.getInt(1) + " " + rs.getString(2) + " "
                        + rs.getString(3) + " " + rs.getInt(4));
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
        return module;
    }

    public ArrayList<Module> queryModule() {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        ArrayList<Module> modules = new ArrayList();
        try {
            cnnct = getConnection();
            String preQueryStatment = "SELECT * FROM Module WHERE status = 0";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            ResultSet rs = pStmnt.executeQuery();
            while (rs.next()) {
                Module module = new Module();
                module.setId(rs.getInt(1));
                module.setName(rs.getString(2));
                module.setCode(rs.getString(3));
                module.setStatus(rs.getInt(4));
                module.setSection(getSections(rs.getInt(1)));
                module.setAssigned(getAssigned(rs.getInt(1)));
                modules.add(module);
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
        return modules;
    }

    public HashMap queryModuleInHashMap() {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        HashMap modules = new HashMap();
        try {
            cnnct = getConnection();
            String preQueryStatment = "SELECT * FROM Module WHERE status = 0";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            ResultSet rs = pStmnt.executeQuery();
            while (rs.next()) {
                modules.put(rs.getInt(1), rs.getString(2));
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
        return modules;
    }

    private ArrayList<Module_selection> getAssigned(int moduleId) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        ArrayList<Module_selection> assigned = new ArrayList();
        try {
            cnnct = getConnection();
            String preQueryStatment = "SELECT * FROM Module_selections WHERE moduleid = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setInt(1, moduleId);
            ResultSet rs = pStmnt.executeQuery();
            while (rs.next()) {
                Module_selection select = new Module_selection();
                select.setGroupId(rs.getInt(1));
                select.setModuleId(rs.getInt(2));
                assigned.add(select);
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
        return assigned;
    }

    private ArrayList<Module_sections> getSections(int moduleId) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        ArrayList<Module_sections> sections = new ArrayList();
        try {
            cnnct = getConnection();
            String preQueryStatment = "SELECT * FROM Module_sections WHERE module = ? AND status = 0";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setInt(1, moduleId);
            ResultSet rs = pStmnt.executeQuery();
            while (rs.next()) {
                Module_sections section = new Module_sections();
                section.setId(rs.getInt(1));
                section.setModule(rs.getInt(2));
                section.setStatus(rs.getInt(3));
                section.setName(rs.getString(4));
                section.setResources(getResources(rs.getInt(1)));
                sections.add(section);
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
        return sections;
    }

    public Module queryModuleByID(int id) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        Module module = null;
        try {
            cnnct = getConnection();
            String preQueryStatment = "SELECT * FROM module WHERE id = ? AND status = 0";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setInt(1, id);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                module = new Module();
                module.setId(rs.getInt(1));
                module.setName(rs.getString(2));
                module.setCode(rs.getString(3));
                module.setStatus(rs.getInt(4));
                module.setSection(getSections(rs.getInt(1)));
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
        return module;
    }

    private ArrayList<Resources> getResources(int id) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        ArrayList<Resources> resources = new ArrayList();
        try {
            cnnct = getConnection();
            String preQueryStatment = "SELECT * FROM Resources WHERE category = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setInt(1, id);
            ResultSet rs = pStmnt.executeQuery();
            while (rs.next()) {
                Resources res = new Resources();
                res.setId(rs.getInt(1));
                res.setCategory(rs.getInt(2));
                res.setSection(rs.getInt(3));
                res.setStatus(rs.getInt(4));
                res.setName(rs.getString(5));
                res.setFileName(rs.getString(6));
                res.setTimeopen(rs.getTimestamp(7));
                res.setTimeclose(rs.getTimestamp(8));
                resources.add(res);
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
        return resources;
    }

    public boolean removeModule(int id) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "UPDATE Module SET status = 1 WHERE id = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, id);
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

    public boolean addModuleWithAssigned(String name, String code, String[] assigned) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "INSERT INTO module (name, code) VALUES (?,?)";
            pStmnt = cnnct.prepareStatement(preQueryStatement, Statement.RETURN_GENERATED_KEYS);
            pStmnt.setString(1, name);
            pStmnt.setString(2, code);
            int rowCount = pStmnt.executeUpdate();
            ResultSet generatedKeys = pStmnt.getGeneratedKeys();
            if (generatedKeys.next()) {
                assignedUser(generatedKeys.getLong(1), assigned);
            }
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

    private void assignedUser(long id, String[] assigned) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "INSERT INTO module_selections (moduleid, groupid) VALUES (?, ?)";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            for (String assignedTo : assigned) {
                pStmnt.setLong(1, id);
                pStmnt.setInt(2, Integer.parseInt(assignedTo));
                pStmnt.addBatch();
            }
            pStmnt.executeBatch();
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
    }

    private void removeAssigned(int id) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "DELETE FROM module_selections WHERE moduleid = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setLong(1, id);
            pStmnt.executeUpdate();
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
    }

    public void modifyModule(int id, String name, String code, String[] assigned) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "UPDATE module SET name = ?, code = ? WHERE id = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, name);
            pStmnt.setString(2, code);
            pStmnt.setInt(3, id);
            pStmnt.executeUpdate();
            removeAssigned(id);
            if (assigned.length > 0) {
                assignedUser(id, assigned);
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
    }

    public ArrayList<Module> queryModule(String keyword) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        ArrayList<Module> modules = new ArrayList();
        try {
            cnnct = getConnection();
            String preQueryStatment = "SELECT * FROM module WHERE name LIKE ? AND status = 0";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setString(1, "%" + keyword + "%");
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                Module module = new Module();
                module.setId(rs.getInt(1));
                module.setName(rs.getString(2));
                module.setCode(rs.getString(3));
                module.setStatus(rs.getInt(4));
                module.setSection(getSections(rs.getInt(1)));
                module.setAssigned(getAssigned(rs.getInt(1)));
                modules.add(module);
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
        return modules;
    }

    public void addSection(int id, String name) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "INSERT INTO module_sections (module, name) VALUES (?,?)";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, id);
            pStmnt.setString(2, name);
            pStmnt.executeUpdate();
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
    }

    public void editSection(int id, String name) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "UPDATE Module_sections SET name = ? WHERE id = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, name);
            pStmnt.setInt(2, id);
            pStmnt.executeUpdate();
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
    }

    public boolean removeSection(int id) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "UPDATE Module_sections SET status = 1 WHERE id = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, id);
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

    public Module_sections querySectionById(int id) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        Module_sections module = null;
        try {
            cnnct = getConnection();
            String preQueryStatment = "SELECT * FROM module_sections WHERE id = ? AND status = 0";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setInt(1, id);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                module = new Module_sections();
                module.setId(rs.getInt(1));
                module.setName(rs.getString(2));
                module.setStatus(rs.getInt(4));
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
        return module;
    }
}
