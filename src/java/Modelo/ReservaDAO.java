/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Conexao.ConectaBanco;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.StringTokenizer;

/**
 *
 * @author victoralexandre
 */
public class ReservaDAO {

    public List<Reserva> vencimentoHoraReserva() throws SQLException, ClassNotFoundException {

        Connection con = ConectaBanco.getConexao();

        PreparedStatement comando = con.prepareStatement("select * from ( select email, quantidade_pessoa as quantidade_consulta, hora_reserva as hora, nome as nome_reserva,data_reserva  as data_consulta,ativo as reserva_ativa,flag_reserva as reserva_flag_checkin, id_reserva as id_reserva,(hora_reserva - CAST(current_time as time)) as prazo from reserva) prazos where prazo < '00:30:00' and reserva_ativa= true and reserva_flag_checkin= false and data_consulta=current_date");
        ResultSet rs = comando.executeQuery();

        List<Reserva> vencendo = new ArrayList<Reserva>();

        while (rs.next()) {
            Reserva reserva = new Reserva();
            reserva.setId_reserva(rs.getInt("id_reserva"));
            reserva.setHora_reserva(rs.getString("hora"));
            reserva.setNome(rs.getString("nome_reserva"));
            reserva.setAtivo(rs.getBoolean("reserva_ativa"));
            reserva.setEmail(rs.getString("email"));
            reserva.setData_reserva(rs.getDate("data_consulta"));
            reserva.setQuantidade_pessoa(rs.getInt("quantidade_consulta"));
        

            vencendo.add(reserva);

        }
        con.close();
        return vencendo;
    }

    public void cadastraNovaReserva(Reserva reserva) throws SQLException, ClassNotFoundException {
        Connection con = ConectaBanco.getConexao();

        PreparedStatement comando = con.prepareStatement("insert into reserva(nome,email,telefone,data_reserva,hora_reserva,quantidade_pessoa,ativo,flag_reserva,fk_key)values(?,?,?,?,?,?,?,?,?)");

        comando.setString(1, reserva.getNome());
        comando.setString(2, reserva.getEmail());
        comando.setString(3, reserva.getTelefone());
        comando.setDate(4, new java.sql.Date(reserva.getData_reserva().getTime()));

        Date dt = new Date();
        String[] strT = new String[2];
        strT = reserva.getHora_reserva().split(":");
        dt.setHours(Integer.parseInt(strT[0]));
        dt.setMinutes(Integer.parseInt(strT[1]));
        Timestamp tmsT = new Timestamp(dt.getTime());

        comando.setTimestamp(5, tmsT);
        comando.setInt(6, reserva.getQuantidade_pessoa());
        comando.setBoolean(7, reserva.getAtivo());
        comando.setBoolean(8, reserva.getFlag());
        //comando.setInt(8, usuario.getId_usuario());
        comando.setInt(9, reserva.getRes_usu().getId_usuario());

        comando.execute();

        con.close();

    }

    public List<Reserva> listaDeReservas(Reserva reserva) throws SQLException, ClassNotFoundException {

        Connection con = ConectaBanco.getConexao();
        PreparedStatement comando = con.prepareStatement("select id_reserva, nome, email, telefone, data_reserva, hora_reserva, quantidade_pessoa from reserva  where ativo=?");

        comando.setBoolean(1, reserva.getAtivo());

        ResultSet rs = comando.executeQuery();

        List<Reserva> reservas = new ArrayList<Reserva>();

        while (rs.next()) {
            Reserva r = new Reserva();
            r.setId_reserva(rs.getInt("id_reserva"));
            r.setNome(rs.getString("nome"));
            r.setEmail(rs.getString("email"));
            r.setTelefone(rs.getString("telefone"));
            r.setData_reserva(rs.getDate("data_reserva"));
            r.setHora_reserva(String.valueOf(rs.getTime("hora_reserva")));
            r.setQuantidade_pessoa(rs.getInt("quantidade_pessoa"));
            reservas.add(r);

        }
        con.close();
        return reservas;
    }

