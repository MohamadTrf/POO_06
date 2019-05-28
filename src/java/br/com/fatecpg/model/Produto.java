package br.com.fatecpg.model;

import br.com.fatecpg.config.ConnectionManager;
import java.util.ArrayList;

/**
 *
 * @author Mulero
 */
public class Produto {

    private int cd_produto;
    private String nm_produto;
    private int qt_produto;
    private double vl_custo;
    private double vl_venda;

    private int pk_fornecedor;

    public Produto(int cd_produto, String nm_produto, int qt_produto, double vl_custo, double vl_venda, int pk_fornecedor) {
        this.cd_produto = cd_produto;
        this.nm_produto = nm_produto;
        this.qt_produto = qt_produto;
        this.vl_custo = vl_custo;
        this.vl_venda = vl_venda;
        this.pk_fornecedor = pk_fornecedor;
    }

    public static Produto getProdutoByID(int id) throws Exception {
        String SQL = "SELECT * FROM produto WHERE cd_produto = ?";
        Object parameters[] = {id};

        ArrayList<Object[]> list = ConnectionManager.responseQuery(SQL, parameters);

        if (list.isEmpty()) {
            return null;
        } else {
            Object row[] = list.get(0);
            Produto prod = new Produto(
                    (int) row[0],
                    (String) row[1],
                    (int) row[2],
                    (double) row[3],
                    (double) row[4],
                    (int) row[5]
            );

            return prod;
        }
    }
    
    public static void alterProduto(String nm_produto, int qt_produto, double vl_custo, double vl_venda,int cd_fornecedor,int cd_produto) throws Exception {
        String SQL = "UPDATE produto SET nm_produto = ?, qt_produto = ?, vl_custo= ?, vl_venda=?,cd_fornecedor=?  WHERE cd_produto = ?";
        Object parameters[] = {nm_produto, qt_produto, vl_custo, vl_venda,cd_fornecedor,cd_produto};
        ConnectionManager.executeQuery(SQL, parameters);
    }

    
    public static void deleteProduto(int cd_produto) throws Exception {
        String SQL = "DELETE FROM PRODUTO WHERE cd_produto= ?";
        Object parameters[] = {cd_produto};
        ConnectionManager.executeQuery(SQL, parameters);
    }

    public static ArrayList<Produto> getProdutos() throws Exception {
        String SQL = "SELECT * FROM produto";
        ArrayList<Produto> produtos = new ArrayList<>();
        ArrayList<Object[]> list = ConnectionManager.responseQuery(SQL, new Object[]{});

        for (int i = 0; i < list.size(); i++) {
            Object row[] = list.get(i);

            Produto p = new Produto(
                    (int) row[0],
                    (String) row[1],
                    (int) row[2],
                    (double) row[3],
                    (double) row[4],
                    (int) row[5]);

            produtos.add(p);
        }

        return produtos;
    }

    public static void addProduto(String nm_produto, int qt_produto, double vl_custo, double vl_venda, int pk_fornecedor) throws Exception {
        String SQL = "INSERT INTO produto(nm_produto, qt_produto, vl_custo, vl_venda, cd_fornecedor) "
                + "VALUES (?, ?, ?, ?, ?)";

        Object parameters[] = {nm_produto, qt_produto, vl_custo, vl_venda, pk_fornecedor};
        ConnectionManager.executeQuery(SQL, parameters);
    }

    public int getCd_produto() {
        return cd_produto;
    }

    public void setCd_produto(int cd_produto) {
        this.cd_produto = cd_produto;
    }

    public String getNm_produto() {
        return nm_produto;
    }

    public void setNm_produto(String nm_produto) {
        this.nm_produto = nm_produto;
    }

    public int getQt_produto() {
        return qt_produto;
    }

    public void setQt_produto(int qt_produto) {
        this.qt_produto = qt_produto;
    }

    public double getVl_custo() {
        return vl_custo;
    }

    public void setVl_custo(double vl_custo) {
        this.vl_custo = vl_custo;
    }

    public double getVl_venda() {
        return vl_venda;
    }

    public void setVl_venda(double vl_venda) {
        this.vl_venda = vl_venda;
    }

    public int getPk_fornecedor() {
        return pk_fornecedor;
    }

    public void setPk_fornecedor(int pk_fornecedor) {
        this.pk_fornecedor = pk_fornecedor;
    }
}
