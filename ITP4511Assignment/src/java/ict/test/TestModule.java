/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.test;

import ict.db.ModuleDB;

/**
 *
 * @author HaYYY
 */
public class TestModule {

    public static void main(String[] arg) {
        String url = "jdbc:mysql://localhost:3306/happy_elearning";
        String username = "root";
        String password = "";
        ModuleDB moduleDB = new ModuleDB(url, username, password);
        moduleDB.createModuleTable();
        //moduleDB.addModule("Programming", "IT1000");
        //moduleDB.addModule("Networking", "IT2000");
        moduleDB.queryModuleByName("pro");
        moduleDB.queryModuleByName("wOrk");
        moduleDB.queryModuleByName("mm");
        moduleDB.queryModuleByName("ing"); //return first result
        
        moduleDB.queryModuleByCode("IT1000");
        moduleDB.queryModuleByCode("1000");
        moduleDB.queryModuleByCode("20");
    }
}
