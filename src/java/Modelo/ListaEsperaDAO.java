/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Conexao.ConectaBanco;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 11141100209
 */
public class ListaEsperaDAO {
    
    
        public void cadastraListaDeEspera(ListaDeEspera espera) throws Exception {
        Connection con = ConectaBanco.getConexao();

        PreparedStatement comando = con.prepareStatement("insert into lista_espera(email,ativo_lista)values(?,?)");
       

        comando.setString(1, espera.getEmail_reserva().getEmail());
        comando.setBoolean(2,espera.getAtivo_lista());
          
        comando.execute();
        
        con.close();

    }
    
    public List<ListaDeEspera> listaDeEspera() throws SQLException, ClassNotFoundException {

        Connection con = ConectaBanco.getConexao();
        PreparedStatement comando = con.prepareStatement("select email from lista_espera where ativo_lista=true");

    

        ResultSet rs = comando.executeQuery();

        List<ListaDeEspera> listaDeEsperas = new ArrayList<ListaDeEspera>();

        while (rs.next()) {
            ListaDeEspera rsss = new ListaDeEspera();
          
            rsss.setEmail(rs.getString("email"));
          
            listaDeEsperas.add(rsss);

        }
        con.close();
        return listaDeEsperas;
    }
    
    public List<ListaDeEspera> HistoricoGeralFila() throws SQLException, ClassNotFoundException {

        Connection con = ConectaBanco.getConexao();
        PreparedStatement comando = con.prepareStatement("select id_lista_reserva, email from lista_espera");

        ResultSet rs = comando.executeQuery();

        List<ListaDeEspera> HistoricoFila = new ArrayList<ListaDeEspera>();

        while (rs.next()) {
            ListaDeEspera rss = new ListaDeEspera();
            rss.setId_lista_reserva(rs.getInt("id_lista_reserva"));
            rss.setEmail(rs.getString("email"));
           
            HistoricoFila.add(rss);

        }	
        con.close();
        return HistoricoFila;
    }
  
  
    
     public void deletaListaDeEspera() throws Exception {

        Connection con = ConectaBanco.getConexao();

        PreparedStatement comando = con.prepareStatement("update lista_espera set ativo_lista ='f'");
        

        comando.execute();

        con.close();

    }
    
    
}
