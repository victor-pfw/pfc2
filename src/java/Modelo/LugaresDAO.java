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
 * @author victoralexandre
 */
public class LugaresDAO {

    public void atualizaQuantidadeLugares(Lugares lugares) throws SQLException, ClassNotFoundException {
        Connection con = ConectaBanco.getConexao();

        PreparedStatement comando = con.prepareStatement("update lugares  set quantidade=? where data_disponiveis =?");

        comando.setInt(1, lugares.getQuantidade());
        comando.setDate(2, new java.sql.Date(lugares.getData_disponiveis().getTime()));
        

        comando.execute();
        con.close();
    }
   
    public double quantidadeLugares(Lugares lugares) throws SQLException, ClassNotFoundException {
        Connection con = ConectaBanco.getConexao();
        PreparedStatement comando = con.prepareStatement("select quantidade from lugares where data_disponiveis =?");
        
        comando.setDate(1, new java.sql.Date(lugares.getData_disponiveis().getTime()));
        
        ResultSet rs = comando.executeQuery();

        double soma = 0;

        while (rs.next()) {

            soma = rs.getDouble("quantidade");
        }

        con.close();
        return soma;
    }

    public List<Lugares> listaLugares(Lugares lugares) throws SQLException, ClassNotFoundException {
        Connection con = ConectaBanco.getConexao();
        PreparedStatement comando = con.prepareStatement("select quantidade from lugares where data_disponiveis =?");

        comando.setDate(1, new java.sql.Date(lugares.getData_disponiveis().getTime()));

        ResultSet rs = comando.executeQuery();

        List<Lugares> todosLugares = new ArrayList<Lugares>();

        while (rs.next()) {
            Lugares r = new Lugares();
            r.setQuantidade(rs.getInt("quantidade"));
            todosLugares.add(r);

        }
        con.close();
        return todosLugares;
    }

    public List<Lugares> LugaresDisponiveisPorData(Lugares lugares) throws SQLException, ClassNotFoundException {
        Connection con = ConectaBanco.getConexao();
        PreparedStatement comando = con.prepareStatement("select quantidade from lugares where data_disponiveis =?");

        comando.setDate(1, new java.sql.Date(lugares.getData_disponiveis().getTime()));

        ResultSet rs = comando.executeQuery();

        List<Lugares> lugaresDisponiveis = new ArrayList<Lugares>();

        while (rs.next()) {
            Lugares l = new Lugares();
            l.setQuantidade(rs.getInt("quantidade"));

            lugaresDisponiveis.add(l);

        }
        con.close();
        return lugaresDisponiveis;
    }
    
     public List<Lugares> listaDataExistente(Lugares lugares) throws SQLException, ClassNotFoundException {
        Connection con = ConectaBanco.getConexao();
        PreparedStatement comando = con.prepareStatement("select data_disponiveis from lugares where data_disponiveis =?");

        comando.setDate(1, new java.sql.Date(lugares.getData_disponiveis().getTime()));

        ResultSet rs = comando.executeQuery();

        List<Lugares> dataExiste = new ArrayList<Lugares>();

        while (rs.next()) {
            Lugares r = new Lugares();
            r.setData_disponiveis(rs.getDate("data_disponiveis"));
            dataExiste.add(r);

        }
        con.close();
        return dataExiste;
    }
     
     public void cadastraNovaDataParaLugares(Lugares lugares) throws SQLException, ClassNotFoundException {
        Connection con = ConectaBanco.getConexao();

        PreparedStatement comando = con.prepareStatement("insert into lugares(quantidade,data_disponiveis)values(?,?)");

        comando.setInt(1,lugares.getQuantidade());
        comando.setDate(2, new java.sql.Date(lugares.getData_disponiveis().getTime()));
     
        comando.execute();

        con.close();

    }
    
}
