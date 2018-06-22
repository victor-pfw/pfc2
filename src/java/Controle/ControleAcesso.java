/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Modelo.PerfilDeAcesso;
import Modelo.Usuario;
import Modelo.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author victoralexandre
 */
@WebServlet(name = "ControleAcesso", urlPatterns = {"/ControleAcesso",})
public class ControleAcesso extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String acao = request.getParameter("acao");
            if (acao.equals("Entrar")) {
                loginUsuario(request, response);
            } else if (acao.equals("Sair")) {
                HttpSession sessaoUsuario = request.getSession();
                sessaoUsuario.removeAttribute("usuarioAutenticado");
                response.sendRedirect("logout.jsp");

            }
        } catch (Exception erro) {
            RequestDispatcher rd = request.getRequestDispatcher("/erro.jsp");
            request.setAttribute("erro", erro);
            rd.forward(request, response);
        }
    }

    private void loginUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, ClassNotFoundException, IOException, SQLException {
        Usuario usuario = new Usuario();
        usuario.setLogin(request.getParameter("txtLogin"));
        usuario.setSenha(request.getParameter("txtSenha"));
   

        UsuarioDAO dao = new UsuarioDAO();
         Usuario usuarioAutenticado =  dao.autenticaUsuario(usuario);
        //se o usuario existe no banco de dados
        if (usuarioAutenticado != null && usuarioAutenticado.getPerfil().equals(PerfilDeAcesso.ADMINISTRADOR)) {
            //cria uma sessao para o usuário
            HttpSession sessaoUsuario = request.getSession();
            sessaoUsuario.setAttribute("usuarioAutenticado", usuarioAutenticado);
            //redireciona para a pagina principa
            response.sendRedirect("admin/administrador.jsp");

        } else if (usuarioAutenticado != null && usuarioAutenticado.getPerfil().equals(PerfilDeAcesso.COMUM)) {
            //cria uma sessao para o usuário
            HttpSession sessaoUsuario = request.getSession();
            sessaoUsuario.setAttribute("usuarioAutenticado", usuarioAutenticado);
            //redireciona para a pagina principa
            response.sendRedirect("principal.jsp");

        } else {
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            request.setAttribute("msg", "Login ou Senha incorreto");
            rd.forward(request, response);
        }
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
