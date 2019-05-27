package br.com.fatecpg.model;

import br.com.fatecpg.config.ConnectionManager;
import java.util.ArrayList;

/**
 *
 * @author Mulero
 */
public class Fornecedor {

    private int cd_fornecedor;
    private String nm_fornecedor;
    private String nm_endereco;

    public Fornecedor(int cd_fornecedor, String nm_fornecedor, String nm_endereco) {
        this.cd_fornecedor = cd_fornecedor;
        this.nm_fornecedor = nm_fornecedor;
        this.nm_endereco = nm_endereco;
    }

    public static Fornecedor getFornecedorByID(int id) throws Exception {
        String SQL = "SELECT * FROM fornecedor WHERE cd_fornecedor = ?";
        Object parameters[] = {id};

        ArrayList<Object[]> list = ConnectionManager.responseQuery(SQL, parameters);

        if (list.isEmpty()) {
            return null;
        } else {
            Object row[] = list.get(0);
            Fornecedor fornecedor = new Fornecedor(
                    (int) row[0],
                    (String) row[1],
                    (String) row[2]
            );

            return fornecedor;
        }
    }

    public static void addFornecedor(String nm_fornecedor, String nm_endereco) throws Exception {
        String SQL = "INSERT INTO fornecedor (nm_produto, endereco) "
                + "VALUES (?, ?)";

        Object parameters[] = {nm_fornecedor, nm_endereco};
        ConnectionManager.executeQuery(SQL, parameters);
    }

    public int getCd_fornecedor() {
        return cd_fornecedor;
    }

    public void setCd_fornecedor(int cd_fornecedor) {
        this.cd_fornecedor = cd_fornecedor;
    }

    public String getNm_fornecedor() {
        return nm_fornecedor;
    }

    public void setNm_fornecedor(String nm_fornecedor) {
        this.nm_fornecedor = nm_fornecedor;
    }

    public String getNm_endereco() {
        return nm_endereco;
    }

    public void setNm_endereco(String nm_endereco) {
        this.nm_endereco = nm_endereco;
    }

}
