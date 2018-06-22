/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author victoralexandre
 */
public class ListaDeEspera {
    private boolean ativo_lista;
    private String email;
    private int id_lista_reserva; 
    private Reserva email_reserva = new Reserva();

    public Reserva getEmail_reserva() {
        return email_reserva;
    }

    public void setEmail_reserva(Reserva email_reserva) {
        this.email_reserva = email_reserva;
    }

   
    

    public boolean getAtivo_lista() {
        return ativo_lista;
    }

    public void setAtivo_lista(boolean ativo_lista) {
        this.ativo_lista = ativo_lista;
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getId_lista_reserva() {
        return id_lista_reserva;
    }

    public void setId_lista_reserva(int id_lista_reserva) {
        this.id_lista_reserva = id_lista_reserva;
    }

   

  

}
