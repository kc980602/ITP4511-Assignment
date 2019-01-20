/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.test;

import ict.bean.Module;
import ict.db.ResourceDB;
import ict.db.ModuleDB;
import java.sql.Timestamp;

/**
 *
 * @author Karasuma Chitose
 */
public class TestResource {

    public static void main(String[] arg) {
        String url = "jdbc:mysql://localhost:3306/happy_elearning";
        String username = "root";
        String password = "";
        ResourceDB resDB = new ResourceDB(url, username, password);
        ModuleDB moduleDB = new ModuleDB(url, username, password);
        resDB.createResourceTable();
        moduleDB.createModuleTable();
        moduleDB.addModule("Programming", "IT1000");
        moduleDB.addModule("Networking", "IT2000");
        Module module = moduleDB.queryModuleByCode("IT1000");
        resDB.createMaterial(module.getId(), 0, "Module Syllabus File", "Module_Syllabus.docx");
        
        Timestamp currentTime = new Timestamp(System.currentTimeMillis());
        Timestamp endTime = new Timestamp(currentTime.getTime() + 3600 * 1000L);
        resDB.createRestrictedMaterial(module.getId(), 0, "Limited Module Syllabus File", "Limited_Module_Syllabus.docx", currentTime, endTime);
    }
    
}
