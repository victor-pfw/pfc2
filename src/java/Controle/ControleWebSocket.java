
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Modelo.ConsultarAgendamentoTimer;
import Modelo.Email;
import Modelo.EmailAutenticacao;
import Modelo.Reserva;
import Modelo.ReservaDAO;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.TimerTask;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import static java.util.stream.Collectors.mapping;
import javax.ejb.Asynchronous;
import javax.ejb.Schedule;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

/**
 *
 * @author victoralexandre
 */

@ServerEndpoint("/websocket")
public class ControleWebSocket {
    
    @OnMessage
    public void onMessage(String usuario, Session session) throws IOException, SQLException, ClassNotFoundException, Exception {

        ScheduledExecutorService sc = Executors.newSingleThreadScheduledExecutor();
        sc.scheduleAtFixedRate(new ConsultarAgendamentoTimer(usuario, session), 0, 5, TimeUnit.MINUTES);

        
    }
    

    @OnOpen
    public void onOpen() {
        System.out.println("Client connected");
    }

    @OnClose
    public void onClose() {
        System.out.println("Connection closed");
    }

}
