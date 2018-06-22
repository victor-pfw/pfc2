/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Modelo.Email;
import Modelo.ListaDeEspera;
import Modelo.ListaEsperaDAO;
import Modelo.Lugares;
import Modelo.LugaresDAO;
import Modelo.PerfilDeAcesso;
import Modelo.Reserva;
import Modelo.ReservaDAO;
import Modelo.Usuario;
import Modelo.UsuarioDAO;
import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "ControleReserva", urlPatterns = {"/ControleReserva"})
public class ControleReserva extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String acao = request.getParameter("acao");

            if (acao.equals("Enviar")) {
                cadastraReserva(request, response);
            } else if (acao.equals("Listar")) {
                listarReservasAdm(request, response);
            } else if (acao.equals("Alterar")) {
                alterarReservasADM(request, response);

            } else if (acao.equals("Excluir")) {
                excluirReservar(request, response);
            } else if (acao.equals("ConsultaPorData")) {
                consultaReservaData(request, response);

            } else if (acao.equals("SelectPorId")) {
                consultaPorId(request, response);

            } else if (acao.equals("ConsultasReservasCliente")) {
                consultaReservaCliente(request, response);

            } else if (acao.equals("SelectPorIdCliente")) {
                consultaPorIdCliente(request, response);

            } else if (acao.equals("AlterarCliente")) {
                alterarReservasCliente(request, response);
            } else if (acao.equals("EnviarAdm")) {
                cadastraReservaAdm(request, response);
            } else if (acao.equals("HistoricoReserva")) {
                consultaReservasGeral(request, response);
            } else if (acao.equals("ExcluirReservaCliente")) {
                excluirReservaCliente(request, response);
            } else if (acao.equals("Checkin")) {
                realizarCheckin(request, response);
            } else if (acao.equals("FilaGeral")) {
                HistoricoFila(request, response);
            }

        } catch (Exception erro) {

            RequestDispatcher rd = request.getRequestDispatcher("/erro.jsp");
            request.setAttribute("erro", erro);
            rd.forward(request, response);

        }
    }

    private void cadastraReserva(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException, ParseException, Exception {
        Reserva reserva = new Reserva();

        reserva.setNome(request.getParameter("nome_reserva"));
        reserva.setEmail(request.getParameter("email_endereco"));
        reserva.setTelefone(request.getParameter("telefone_reserva"));
        reserva.setHora_reserva(request.getParameter("hora_reserva"));

        String dataEmTexto = request.getParameter("data_reserva");
        try {

            java.util.Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dataEmTexto);
            reserva.setData_reserva(date);

        } catch (ParseException e) {
            out.println("Erro de conversão da data");
            return; //para a execução do método
        }

        int quantidade = Integer.parseInt(request.getParameter("quantidade_pessoas"));
        reserva.setQuantidade_pessoa(quantidade);

        int qdtdeLugaresSolicitada = Integer.parseInt(request.getParameter("quantidade_pessoas"));
        int fk_key_reserva = Integer.parseInt(request.getParameter("fk_key_reserva"));

        reserva.setAtivo(Boolean.TRUE);
        reserva.setFlag(Boolean.FALSE);

        reserva.getRes_usu().setId_usuario(fk_key_reserva);

        //recuperando data da reserva para passar por parâmetro
        Lugares lugares = new Lugares();
        String dataEmTextos = request.getParameter("data_reserva");
        try {

            java.util.Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dataEmTextos);
            lugares.setData_disponiveis(date);

        } catch (ParseException e) {
            out.println("Erro de conversão da data");
            return; //para a execução do método
        }

        //RECUPERANDO E-MAIL PARA ESPERA
        ListaDeEspera espera = new ListaDeEspera();

        espera.setEmail_reserva(reserva);
        espera.setAtivo_lista(true);

        LugaresDAO lugaresDao = new LugaresDAO();

        double qdtdeLugaresTotal = lugaresDao.quantidadeLugares(lugares);

        List<Lugares> dataExistente = lugaresDao.listaDataExistente(lugares);

        if (dataExistente.isEmpty()) {

            RequestDispatcher rd = request.getRequestDispatcher("semDataCadastrada.jsp");
            rd.forward(request, response);

        } else if (qdtdeLugaresSolicitada > qdtdeLugaresTotal) {

            ListaEsperaDAO ListaEspera = new ListaEsperaDAO();

            ListaEspera.cadastraListaDeEspera(espera);

            request.setAttribute("msg_reserva", "Essa reserva excede o número de lugares disponíveis na data selecionada, você foi adicionado em uma fila de espera.");
            RequestDispatcher rd = request.getRequestDispatcher("reserva.jsp");
            rd.forward(request, response);

        } else {
            ReservaDAO reservaDAO = new ReservaDAO();

            reservaDAO.cadastraNovaReserva(reserva);

            double qdtdeLugaresSolicitadaNovamente = Integer.parseInt(request.getParameter("quantidade_pessoas"));

            double qdtdeLugaresTotalNovamente = lugaresDao.quantidadeLugares(lugares);

            double resultadoAtualizadoLugaresDisponiveis = qdtdeLugaresTotalNovamente - qdtdeLugaresSolicitadaNovamente;

            lugares.setQuantidade((int) resultadoAtualizadoLugaresDisponiveis);


            lugaresDao.atualizaQuantidadeLugares(lugares);

// Cria a mensagem de e-mail.
            Email email = new Email();
            email.setNomeDestinatario(request.getParameter("txtEmail"));
            email.setEmailDestinatario(request.getParameter("email_endereco"));
            email.setAssunto("Email de cadastrato Reserva");
            email.setMensagem("Você tem uma nova reserva " + request.getParameter("nome_reserva") + " ,  Data: " + request.getParameter("data_reserva") + ",  Hora: " + request.getParameter("hora_reserva") + ",Obrigado pela preferência");

            if (email.enviar()) {
                response.getWriter().println("Enviado com sucesso");
            } else {
                response.getWriter().println("Nao enviou");
            }

            request.setAttribute("msg_reserva", "Reserva cadastrada com sucesso,favor verifique o seu e-mail");
            RequestDispatcher rd = request.getRequestDispatcher("reserva.jsp");
            rd.forward(request, response);

        }

    }

    public void listarReservasCliente(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        ReservaDAO dao = new ReservaDAO();
        Reserva reserva = new Reserva();
        reserva.setAtivo(Boolean.TRUE);

        List<Reserva> reservas = dao.listaDeReservas(reserva);

        request.setAttribute("listaReservasCliente", reservas);
        request.getRequestDispatcher("reservasClientes.jsp").forward(request, response);

    }

    public void listarReservasAdm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        ReservaDAO dao = new ReservaDAO();
        Reserva reserva = new Reserva();
        reserva.setAtivo(Boolean.TRUE);

        List<Reserva> reservas = dao.listaDeReservas(reserva);

        request.setAttribute("todasReservas", reservas);
        request.getRequestDispatcher("admin/controladoraReserva.jsp").forward(request, response);

    }

    private void alterarReservasADM(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception {

        Reserva reserva = new Reserva();

        reserva.setNome(request.getParameter("nome_reserva"));
        reserva.setEmail(request.getParameter("email_endereco"));
        reserva.setTelefone(request.getParameter("telefone_reserva"));
        reserva.setHora_reserva(request.getParameter("hora_reserva"));
        int quantidade = Integer.parseInt(request.getParameter("quantidade_pessoas"));
        int id_reserva = Integer.parseInt(request.getParameter("id_reserva"));

        String dataEmTexto = request.getParameter("data_reserva");
        try {

            java.util.Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dataEmTexto);
            reserva.setData_reserva(date);

        } catch (ParseException e) {
            out.println("Erro de conversão da data");
            return; //para a execução do método
        }

        reserva.setQuantidade_pessoa(quantidade);
        reserva.setId_reserva(id_reserva);
        reserva.setAtivo(Boolean.TRUE);

        ReservaDAO dao = new ReservaDAO();

        dao.atualizarReserva(reserva);

        this.listarReservasAdm(request, response);

    }

    private void alterarReservasCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception {
        Reserva reserva = new Reserva();

        reserva.setNome(request.getParameter("nome_reserva"));
        reserva.setEmail(request.getParameter("email_endereco"));
        reserva.setTelefone(request.getParameter("telefone_reserva"));
        reserva.setHora_reserva(request.getParameter("hora_reserva"));

        String dataEmTexto = request.getParameter("data_reserva");
        try {

            java.util.Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dataEmTexto);
            reserva.setData_reserva(date);

        } catch (ParseException e) {
            out.println("Erro de conversão da data");
            return; //para a execução do método
        }

        int quantidade = Integer.parseInt(request.getParameter("quantidade_pessoas"));
        reserva.setQuantidade_pessoa(quantidade);
        int id_reserva = Integer.parseInt(request.getParameter("id_reserva"));
        reserva.setId_reserva(id_reserva);
        reserva.setAtivo(Boolean.TRUE);

        ReservaDAO dao = new ReservaDAO();

        dao.atualizarReserva(reserva);

        Email email = new Email();
        email.setNomeDestinatario(request.getParameter("txtEmail"));
        email.setEmailDestinatario(request.getParameter("email_endereco"));
        email.setAssunto("Email de alteração de dados reserva ");
        email.setMensagem("Os dados da sua reserva foram alterados com sucesso");

        if (email.enviar()) {
            response.getWriter().println("Enviado com sucesso");
        } else {
            response.getWriter().println("Nao enviou");
        }

       
        this.listarReservasCliente(request, response);

    }

    public void excluirReservar(HttpServletRequest request, HttpServletResponse response) throws Exception {
     Reserva reserva = new Reserva();
        ReservaDAO dao = new ReservaDAO();

        int id_reserva = Integer.parseInt(request.getParameter("id_reserva"));

        reserva.setId_reserva(id_reserva);

        reserva.setAtivo(Boolean.FALSE);
        reserva.setFlag(Boolean.FALSE);

        dao.deletarReserva(reserva);

        LugaresDAO lugaresDao = new LugaresDAO();

        Lugares lugares = new Lugares();
        String dataEmTextos = request.getParameter("data_reserva");
        try {

            java.util.Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dataEmTextos);
            lugares.setData_disponiveis(date);

        } catch (ParseException e) {
            out.println("Erro de conversão da data");
            return; //para a execução do método
        }
        double qdtdeLugaresExcluir = Integer.parseInt(request.getParameter("quantidade_pessoas"));

        double qdtdeLugaresTotalNovamente = lugaresDao.quantidadeLugares(lugares);

        double resultadoAtualizadoLugaresDisponiveis = qdtdeLugaresTotalNovamente + qdtdeLugaresExcluir;

        lugares.setQuantidade((int) resultadoAtualizadoLugaresDisponiveis);


        lugaresDao.atualizaQuantidadeLugares(lugares);

        this.listarReservasAdm(request, response);

    }

    private void consultaReservaData(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        Reserva reserva = new Reserva();
        String dataEmTexto = request.getParameter("data_reserva");
        try {

            java.util.Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dataEmTexto);
            reserva.setData_reserva(date);

        } catch (ParseException e) {
            out.println("Erro de conversão da data");
            return; //para a execução do método
        }

        ReservaDAO dao = new ReservaDAO();

        List<Reserva> listarReservasData = dao.reservaPorData(reserva);

        request.setAttribute("retornaListaPorData", listarReservasData);
        RequestDispatcher rd = request.getRequestDispatcher("admin/reservasDataCadastradas.jsp");
        rd.forward(request, response);

    }

    private void consultaReservaCliente(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {

        // Usuario usuario = new Usuario();
        Reserva reserva = new Reserva();

        int id_Usuario = Integer.parseInt(request.getParameter("id_Usuario"));

        // usuario.setId_usuario(id_Usuario);
        //usuario.setAtivo(Boolean.TRUE);
        reserva.getRes_usu().setAtivo(Boolean.TRUE);
        reserva.getRes_usu().setId_usuario(id_Usuario);

        ReservaDAO dao = new ReservaDAO();

        List<Reserva> listaReservasCliente = dao.consultaReservasCliente(reserva);

        if (listaReservasCliente.isEmpty()) {

            RequestDispatcher rd = request.getRequestDispatcher("semReservas.jsp");
            rd.forward(request, response);

        } else {

            request.setAttribute("listaReservasCliente", listaReservasCliente);
            RequestDispatcher rd = request.getRequestDispatcher("reservasClientes.jsp");
            rd.forward(request, response);

        }
    }

    private void cadastraReservaAdm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException, Exception {

        Reserva reserva = new Reserva();

        reserva.setNome(request.getParameter("nome_reserva"));
        reserva.setEmail(request.getParameter("email_endereco"));
        reserva.setTelefone(request.getParameter("telefone_reserva"));
        reserva.setHora_reserva(request.getParameter("hora_reserva"));

        String dataEmTexto = request.getParameter("data_reserva");
        try {

            java.util.Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dataEmTexto);
            reserva.setData_reserva(date);

        } catch (ParseException e) {
            out.println("Erro de conversão da data");
            return; //para a execução do método
        }

        int quantidade = Integer.parseInt(request.getParameter("quantidade_pessoas"));
        reserva.setQuantidade_pessoa(quantidade);

        int qdtdeLugaresSolicitada = Integer.parseInt(request.getParameter("quantidade_pessoas"));
        int fk_key_reserva = Integer.parseInt(request.getParameter("fk_key_reserva"));

        reserva.setAtivo(Boolean.TRUE);
        reserva.setFlag(Boolean.FALSE);

        reserva.getRes_usu().setId_usuario(fk_key_reserva);

        //recuperando data da reserva para passar por parâmetro
        Lugares lugares = new Lugares();
        String dataEmTextos = request.getParameter("data_reserva");
        try {

            java.util.Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dataEmTextos);
            lugares.setData_disponiveis(date);

        } catch (ParseException e) {
            out.println("Erro de conversão da data");
            return; //para a execução do método
        }

        //RECUPERANDO E-MAIL PARA ESPERA
        ListaDeEspera espera = new ListaDeEspera();

        espera.setEmail_reserva(reserva);
        espera.setAtivo_lista(true);

        LugaresDAO lugaresDao = new LugaresDAO();

        double qdtdeLugaresTotal = lugaresDao.quantidadeLugares(lugares);

        List<Lugares> dataExistente = lugaresDao.listaDataExistente(lugares);

        if (dataExistente.isEmpty()) {

            RequestDispatcher rd = request.getRequestDispatcher("semDataCadastrada.jsp");
            rd.forward(request, response);

        } else if (qdtdeLugaresSolicitada > qdtdeLugaresTotal) {

            ListaEsperaDAO ListaEspera = new ListaEsperaDAO();

            ListaEspera.cadastraListaDeEspera(espera);

            request.setAttribute("msg_reserva", "Essa reserva excede o número de lugares disponíveis na data selecionada, você foi adicionado em uma fila de espera.");
            RequestDispatcher rd = request.getRequestDispatcher("reserva.jsp");
            rd.forward(request, response);

        } else {
            ReservaDAO reservaDAO = new ReservaDAO();

            reservaDAO.cadastraNovaReserva(reserva);

            double qdtdeLugaresSolicitadaNovamente = Integer.parseInt(request.getParameter("quantidade_pessoas"));

            double qdtdeLugaresTotalNovamente = lugaresDao.quantidadeLugares(lugares);

            double resultadoAtualizadoLugaresDisponiveis = qdtdeLugaresTotalNovamente - qdtdeLugaresSolicitadaNovamente;

            lugares.setQuantidade((int) resultadoAtualizadoLugaresDisponiveis);

            LugaresDAO lDao = new LugaresDAO();

            lDao.atualizaQuantidadeLugares(lugares);

// Cria a mensagem de e-mail.
            Email email = new Email();
            email.setNomeDestinatario(request.getParameter("txtEmail"));
            email.setEmailDestinatario(request.getParameter("email_endereco"));
            email.setAssunto("Email de cadastrato Reserva");
            email.setMensagem("Você tem uma nova reserva " + request.getParameter("nome_reserva") + " ,  Data: " + request.getParameter("data_reserva") + ",  Hora: " + request.getParameter("hora_reserva") + ",Obrigado pela preferência");

            if (email.enviar()) {
                response.getWriter().println("Enviado com sucesso");
            } else {
                response.getWriter().println("Nao enviou");
            }

            request.setAttribute("msg_reserva", "Reserva cadastrada com sucesso,favor verifique o seu e-mail");
            RequestDispatcher rd = request.getRequestDispatcher("reservaAdm.jsp");
            rd.forward(request, response);

        }

    }

    private void consultaPorId(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {

        Reserva reserva = new Reserva();

        int id_reserva = Integer.parseInt(request.getParameter("id_reserva"));

        reserva.setId_reserva(id_reserva);

        ReservaDAO dao = new ReservaDAO();

        List<Reserva> listarReservasPorId = dao.consultaPoId(reserva);

        request.setAttribute("listaPorId", listarReservasPorId);
        RequestDispatcher rd = request.getRequestDispatcher("alterarReservaAdm.jsp");
        rd.forward(request, response);

    }

    private void consultaPorIdCliente(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {

        Reserva reserva = new Reserva();

        int id_reserva = Integer.parseInt(request.getParameter("id_reserva"));

        reserva.setId_reserva(id_reserva);

        ReservaDAO dao = new ReservaDAO();

        List<Reserva> listarReservasPorId = dao.consultaPoId(reserva);

        request.setAttribute("listaPorIdCliente", listarReservasPorId);
        RequestDispatcher rd = request.getRequestDispatcher("alterarReservaCliente.jsp");
        rd.forward(request, response);

    }

    private void consultaReservasGeral(HttpServletRequest request, HttpServletResponse response) throws ServletException, ServletException, IOException, SQLException, ClassNotFoundException {

        ReservaDAO dao = new ReservaDAO();

        List<Reserva> reservas = dao.listaDeReservasGeral();

        request.setAttribute("todasReservasGeral", reservas);
        request.getRequestDispatcher("admin/historicoReservas.jsp").forward(request, response);

    }

    private void excluirReservaCliente(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Reserva reserva = new Reserva();
        ReservaDAO dao = new ReservaDAO();

        int id_reserva = Integer.parseInt(request.getParameter("id_reserva"));

        reserva.setId_reserva(id_reserva);

        reserva.setAtivo(Boolean.FALSE);
        reserva.setFlag(Boolean.FALSE);

        dao.deletarReserva(reserva);

        LugaresDAO lugaresDao = new LugaresDAO();

        Lugares lugares = new Lugares();
        String dataEmTextos = request.getParameter("data_reserva");
        try {

            java.util.Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dataEmTextos);
            lugares.setData_disponiveis(date);

        } catch (ParseException e) {
            out.println("Erro de conversão da data");
            return; //para a execução do método
        }
        double qdtdeLugaresExcluir = Integer.parseInt(request.getParameter("quantidade_pessoas"));

        double qdtdeLugaresTotalNovamente = lugaresDao.quantidadeLugares(lugares);

        double resultadoAtualizadoLugaresDisponiveis = qdtdeLugaresTotalNovamente + qdtdeLugaresExcluir;

        lugares.setQuantidade((int) resultadoAtualizadoLugaresDisponiveis);

        LugaresDAO lDao = new LugaresDAO();

        lDao.atualizaQuantidadeLugares(lugares);

        this.listarReservasCliente(request, response);

    }

    private void realizarCheckin(HttpServletRequest request, HttpServletResponse response) throws Exception {

        Reserva reserva = new Reserva();
        ReservaDAO dao = new ReservaDAO();

        int id_reserva = Integer.parseInt(request.getParameter("id_reserva"));

        reserva.setId_reserva(id_reserva);

        reserva.setFlag(Boolean.TRUE);

        dao.checkinReserva(reserva);

        this.listarReservasAdm(request, response);

    }

    private void HistoricoFila(HttpServletRequest request, HttpServletResponse response) throws ServletException, ServletException, IOException, SQLException, ClassNotFoundException {

        ListaEsperaDAO dao = new ListaEsperaDAO();

        List<ListaDeEspera> fila = dao.HistoricoGeralFila();

        request.setAttribute("FilaGeral", fila);
        request.getRequestDispatcher("admin/HistoricoFila.jsp").forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