    public double consultaQuantidadeLugares(Reserva reserva) throws SQLException, ClassNotFoundException {

        Connection con = ConectaBanco.getConexao();
        PreparedStatement comando = con.prepareStatement("select quantidade_pessoa from reserva where data_reserva=? and ativo=?");

        comando.setDate(1, new java.sql.Date(reserva.getData_reserva().getTime()));
        comando.setBoolean(2, reserva.getAtivo());

        ResultSet rs = comando.executeQuery();

        double soma = 0;

        while (rs.next()) {

            soma = soma + rs.getDouble("quantidade_pessoa");
        }

        con.close();
        return soma;
    }

    public void atualizarReserva(Reserva reserva) throws Exception {
        Connection con = ConectaBanco.getConexao();

        PreparedStatement comando = con.prepareStatement("update reserva set nome=?, email=?, telefone=?, data_reserva=?, hora_reserva=?, quantidade_pessoa=?, ativo=? where id_reserva=?");

        comando.setString(1, reserva.getNome());
        comando.setString(2, reserva.getEmail());
        comando.setString(3, reserva.getTelefone());
        comando.setDate(4, new java.sql.Date(reserva.getData_reserva().getTime()));

        Date dt = new Date();
        String[] strT = new String[2];
        strT = reserva.getHora_reserva().split(":");
        dt.setHours(Integer.parseInt(strT[0]));
        dt.setMinutes(Integer.parseInt(strT[1]));
        Timestamp tmsT = new Timestamp(dt.getTime());

        comando.setTimestamp(5, tmsT);
        comando.setInt(6, reserva.getQuantidade_pessoa());
        comando.setBoolean(7, reserva.getAtivo());
        comando.setInt(8, reserva.getId_reserva());

        comando.execute();

        con.close();
    }

    public void deletarReserva(Reserva reserva) throws Exception {

        Connection con = ConectaBanco.getConexao();

        PreparedStatement comando = con.prepareStatement("update reserva set ativo=?,flag_reserva=? where id_reserva=?");
        comando.setBoolean(1, reserva.getAtivo());
        comando.setBoolean(2, reserva.getFlag());
        comando.setInt(3, reserva.getId_reserva());

        comando.execute();

        con.close();

    }

    public void checkinReserva(Reserva reserva) throws Exception {
        Connection con = ConectaBanco.getConexao();

        PreparedStatement comando = con.prepareStatement("update reserva set flag_reserva=? where id_reserva=?");
        comando.setBoolean(1, reserva.getFlag());
        comando.setInt(2, reserva.getId_reserva());

        comando.execute();

        con.close();

    }

    public List<Reserva> reservaPorData(Reserva reserva) throws SQLException, ClassNotFoundException {
        Connection con = ConectaBanco.getConexao();
        PreparedStatement comando = con.prepareStatement("select * from reserva where data_reserva=? and ativo=true");

        comando.setDate(1, new java.sql.Date(reserva.getData_reserva().getTime()));

        ResultSet rs = comando.executeQuery();

        List<Reserva> reservas = new ArrayList<Reserva>();

        while (rs.next()) {
            Reserva r = new Reserva();
            r.setId_reserva(rs.getInt("id_reserva"));
            r.setNome(rs.getString("nome"));
            r.setEmail(rs.getString("email"));
            r.setTelefone(rs.getString("telefone"));
            r.setData_reserva(rs.getDate("data_reserva"));
            r.setHora_reserva(String.valueOf(rs.getTime("hora_reserva")));
            r.setQuantidade_pessoa(rs.getInt("quantidade_pessoa"));
            reservas.add(r);

        }
        con.close();
        return reservas;

    }

