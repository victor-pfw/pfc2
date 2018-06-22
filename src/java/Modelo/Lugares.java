/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.Date;
import java.util.List;

/**
 *
 * @author victoralexandre
 */
public class Lugares {
    private int id_lugares;
    private int quantidade;
    private Date data_disponiveis;    
    private Reserva data_da_reserva = new Reserva();

    public int getId_lugares() {
        return id_lugares;
    }

    public void setId_lugares(int id_lugares) {
        this.id_lugares = id_lugares;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public Date getData_disponiveis() {
        return data_disponiveis;
    }

    public void setData_disponiveis(Date data_disponiveis) {
        this.data_disponiveis = data_disponiveis;
    }

    public Reserva getData_da_reserva() {
        return data_da_reserva;
    }

    public void setData_da_reserva(Reserva data_da_reserva) {
        this.data_da_reserva = data_da_reserva;
    }
   
 

   
        
}
