/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Modelo.Email;
import Modelo.Reserva;
import Modelo.ReservaDAO;
import Modelo.Usuario;

import java.io.IOException;
import static java.lang.System.out;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.TimerTask;
import javax.websocket.Session;

/**
 *
 * @author victoralexandre
 */
public class ConsultarAgendamentoTimer extends TimerTask {

    String usuario = null;
    Session session = null;

    public ConsultarAgendamentoTimer(String usuario, Session session) {
        this.usuario = usuario;
        this.session = session;
    }

    public void consultarReservasConducao() throws IOException, SQLException, ClassNotFoundException, Exception {
        Reserva reserva = new Reserva();
        ReservaDAO dao = new ReservaDAO();
        ListaEsperaDAO listaDAO = new ListaEsperaDAO();

        List<Reserva> verificar = dao.vencimentoHoraReserva();
        List<ListaDeEspera> verificarListaDeEspera = listaDAO.listaDeEspera();

        String retorno = "";
        String nome = "";

        if (verificar.isEmpty()) {

            session.getBasicRemote().sendText("Você tem  " + verificar.size() + " a vencer ");

        } else {

            for (Reserva r : verificar) {

                retorno += r.getHora_reserva() + "";
                r.getEmail();
                nome += r.getNome() + "";
                r.getId_reserva();
                r.getData_reserva();

                Email email = new Email();

                String hora = "HH:mm:h";
                String hora1;
                java.util.Date agora = new java.util.Date();;
                SimpleDateFormat formata = new SimpleDateFormat(hora);
                hora1 = formata.format(agora);

                Date dataA = formata.parse(retorno);
                Date dataB = formata.parse(hora1);

                formata = new SimpleDateFormat(hora);

                if (dataA.after(dataB)) {

                    session.getBasicRemote().sendText("Você tem  " + verificar.size() + " a vencer as : " + retorno + ", em nome de: " + r.getNome());
                    //Cria a mensagem de e-mail.
                    email.setNomeDestinatario("pfcGustus");
                    email.setEmailDestinatario(r.getEmail());
                    email.setAssunto("Email de vencimento de reserva");
                    email.setMensagem("Caro cliente " + r.getNome() + ", sua reserva está prestes a vencer as: " + retorno + ",Evite atrasos");
                    email.enviar();

                } else {

                    reserva.setId_reserva(r.getId_reserva());

                    reserva.setAtivo(Boolean.FALSE);
                    reserva.setFlag(Boolean.FALSE);

                    dao.atualizaStatusReserva(reserva);

                    session.getBasicRemote().sendText("A reserva com código : " + r.getId_reserva() + " venceu ");

                    email.setNomeDestinatario("pfcGustus");
                    email.setEmailDestinatario(r.getEmail());
                    email.setAssunto("Email de reserva vencida ");
                    email.setMensagem("Caro cliente " + r.getNome() + ", sua reserva venceu as: " + retorno);
                    email.enviar();

                    LugaresDAO lDao = new LugaresDAO();

                    Lugares lugares = new Lugares();
                    lugares.setData_disponiveis(r.getData_reserva());

                    double qdtdeLugaresExcluir = r.getQuantidade_pessoa();

                    double qdtdeLugaresTotalNovamente = lDao.quantidadeLugares(lugares);

                    double resultadoAtualizadoLugaresDisponiveis = qdtdeLugaresTotalNovamente + qdtdeLugaresExcluir;

                    lugares.setQuantidade((int) resultadoAtualizadoLugaresDisponiveis);

                    lDao.atualizaQuantidadeLugares(lugares);

                    if (verificarListaDeEspera.isEmpty()) {
                        session.getBasicRemote().sendText("Você não possui clientes em espera");

                    } else {

                        for (ListaDeEspera rs : verificarListaDeEspera) {

                            email.setNomeDestinatario("pfcGustus");
                            email.setEmailDestinatario(rs.getEmail());
                            email.setAssunto("Email de liberação de lugares ");
                            email.setMensagem("Caro cliente ,novos lugares foram disponibilizados para reserva para o dia de hoje, caso você não reservar, existe a possbilidade de outros clientes realizarem no lugar, OBRIGADO.");

                            email.enviar();

                            listaDAO.deletaListaDeEspera();

                            session.getBasicRemote().sendText("Clientes em espera notificados via e-mail");

                        }

                    }

                }

            }

        }

    }

    @Override
    public void run() {
        try {
            this.consultarReservasConducao();
        } catch (Exception ex) {

        }

    }
}
