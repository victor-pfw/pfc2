/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Modelo.Lugares;
import Modelo.LugaresDAO;
import Modelo.Reserva;
import Modelo.ReservaDAO;
import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
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

/**
 *
 * @author victoralexandre
 */
@WebServlet(name = "ControleLugares", urlPatterns = {"/ControleLugares"})
public class ControleLugares extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String acao = request.getParameter("acao");

            if (acao.equals("atualizarLugares")) {
                atualizaLugares(request, response);

            } else if (acao.equals("ConsultaLugaresPorData")) {
                consultaLugaresPorData(request, response);

            } else if (acao.equals("ConsultaLugaresPorDataCliente")) {
                consultaLugaresPorDataCliente(request, response);
            }

        } catch (Exception erro) {

            RequestDispatcher rd = request.getRequestDispatcher("/erro.jsp");
            request.setAttribute("erro", erro);
            rd.forward(request, response);

        }

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

    private void atualizaLugares(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {

        Lugares lugares = new Lugares();
        int quantidade = Integer.parseInt(request.getParameter("quantidade_lugares"));

        String dataEmTexto = request.getParameter("data_da_quantidade");
        try {

            java.util.Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dataEmTexto);
            lugares.setData_disponiveis(date);
            lugares.setQuantidade(quantidade);
        } catch (ParseException e) {
            out.println("Erro de conversão da data");
            return; //para a execução do método
        }

        LugaresDAO dao = new LugaresDAO();

        List<Lugares> dataExistente = dao.listaDataExistente(lugares);

        if (dataExistente.isEmpty()) {

            dao.cadastraNovaDataParaLugares(lugares);
            request.setAttribute("msg_lugares", "Lugares atualizados com sucesso");
            RequestDispatcher rd = request.getRequestDispatcher("/admin/lugaresAtualizados.jsp");
            rd.forward(request, response);

        } else {

            dao.atualizaQuantidadeLugares(lugares);

            request.setAttribute("msg_lugares", "Lugares atualizados com sucesso");
            RequestDispatcher rd = request.getRequestDispatcher("/admin/lugaresAtualizados.jsp");
            rd.forward(request, response);

        }

    }

    private void consultaLugaresPorData(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {

        Lugares lugares = new Lugares();
        String dataEmTexto = request.getParameter("data_reserva");
        try {

            java.util.Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dataEmTexto);
            lugares.setData_disponiveis(date);

        } catch (ParseException e) {
            out.println("Erro de conversão da data");
            return; //para a execução do método
        }

        LugaresDAO dao = new LugaresDAO();

        List<Lugares> listaQuantidadeLugaresPorData = dao.LugaresDisponiveisPorData(lugares);

        request.setAttribute("retornaQuantidadeDisponiveisPorData", listaQuantidadeLugaresPorData);
        RequestDispatcher rd = request.getRequestDispatcher("admin/lugaresAdmPorData.jsp");
        rd.forward(request, response);

    }

    private void consultaLugaresPorDataCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {

        Lugares lugares = new Lugares();
        String dataEmTexto = request.getParameter("data_reserva");
        try {

            java.util.Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dataEmTexto);
            lugares.setData_disponiveis(date);

        } catch (ParseException e) {
            out.println("Erro de conversão da data");
            return; //para a execução do método
        }

        LugaresDAO dao = new LugaresDAO();

        List<Lugares> s = dao.LugaresDisponiveisPorData(lugares);

        request.setAttribute("retornaQuantidadeDisponiveisPorDataCliente", s);
        RequestDispatcher rd = request.getRequestDispatcher("lugaresCliente.jsp");
        rd.forward(request, response);

    }
}
