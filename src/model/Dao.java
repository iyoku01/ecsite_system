package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dao implements AutoCloseable {

    protected Connection connection;

    public Dao() throws ClassNotFoundException, SQLException {
        System.out.println("--- connection.open");
        //Tomcat JDBC POOLはDBCPと異なり、アプリケーションのWEB-INF/libにライブラリを置いてもロードされません
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/bbs_db"
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
}
