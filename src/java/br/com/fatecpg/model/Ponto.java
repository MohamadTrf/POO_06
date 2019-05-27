/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.model;

import br.com.fatecpg.config.ConnectionManager;
import java.sql.Time;
import java.util.Date;

/**
 *
 * @author MohamadTarif
 */
public class Ponto {
    private int cd_ponto;
    private Date dt_ponto;
    private Date hora_entrada;
    private Date hora_saida;
    private int cd_usuario;

    public Ponto(int cd_ponto, Date dt_ponto, Date hora_entrada, Date hora_saida, int cd_usuario) {
        this.cd_ponto = cd_ponto;
        this.dt_ponto = dt_ponto;
        this.hora_entrada = hora_entrada;
        this.hora_saida = hora_saida;
        this.cd_usuario = cd_usuario;
    }

    public static void addPonto(Date dt_ponto,Date hora_entrada, Date hora_saida, int cd_usuario) throws Exception{
        String SQL = "INSERT INTO PONTO(dt_ponto,hr_entrada,hr_saida,cd_usuario) VALUES("
                    +"?"
                    +",?"
                    +",?"
                    +",?"
                    +")";
        
        Object parameters[] = {dt_ponto,hora_entrada,hora_saida,cd_usuario};
        ConnectionManager.executeQuery(SQL, parameters);               
    }
    
    
    
    
    
    
    public int getCd_ponto() {
        return cd_ponto;
    }

    public void setCd_ponto(int cd_ponto) {
        this.cd_ponto = cd_ponto;
    }

    public Date getDt_ponto() {
        return dt_ponto;
    }

    public void setDt_ponto(Date dt_ponto) {
        this.dt_ponto = dt_ponto;
    }

    public Date getHora_entrada() {
        return hora_entrada;
    }

    public void setHora_entrada(Date hora_entrada) {
        this.hora_entrada = hora_entrada;
    }

    public Date getHora_saida() {
        return hora_saida;
    }

    public void setHora_saida(Date hora_saida) {
        this.hora_saida = hora_saida;
    }

    public int getCd_usuario() {
        return cd_usuario;
    }

    public void setCd_usuario(int cd_usuario) {
        this.cd_usuario = cd_usuario;
    }
}
