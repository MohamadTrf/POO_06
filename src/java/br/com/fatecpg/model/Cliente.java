package br.com.fatecpg.model;

import br.com.fatecpg.config.ConnectionManager;
import java.util.ArrayList;

/**
 *
 * @author MohamadTarif
 */
public class Cliente {

    private int cd_cliente;
    private String nm_cliente;
    private String nm_endereco;
    private String cd_cpf;
    private String nm_email;

    public Cliente(int cd_cliente, String nm_cliente, String nm_endereco, String cd_cpf, String nm_email) {
        this.cd_cliente = cd_cliente;
        this.nm_cliente = nm_cliente;
        this.nm_endereco = nm_endereco;
        this.cd_cpf = cd_cpf;
        this.nm_email = nm_email;
    }

    public static ArrayList<Cliente> getClientes() throws Exception {
        String SQL = "SELECT * FROM CLIENTE";
        ArrayList<Cliente> clientes = new ArrayList<>();
        ArrayList<Object[]> list = ConnectionManager.responseQuery(SQL, new Object[]{});

        for (int i = 0; i < list.size(); i++) {
            Object row[] = list.get(i);

            Cliente c = new Cliente((int) row[0],
                    (String) row[1],
                    (String) row[2],
                    (String) row[3],
                    (String) row[4]);
            clientes.add(c);
        }

        return clientes;
    }

    public static void addCliente(String nm_cliente, String nm_endereco, String cd_cpf, String nm_email) throws Exception {
        String SQL = "INSERT INTO cliente(nm_cliente,nm_endereco,cd_cpf,nm_email)VALUES("
                + "?"
                + ",?"
                + ",?"
                + ",?"
                + ")";
        Object parameters[] = {nm_cliente, nm_endereco, cd_cpf, nm_email};
        ConnectionManager.executeQuery(SQL, parameters);
    }
    
    public static void deleteCliente(int cd_cliente) throws Exception{
        String SQL = "DELETE FROM CLIENTE WHERE cd_cliente= ?";
        Object parameters [] = {cd_cliente};
        ConnectionManager.executeQuery(SQL, parameters);
    }

    public int getCd_cliente() {
        return cd_cliente;
    }

    public void setCd_cliente(int cd_cliente) {
        this.cd_cliente = cd_cliente;
    }

    public String getNm_cliente() {
        return nm_cliente;
    }

    public void setNm_cliente(String nm_cliente) {
        this.nm_cliente = nm_cliente;
    }

    public String getNm_endereco() {
        return nm_endereco;
    }

    public void setNm_endereco(String nm_endereco) {
        this.nm_endereco = nm_endereco;
    }

    public String getCd_cpf() {
        return cd_cpf;
    }

    public void setCd_cpf(String cd_cpf) {
        this.cd_cpf = cd_cpf;
    }

    public String getNm_email() {
        return nm_email;
    }

    public void setNm_email(String nm_email) {
        this.nm_email = nm_email;
    }
}