    public List<Reserva> consultaPoId(Reserva reserva) throws SQLException, ClassNotFoundException {
        Connection con = ConectaBanco.getConexao();
        PreparedStatement comando = con.prepareStatement("select * from reserva where id_reserva=?");

        comando.setInt(1, reserva.getId_reserva());
        ResultSet rs = comando.executeQuery();

        List<Reserva> reservas = new ArrayList<Reserva>();

        while (rs.next()) {
            Reserva r = new Reserva();
            r.setId_reserva(rs.getInt("id_reserva"));
            r.setNome(rs.getString("nome"));
            r.setEmail(rs.getString("email"));
            r.setTelefone(rs.getString("telefone"));
            r.setData_reserva(rs.getDate("data_reserva"));
            r.setHora_reserva(String.valueOf(rs.getTime("hora_reserva")));
            r.setQuantidade_pessoa(rs.getInt("quantidade_pessoa"));
            reservas.add(r);

        }
        con.close();
        return reservas;

    }

    public List<Reserva> consultaReservasCliente(Reserva reserva) throws SQLException, ClassNotFoundException {
        Connection con = ConectaBanco.getConexao();
        PreparedStatement comando = con.prepareStatement("select * from reserva where ativo =? and fk_key =?");

        comando.setBoolean(1, reserva.getRes_usu().getAtivo());
        comando.setInt(2, reserva.getRes_usu().getId_usuario());

        ResultSet rs = comando.executeQuery();

        List<Reserva> reservasClientes = new ArrayList<Reserva>();

        while (rs.next()) {
            Reserva r = new Reserva();
            r.setId_reserva(rs.getInt("id_reserva"));
            r.setNome(rs.getString("nome"));
            r.setEmail(rs.getString("email"));
            r.setTelefone(rs.getString("telefone"));
            r.setData_reserva(rs.getDate("data_reserva"));
            r.setHora_reserva(String.valueOf(rs.getTime("hora_reserva")));
            r.setQuantidade_pessoa(rs.getInt("quantidade_pessoa"));
            reservasClientes.add(r);

        }
        con.close();
        return reservasClientes;

    }

    public void atualizaStatusReserva(Reserva reserva) throws Exception {

        Connection con = ConectaBanco.getConexao();

        PreparedStatement comando = con.prepareStatement("update reserva set ativo=?,flag_reserva=? where id_reserva=?");
        comando.setBoolean(1, reserva.getAtivo());
        comando.setBoolean(2, reserva.getFlag());
        comando.setInt(3, reserva.getId_reserva());

        comando.execute();

        this.listaDeReservas(reserva);
        con.close();

    }

    public List<Reserva> listaDeReservasGeral() throws SQLException, ClassNotFoundException {

        Connection con = ConectaBanco.getConexao();
        PreparedStatement comando = con.prepareStatement("select id_reserva, nome, email, telefone, data_reserva, hora_reserva, quantidade_pessoa from reserva");

        ResultSet rs = comando.executeQuery();

        List<Reserva> reservas = new ArrayList<Reserva>();

        while (rs.next()) {
            Reserva r = new Reserva();
            r.setId_reserva(rs.getInt("id_reserva"));
            r.setNome(rs.getString("nome"));
            r.setEmail(rs.getString("email"));
            r.setTelefone(rs.getString("telefone"));
            r.setData_reserva(rs.getDate("data_reserva"));
            r.setHora_reserva(String.valueOf(rs.getTime("hora_reserva")));
            r.setQuantidade_pessoa(rs.getInt("quantidade_pessoa"));
            reservas.add(r);

        }
        con.close();
        return reservas;
    }

    public void deletaTodasAsReservasPorUsuario(Reserva reserva) throws Exception {

        Connection con = ConectaBanco.getConexao();

        PreparedStatement comando = con.prepareStatement("update reserva set ativo ='f' where fk_key =?");
        comando.setInt(1, reserva.getRes_usu().getId_usuario());

        comando.execute();

        con.close();

    }
  
}
