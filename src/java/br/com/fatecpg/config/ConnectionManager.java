package br.com.fatecpg.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author MohamadTarif
 */
public class ConnectionManager {

    private static Connection con = null;
    private static PreparedStatement prestmt = null;
    private static ResultSet rs = null;

    private static final String DRIVER = "org.apache.derby.jdbc.ClientDriver";
    private static final String URL = "jdbc:derby://localhost:1527/loja";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    public static void executeQuery(String SQL, Object[] parameters) throws Exception {
        Class.forName(DRIVER);

        con = DriverManager.getConnection(URL, USER, PASSWORD);
        prestmt = con.prepareStatement(SQL);

        for (int i = 0; i < parameters.length; i++) {
            prestmt.setObject(i + 1, parameters[i]);
        }

        prestmt.execute();
        prestmt.close();
    }

    public static ArrayList<Object[]> responseQuery(String SQL, Object[] parameters) throws Exception {
        ArrayList<Object[]> list = new ArrayList<>();
        Class.forName(DRIVER);

        con = DriverManager.getConnection(URL, USER, PASSWORD);
        prestmt = con.prepareStatement(SQL);

        for (int i = 0; i < parameters.length; i++) {
            prestmt.setObject(i + 1, parameters[i]);
        }

        rs = prestmt.executeQuery();

        while (rs.next()) {
            Object row[] = new Object[rs.getMetaData().getColumnCount()]; // retorna qtd de colunas
            for (int i = 0; i < rs.getMetaData().getColumnCount(); i++) {
                row[i] = rs.getObject(i + 1);
            }
            list.add(row);
        }

        rs.close();
        prestmt.close();
        con.close();

        return list;
    }
}
