/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexao;

/**
 *
 * @author victoralexandre
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConectaBanco {
    
    public static Connection getConexao() throws ClassNotFoundException, SQLException{
        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/pfc","postgres","postgres");
        return con;
        
       
    }
    
    
}



