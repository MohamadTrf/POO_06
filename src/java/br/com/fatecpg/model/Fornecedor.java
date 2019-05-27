package br.com.fatecpg.model;

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
