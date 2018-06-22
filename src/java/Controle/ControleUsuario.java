/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Modelo.Email;
import Modelo.PerfilDeAcesso;
import Modelo.Reserva;
import Modelo.ReservaDAO;
import Modelo.Usuario;
import Modelo.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.mail.EmailAttachment;

/**
 *
 * @author victoralexandre
 */
@WebServlet(name = "ControleUsuario", urlPatterns = {"/ControleUsuario"})
public class ControleUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String acao = request.getParameter("acao");

            if (acao.equals("cadastrarUsuario")) {
                cadastraUsuario(request, response);

            } else if (acao.equals("cadastrarCliente")) {
                cadastraCliente(request, response);
            } else if (acao.equals("ListarUsuarios")) {
                listarUsuarios(request, response);
            } else if (acao.equals("atualizarUsuario")) {
                atualizarUsuario(request, response);
            } else if (acao.equals("selectUsuariosId")) {
                selectUsuarioId(request, response);
            } else if (acao.equals("ExcluirUsuario")) {
                excluirUsuario(request, response);
            }
        } catch (Exception erro) {

            RequestDispatcher rd = request.getRequestDispatcher("/erro.jsp");
            request.setAttribute("erro", erro);
            rd.forward(request, response);

        }

    }

    private void cadastraUsuario(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        Usuario usuario = new Usuario();
        usuario.setEmail(request.getParameter("txtEmail"));
        usuario.setLogin(request.getParameter("txtLogin"));
        usuario.setSenha(request.getParameter("txtSenha"));
        String perfil = request.getParameter("optPerfil");
        usuario.setAtivo(Boolean.TRUE);

        if (perfil.equalsIgnoreCase("administrador")) {
            usuario.setPerfil(PerfilDeAcesso.ADMINISTRADOR);
        } else {
            usuario.setPerfil(PerfilDeAcesso.COMUM);
        }
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        List<Usuario> usuariosJaExistentes = usuarioDAO.verficaLoginExistente(usuario);

        if (usuariosJaExistentes.isEmpty()) {
            usuarioDAO.cadastraNovoUsuario(usuario);

            Email email = new Email();
            email.setNomeDestinatario(request.getParameter("txtEmail"));
            email.setEmailDestinatario(request.getParameter("txtEmail"));
            email.setAssunto("Email de cadastrato Gustus");
            email.setMensagem("Seja bem vindo ao nosso sistema Gustus " + "Seu login é: " + request.getParameter("txtLogin") + " Sua senha é: " + request.getParameter("txtSenha") + "Seu perfil de acesso é: " + request.getParameter("optPerfil") + ",Obrigado pela preferência");

            if (email.enviar()) {
                response.getWriter().println("Enviado com sucesso");
            } else {
                response.getWriter().println("Nao enviou");
            }
            request.setAttribute("msg", "Cadastrado com sucesso");
            RequestDispatcher rd = request.getRequestDispatcher("cadastroUsuario.jsp");
            rd.forward(request, response);
        } else {

            request.setAttribute("msg", "Login já existente");
            RequestDispatcher rd = request.getRequestDispatcher("cadastroUsuario.jsp");
            rd.forward(request, response);

        }
    }

    private void cadastraCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, SQLException, ClassNotFoundException, IOException {

        Usuario cliente = new Usuario();

        cliente.setEmail(request.getParameter("txtEmail"));
        cliente.setLogin(request.getParameter("txtLogin"));
        cliente.setSenha(request.getParameter("txtSenha"));
        cliente.setPerfil(PerfilDeAcesso.COMUM);
        cliente.setAtivo(Boolean.TRUE);

        UsuarioDAO dao = new UsuarioDAO();

        List<Usuario> usuariosJaExistentes = dao.verficaLoginExistente(cliente);

        if (usuariosJaExistentes.isEmpty()) {

            dao.cadastraNovoCliente(cliente);

            // Cria a mensagem de e-mail.
            Email email = new Email();
            email.setNomeDestinatario(request.getParameter("txtEmail"));
            email.setEmailDestinatario(request.getParameter("txtEmail"));
            email.setAssunto("Email de cadastrato Gustus");
            email.setMensagem("Seja bem vindo ao nosso sistema " + "Seu login é: " + request.getParameter("txtLogin") + ", Sua senha é: " + request.getParameter("txtSenha") + ",Obrigado pela preferência");

            if (email.enviar()) {
                response.getWriter().println("Enviado com sucesso");
            } else {
                response.getWriter().println("Nao enviou");
            }

            request.setAttribute("msg", "Cadastrado com sucesso");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);

        } else {

            request.setAttribute("msg", "Login já existente");
            RequestDispatcher rd = request.getRequestDispatcher("registroCliente.jsp");
            rd.forward(request, response);

        }

    }

    private void listarUsuarios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {

        UsuarioDAO dao = new UsuarioDAO();

        Usuario usuario = new Usuario();
        usuario.setAtivo(Boolean.TRUE);

        List<Usuario> usuariosCadastrados = dao.listaDeUsuarios(usuario);

        request.setAttribute("listaUsuarios", usuariosCadastrados);
        request.getRequestDispatcher("admin/listaDeUsuarios.jsp").forward(request, response);

    }

    private void atualizarUsuario(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Usuario usuario = new Usuario();

        usuario.setEmail(request.getParameter("email"));
        usuario.setLogin(request.getParameter("login"));
        usuario.setSenha(request.getParameter("senha"));

        usuario.setPerfil(PerfilDeAcesso.COMUM);
        usuario.setAtivo(Boolean.TRUE);

        int id_Usuario = Integer.parseInt(request.getParameter("id_usuario"));
        usuario.setId_usuario(id_Usuario);

        UsuarioDAO dao = new UsuarioDAO();

        dao.atualizarUsuario(usuario);

        this.listarUsuarios(request, response);

    }

    private void selectUsuarioId(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {

        Usuario usuario = new Usuario();

        int id_Usuario = Integer.parseInt(request.getParameter("id_usuario"));

        usuario.setId_usuario(id_Usuario);

        UsuarioDAO dao = new UsuarioDAO();

        List<Usuario> listaUsuarioId = dao.consultaPoId(usuario);

        request.setAttribute("listaUsuarioPorId", listaUsuarioId);
        RequestDispatcher rd = request.getRequestDispatcher("admin/alterarUsuarios.jsp");
        rd.forward(request, response);

    }

    private void excluirUsuario(HttpServletRequest request, HttpServletResponse response) throws Exception {

        Usuario usuario = new Usuario();
        UsuarioDAO dao = new UsuarioDAO();

        Reserva reserva = new Reserva();
        ReservaDAO reservaDAO = new ReservaDAO();

        int id_Usuario = Integer.parseInt(request.getParameter("id_usuario"));
       
        reserva.getRes_usu().setId_usuario(id_Usuario);

        usuario.setAtivo(Boolean.FALSE);
        usuario.setId_usuario(id_Usuario);
        
        dao.deletarUsuario(usuario);

        reservaDAO.deletaTodasAsReservasPorUsuario(reserva);

        this.listarUsuarios(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

}
