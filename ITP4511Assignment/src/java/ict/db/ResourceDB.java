/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import ict.bean.Module;
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

/**
 *
 * @author PokeGuys
 */
public class ResourceDB {
    private String dburl = "";
    private String dbUser = "";
    private String dbPassword = "";

    public ResourceDB(String dburl, String dbUser, String dbPassword) {
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
    
    public boolean createMaterial(int category, int section, String name, String fileName) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "INSERT INTO Resources (category, section, name, fileName) VALUES (?, ?, ?, ?)";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, category);
            pStmnt.setInt(2, section);
            pStmnt.setString(3, name);
            pStmnt.setString(4, fileName);
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
    
    public boolean createRestrictedMaterial(int category, int section, String name, String fileName, Timestamp timeopen, Timestamp timeclose) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "INSERT INTO Resources (category, section, name, fileName, timeopen, timeclose) VALUES (?, ?, ?, ?, ?, ?)";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, category);
            pStmnt.setInt(2, section);
            pStmnt.setString(3, name);
            pStmnt.setString(4, fileName);
            pStmnt.setTimestamp(5, timeopen);
            pStmnt.setTimestamp(6, timeclose);
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
    
    public ArrayList<Resources> getMaterial() {
        Connection cnnct = null;
        Statement stmnt = null;
        ArrayList<Resources> materials = new ArrayList<>();
        try {
            cnnct = getConnection();
            String queryStatment = "SELECT * FROM Resources WHERE status = 0";
            stmnt = cnnct.createStatement();
            ResultSet rs = stmnt.executeQuery(queryStatment);
            while (rs.next()) {
                Resources material = new Resources();
                material.setId(rs.getInt(1));
                material.setCategory(rs.getInt(2));
                material.setSection(rs.getInt(3));
                material.setStatus(rs.getInt(4));
                material.setName(rs.getString(5));
                material.setFileName(rs.getString(6));
                material.setTimeopen(rs.getTimestamp(7));
                material.setTimeclose(rs.getTimestamp(8));
                material.setModule(getModuleDetail(rs.getInt(2)));
                materials.add(material);
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
        return materials;
    }
    
    public ArrayList<Resources> getMaterial(String keyword) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        ArrayList<Resources> materials = new ArrayList<>();
        try {
            cnnct = getConnection();
            String preQueryStatment = "SELECT * FROM Resources WHERE name LIKE ? AND status = 0";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setString(1, "%" + keyword + "%");
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                Resources material = new Resources();
                material.setId(rs.getInt(1));
                material.setCategory(rs.getInt(2));
                material.setSection(rs.getInt(3));
                material.setStatus(rs.getInt(4));
                material.setName(rs.getString(5));
                material.setFileName(rs.getString(6));
                material.setTimeopen(rs.getTimestamp(7));
                material.setTimeclose(rs.getTimestamp(8));
                material.setModule(getModuleDetail(rs.getInt(2)));
                materials.add(material);
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
        return materials;
    }
    
    public Resources getMaterial(int itemId) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        Resources material = null;
        try {
            cnnct = getConnection();
            String preQueryStatment = "SELECT * FROM Resources WHERE id = ? AND status = 0";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setInt(1, itemId);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                material = new Resources();
                material.setId(rs.getInt(1));
                material.setCategory(rs.getInt(2));
                material.setSection(rs.getInt(3));
                material.setStatus(rs.getInt(4));
                material.setName(rs.getString(5));
                material.setFileName(rs.getString(6));
                material.setTimeopen(rs.getTimestamp(7));
                material.setTimeclose(rs.getTimestamp(8));
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
        return material;
    }
    
    public boolean modifyMaterial(int id, int category, int section, String name, String fileName) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = fileName.equals("") ? "UPDATE Resources SET category = ?, section = ?, name = ? WHERE id = ?" : 
                    "UPDATE Resources SET category = ?, section = ?, name = ?, fileName = ? WHERE id = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, category);
            pStmnt.setInt(2, section);
            pStmnt.setString(3, name);
            if (fileName.equals("")) {
                pStmnt.setInt(4, id);
            } else {
                pStmnt.setString(4, fileName);
                pStmnt.setInt(5, id);
            }
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
    
    public boolean modifyRestrictedMaterial(int id, int category, int section, String name, String fileName, Timestamp timeopen, Timestamp timeclose) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = fileName.equals("") ? "UPDATE Resources SET category = ?, section = ?, name = ?, timeopen = ?, timeclose = ? WHERE id = ?" : 
                    "UPDATE Resources SET category = ?, section = ?, name = ?, timeopen = ?, timeclose = ?, fileName = ? WHERE id = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, category);
            pStmnt.setInt(2, section);
            pStmnt.setString(3, name);
            pStmnt.setTimestamp(4, timeopen);
            pStmnt.setTimestamp(5, timeclose);
            if (fileName.equals("")) {
                pStmnt.setInt(6, id);
            } else {
                pStmnt.setString(6, fileName);
                pStmnt.setInt(7, id);
            }
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
    
    public boolean removeMaterial(int itemId) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "UPDATE Resources SET status = 1 WHERE id = ?";
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

    public void createResourceTable() {
        Connection cnnct;
        Statement stmnt = null;
        
        try {
            cnnct = getConnection();
            stmnt = cnnct.createStatement();
            String sql
                    = "CREATE TABLE IF NOT EXISTS resources ("
                    + "id           int(11)         NOT NULL AUTO_INCREMENT,"
                    + "category     int(11)         NOT NULL,"
                    + "section      int(11)         NOT NULL,"
                    + "status       int(11)         DEFAULT 0 NOT NULL,"
                    + "name         varchar(255)    NOT NULL,"
                    + "fileName     varchar(255)    NOT NULL,"
                    + "timeopen     timestamp       NULL,"
                    + "timeclose    timestamp       NULL,"
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

    private Module getModuleDetail(int id) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        Module module = null;
        try {
            cnnct = getConnection();
            String preQueryStatment = "SELECT * FROM Module WHERE id = ?";
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

    public ArrayList<Resources> getMaterialByModule(int module) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        ArrayList<Resources> materials = new ArrayList<>();
        try {
            cnnct = getConnection();
            String preQueryStatment = "SELECT * FROM Resources WHERE category = ? AND status = 0";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setInt(1, module);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                Resources material = new Resources();
                material.setId(rs.getInt(1));
                material.setCategory(rs.getInt(2));
                material.setSection(rs.getInt(3));
                material.setStatus(rs.getInt(4));
                material.setName(rs.getString(5));
                material.setFileName(rs.getString(6));
                material.setTimeopen(rs.getTimestamp(7));
                material.setTimeclose(rs.getTimestamp(8));
                materials.add(material);
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
        return materials;
    }
}
