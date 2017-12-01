package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import database.Category_tblVo;

public class EcsiteDao implements AutoCloseable {

    protected Connection connection;

    public EcsiteDao() throws ClassNotFoundException, SQLException {
        System.out.println("--- connection.open");
        //Tomcat JDBC POOLはDBCPと異なり、アプリケーションのWEB-INF/libにライブラリを置いてもロードされないため、Class.forName()を記述
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/ecsite_db"
                        + "?user=Mulder&password=TrustNo1"
                        + "&useUnicode=true&characterEncoding=MS932");
    }

    @Override
    public void close() {
        System.out.println("--- connection.close");
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Category_tblVo> getCategoryList() throws
            SQLException {
        System.out.println("\n/// getCategoryList()");

        String sql =
                "SELECT * FROM category_tbl" +
                        " ORDER BY category_id";

        ArrayList<Category_tblVo> entList = new ArrayList<Category_tblVo>();
        try (PreparedStatement pstatement = connection.prepareStatement(sql)) {
            System.out.println("--- sql = " + pstatement);
            ResultSet rs = pstatement.executeQuery();
            while (rs.next()) {
                Category_tblVo ent = new Category_tblVo();
                ent.setCategory_id(rs.getInt("category_id"));
                ent.setCategory_name(rs.getString("category_name"));
                entList.add(ent);
            }
        }
        return entList;
    }
}
