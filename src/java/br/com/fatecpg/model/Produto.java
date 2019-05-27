package br.com.fatecpg.model;

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

    public Produto(int cd_produto, String nm_produto, int qt_produto, double vl_custo, double vl_venda) {
        this.cd_produto = cd_produto;
        this.nm_produto = nm_produto;
        this.qt_produto = qt_produto;
        this.vl_custo = vl_custo;
        this.vl_venda = vl_venda;
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
}
