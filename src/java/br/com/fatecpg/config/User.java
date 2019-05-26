/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.config;

import java.util.ArrayList;

/**
 *
 * @author MohamadTarif
 */
public class User {
   private int cd_user;
   private String nm_user;
   private String nm_senha;
   private String nm_cargo;
   private int cd_nivel_permissao;

    public User(int cd_user, String nm_user, String nm_senha, String nm_cargo, int cd_nivel_permissao) {
        this.cd_user = cd_user;
        this.nm_user = nm_user;
        this.nm_senha = nm_senha;
        this.nm_cargo = nm_cargo;
        this.cd_nivel_permissao = cd_nivel_permissao;
    }

    public long getCd_user() {
        return cd_user;
    }

    public void setCd_user(int cd_user) {
        this.cd_user = cd_user;
    }

    public String getNm_user() {
        return nm_user;
    }

    public void setNm_user(String nm_user) {
        this.nm_user = nm_user;
    }

    public String getNm_senha() {
        return nm_senha;
    }

    public void setNm_senha(String nm_senha) {
        this.nm_senha = nm_senha;
    }

    public String getNm_cargo() {
        return nm_cargo;
    }

    public void setNm_cargo(String nm_cargo) {
        this.nm_cargo = nm_cargo;
    }

    public int getCd_nivel_permissao() {
        return cd_nivel_permissao;
    }

    public void setCd_nivel_permissao(int cd_nivel_permissao) {
        this.cd_nivel_permissao = cd_nivel_permissao;
    }
   
    public static User getUser(String nm_user, String nm_senha) throws Exception{
        String SQL = "SELECT * FROM USERS WHERE nm_user = ? AND nm_senha = ?";
        Object parameters[] = {nm_user, nm_senha};
        ArrayList<Object[]> list = DbConnection.getQuery(SQL, parameters);
            if(list.isEmpty()){
                return null;
            }else {
                Object row [] = list.get(0);
                User u = new User((int)row[0]
                        ,(String)row[1] 
                        ,(String)row[2]
                        ,(String)row[3]
                        ,(int)row[4] );
                
                return u;
            }
        
    }
    
    public static void addUser(String nm_user, String nm_senha, String nm_cargo, int cd_nivel_permissao) throws Exception{
        String SQL = "INSERT INTO users (nm_user,nm_senha,nm_cargo,cd_nivel_permissao)VALUES("
                +"?"
                +",?"
                +",?"
                +",?"
                +")";
        Object parameters[]={nm_user,nm_senha,nm_cargo,cd_nivel_permissao};
        DbConnection.getCommand(SQL, parameters);
    }
        
}
