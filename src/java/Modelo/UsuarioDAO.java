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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author victoralexandre
 */
public class UsuarioDAO {

    public void cadastraNovoUsuario(Usuario usuario) throws SQLException, ClassNotFoundException {
        Connection con = ConectaBanco.getConexao();

        PreparedStatement comando = con.prepareStatement("insert into usuario(email,login,senha,perfil,ativo)values(?,?,?,?,?)");

        comando.setString(1, usuario.getEmail());
        comando.setString(2, usuario.getLogin());
        comando.setString(3, usuario.getSenha());
        comando.setString(4, usuario.getPerfil().toString());
        comando.setBoolean(5, usuario.getAtivo());
        comando.execute();

        con.close();

    }

    public void cadastraNovoCliente(Usuario cliente) throws SQLException, ClassNotFoundException {
        Connection con = ConectaBanco.getConexao();

        PreparedStatement comando = con.prepareStatement("insert into usuario(email,login,senha,perfil,ativo)values(?,?,?,?,?)");

        comando.setString(1, cliente.getEmail());
        comando.setString(2, cliente.getLogin());
        comando.setString(3, cliente.getSenha());
        comando.setString(4, cliente.getPerfil().toString());
        comando.setBoolean(5, cliente.getAtivo());
        comando.execute();

        con.close();
    }

    public Usuario autenticaUsuario(Usuario usuario) throws ClassNotFoundException, SQLException {

        Connection con = ConectaBanco.getConexao();

        PreparedStatement comando = con.prepareStatement("select * from usuario where login=? and senha =? and ativo = 't'");
        Usuario usuarioAutenticado = null;

        comando.setString(1, usuario.getLogin());
        comando.setString(2, usuario.getSenha());
        ResultSet resultado = comando.executeQuery();

        if (resultado.next()) {
            usuarioAutenticado = new Usuario();
            usuarioAutenticado.setLogin(resultado.getString("login"));
            usuarioAutenticado.setSenha(resultado.getString("senha"));
            usuarioAutenticado.setPerfil(PerfilDeAcesso.valueOf(resultado.getString("perfil")));
            usuarioAutenticado.setEmail(resultado.getString("email"));
            usuarioAutenticado.setId_usuario(resultado.getInt("id_usuario"));

        }
        con.close();
        return usuarioAutenticado;
    }

    public List<Usuario> listaDeUsuarios(Usuario usuario) throws SQLException, ClassNotFoundException {

        Connection con = ConectaBanco.getConexao();
        PreparedStatement comando = con.prepareStatement("select id_usuario, email, login  from usuario where ativo=?");

        comando.setBoolean(1, usuario.getAtivo());

        ResultSet rs = comando.executeQuery();

        List<Usuario> usuarioLista = new ArrayList<Usuario>();

        while (rs.next()) {
            Usuario r = new Usuario();
            r.setId_usuario(rs.getInt("id_usuario"));
            r.setEmail(rs.getString("email"));
            r.setLogin(rs.getString("login"));

            usuarioLista.add(r);

        }
        con.close();
        return usuarioLista;

    }

    public void atualizarUsuario(Usuario usuario) throws Exception {
        Connection con = ConectaBanco.getConexao();

        PreparedStatement comando = con.prepareStatement("update usuario  set email=?, login=?, senha=?, perfil=?, ativo=? where id_usuario=?");

        comando.setString(1, usuario.getEmail());
        comando.setString(2, usuario.getLogin());
        comando.setString(3, usuario.getSenha());
        comando.setString(4, usuario.getPerfil().toString());
        comando.setBoolean(5, usuario.getAtivo());

        comando.setInt(6, usuario.getId_usuario());


        comando.execute();

        con.close();
    }

    public List<Usuario> consultaPoId(Usuario usuario) throws SQLException, ClassNotFoundException {
        Connection con = ConectaBanco.getConexao();
        PreparedStatement comando = con.prepareStatement("select * from usuario where id_usuario=?");

        comando.setInt(1, usuario.getId_usuario());
        ResultSet rs = comando.executeQuery();

        List<Usuario> usuarioPorId = new ArrayList<Usuario>();

        while (rs.next()) {
            Usuario u = new Usuario();
            u.setId_usuario(rs.getInt("id_usuario"));
            u.setEmail(rs.getString("email"));
            u.setLogin(rs.getString("login"));
            u.setSenha(rs.getString("senha"));
            u.setPerfil(PerfilDeAcesso.COMUM);

            usuarioPorId.add(u);

        }
        con.close();
        return usuarioPorId;
    }
    
    
      public void deletarUsuario(Usuario usuario) throws Exception {

        Connection con = ConectaBanco.getConexao();

        PreparedStatement comando = con.prepareStatement("update usuario set ativo=? where id_usuario=?");
        comando.setBoolean(1, usuario.getAtivo());
        comando.setInt(2, usuario.getId_usuario());

        comando.execute();

        con.close();

    }

      public List<Usuario> verficaLoginExistente(Usuario usuario) throws ClassNotFoundException, SQLException {

        Connection con = ConectaBanco.getConexao();

        PreparedStatement comando = con.prepareStatement("select id_usuario, email, login from usuario where ativo ='t' and login=?");

        comando.setString(1, usuario.getLogin());

        
          ResultSet rs = comando.executeQuery();
          
         List<Usuario> loginExistente = new ArrayList<Usuario>();
        
        while (rs.next()){
            
            Usuario u = new Usuario();
            u.setId_usuario(rs.getInt("id_usuario"));
            u.setEmail(rs.getString("email"));
            u.setLogin(rs.getString("login"));
             loginExistente.add(u);
        }
      

        con.close();
        return loginExistente;
    }
}



