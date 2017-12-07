package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import database.Category_tblVo;
import database.Hard_tblVo;
import database.ProductDetailDto;
import database.Recommend_tblVo;

/***
 * Dao
 * @author takehara
 *
 */
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

    /***
     * カテゴリーの取得
     * @return
     * @throws SQLException
     */
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

    /***
     * ハードの取得
     * @return
     * @throws SQLException
     */
    public ArrayList<Hard_tblVo> getHardList() throws
            SQLException {
        System.out.println("\n/// getHardList()");

        String sql =
                "SELECT * FROM hard_tbl" +
                        " ORDER BY hard_id";

        ArrayList<Hard_tblVo> entList = new ArrayList<Hard_tblVo>();
        try (PreparedStatement pstatement = connection.prepareStatement(sql)) {
            System.out.println("--- sql = " + pstatement);
            ResultSet rs = pstatement.executeQuery();
            while (rs.next()) {
                Hard_tblVo ent = new Hard_tblVo();
                ent.setHard_id(rs.getInt("hard_id"));
                ent.setHard_name(rs.getString("hard_name"));
                entList.add(ent);
            }
        }
        return entList;
    }

    /***
     * おすすめ商品の取得
     * @return
     * @throws SQLException
     */
    public ArrayList<Recommend_tblVo> getRecommendList() throws
            SQLException {
        System.out.println("\n/// getRecommendList()");

        String sql =
                "SELECT * FROM recommend_tbl";

        ArrayList<Recommend_tblVo> entList = new ArrayList<Recommend_tblVo>();
        try (PreparedStatement pstatement = connection.prepareStatement(sql)) {
            System.out.println("--- sql = " + pstatement);
            ResultSet rs = pstatement.executeQuery();
            while (rs.next()) {
                Recommend_tblVo ent = new Recommend_tblVo();
                ent.setProduct_id(rs.getInt("product_id"));
                ent.setRecommend_pic(rs.getString("recommend_pic"));
                entList.add(ent);
            }
        }
        return entList;
    }

    /***
     * トップ画面用の商品IDとロゴ画像の取得
     * @param hard_id
     * @param category_id
     * @param convention_word
     * @return
     * @throws SQLException
     */
    /*
    public ArrayList<DtoTopProduct> getProductList(String hard_id, String category_id, String convention_word)
            throws SQLException {
        System.out.println("\n/// getProductList()");

        return entList;
    }
    */

    /***
     * 指定した商品IDのレコードを商品マスタから取得
     * @param product_id
     * @return
     * @throws SQLException
     */
    public ProductDetailDto getProductDetail(String product_id) throws
            SQLException {
        System.out.println("\n/// getProductDetail()");

        ProductDetailDto ent = new ProductDetailDto();
        String sql = "SELECT * FROM product_mst" +
                " JOIN product_pic_tbl ON product_mst.product_id = product_pic_tbl.product_id " +
                " WHERE product_pic_tbl.pic_category=1 AND product_mst.product_id=?";

        try (PreparedStatement pstatement = connection.prepareStatement(sql)) {
            pstatement.setString(1, product_id);
            System.out.println("--- sql = " + pstatement);
            ResultSet rs = pstatement.executeQuery();
            if (rs.next()) {
                ent.setProduct_id(rs.getInt("product_id"));
                ent.setProduct_name(rs.getString("product_name"));
                ent.setPrice(rs.getInt("price"));
                ent.setStocks(rs.getInt("stocks"));
                ent.setComment(rs.getString("comment"));
                ent.setHard_id(rs.getInt("hard_id"));
                ent.setCategory_id(rs.getInt("category_id"));
                ent.setAve_eval(rs.getInt("ave_eval"));
                ent.setReview_count(rs.getInt("review_count"));
                ent.setMainPic_file(rs.getString("pic_file"));
            }
        }
        return ent;
    }

    /***
     * 商品の画像取得
     * @param product_id
     * @param pic_category ロゴ画像＝０　メイン画像＝１　サブ画像＝２
     * @return
     * @throws SQLException
     */
    public ArrayList<String> getProductSubPicList(String product_id) throws
            SQLException {
        System.out.println("\n/// getProductPicList()");

        String sql = "SELECT * FROM product_pic_tbl WHERE product_id=? AND pic_category=2 ORDER BY pic_number";

        ArrayList<String> entList = new ArrayList<String>();
        try (PreparedStatement pstatement = connection.prepareStatement(sql)) {
            pstatement.setString(1, product_id);
            System.out.println("--- sql = " + pstatement);
            ResultSet rs = pstatement.executeQuery();
            while (rs.next()) {
                entList.add(rs.getString("pic_file"));
            }
        }
        return entList;
    }

}
