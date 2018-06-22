/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.time;
import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.time;
import java.sql.Time;
import java.util.Date;

/**
 *
 * @author victoralexandre
 */

public class Reserva {
    private int id_reserva;
    private String nome;
    private String email;
    private String telefone;
    private Date data_reserva;
    private String hora_reserva;
    private int quantidade_pessoa;
    private Boolean ativo;
    private Boolean flag;
    private Usuario res_usu = new Usuario();

    public int getId_reserva() {
        return id_reserva;
    }

    public void setId_reserva(int id_reserva) {
        this.id_reserva = id_reserva;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public Date getData_reserva() {
        return data_reserva;
    }

    public void setData_reserva(Date data_reserva) {
        this.data_reserva = data_reserva;
    }

    public String getHora_reserva() {
        return hora_reserva;
    }

    public void setHora_reserva(String hora_reserva) {
        this.hora_reserva = hora_reserva;
    }

    public int getQuantidade_pessoa() {
        return quantidade_pessoa;
    }

    public void setQuantidade_pessoa(int quantidade_pessoa) {
        this.quantidade_pessoa = quantidade_pessoa;
    }

    public Boolean getAtivo() {
        return ativo;
    }

    public void setAtivo(Boolean ativo) {
        this.ativo = ativo;
    }

    public Boolean getFlag() {
        return flag;
    }

    public void setFlag(Boolean flag) {
        this.flag = flag;
    }

    public Usuario getRes_usu() {
        return res_usu;
    }

    public void setRes_usu(Usuario res_usu) {
        this.res_usu = res_usu;
    }
   

   
    
    

  
   

   

 

  
    
}
