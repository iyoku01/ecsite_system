package model;

import static model.Util.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import database.Category_tblVo;
import database.Hard_tblVo;
import database.Personal_mstVo;
import database.ProductDetailDto;
import database.ProductTopDto;
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
     * カテゴリーのリストを取得する
     * @return カテゴリーのリストを返す
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
     * ハードのリストを取得する
     * @param hard_id ハードID
     * @return ハードのリストを返す
     * @throws SQLException
     */
    public ArrayList<Hard_tblVo> getHardList(String hard_id) throws
            SQLException {
        System.out.println("\n/// getHardList()");

        String sql =
                "SELECT * FROM hard_tbl";

        if (hard_id != null) {
            sql += " WHERE hard_id=" + hard_id;
        }
        sql += " ORDER BY hard_id";

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
     * おすすめ商品のリストを取得する
     * @return おすすめ商品のリストを返す
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
     * トップ画面用の商品詳細とロゴ画像の取得(全て)
     * @param hardList ハードテーブル
     * @return 商品リストを返す
     * @throws SQLException
     */
    public ArrayList<ProductTopDto> getProductListAll(int hard_id)
            throws SQLException {
        System.out.println("\n/// getProductListAll()");

        ArrayList<ProductTopDto> ptdList = new ArrayList<ProductTopDto>();
        String sql = "SELECT";

        sql += " product_mst.product_id,product_name,price,stocks,comment,hard_id,category_id,ave_eval,pic_file FROM"
                + " product_mst join product_pic_tbl ON product_mst.product_id=product_PIc_tbl.product_id"
                + " WHERE (hard_id,pic_category) IN (SELECT ?,0 FROM product_mst GROUP BY product_id)"
                + " ORDER BY product_mst.product_id DESC";

        try (PreparedStatement pstatement = connection.prepareStatement(sql)) {

            pstatement.setInt(1, hard_id);
            System.out.println("--- sql = " + pstatement);
            ResultSet rs = pstatement.executeQuery();

            while (rs.next()) {
                ProductTopDto ptd = setProductTopDto(rs);
                ptdList.add(ptd);
            }
        }
        return ptdList;
    }

    /***
     * トップ画面用の商品詳細とロゴ画像の取得(カテゴリー検索)
     * @param hardList ハードテーブル
     * @param hard_id ハードID
     * @param category_id カテゴリーID
     * @return 商品リストを返す
     * @throws SQLException
     */
    public ArrayList<ProductTopDto> getProductListById(int hard_number, String hard_id, String category_id)
            throws SQLException {
        System.out.println("\n/// getProductListById()");

        ArrayList<ProductTopDto> ptdList = new ArrayList<ProductTopDto>();
        String sql = "SELECT";

        sql += " product_mst.product_id,product_name,price,stocks,comment,hard_id,category_id,ave_eval,pic_file FROM"
                + " product_mst join product_pic_tbl ON product_mst.product_id=product_pic_tbl.product_id"
                + " WHERE (hard_id,pic_category) IN (SELECT ?,0 FROM product_mst GROUP BY product_id)";

        if (category_id != null) {
            sql += " AND category_id=" + category_id;
        }
        sql += " ORDER BY product_mst.product_id DESC";

        try (PreparedStatement pstatement = connection.prepareStatement(sql)) {
            if (hard_number == Integer.parseInt(hard_id)) {
                pstatement.setString(1, hard_id);
                System.out.println("--- sql = " + pstatement);
                ResultSet rs = pstatement.executeQuery();
                while (rs.next()) {
                    ProductTopDto ptd = setProductTopDto(rs);
                    ptdList.add(ptd);
                }
            }
        }
        return ptdList;
    }

    /***
     * トップ画面用の商品詳細とロゴ画像の取得(ワード検索)
     * @param hardList ハードテーブル
     * @param convention_word 検索ワード
     * @return 商品リストを返す
     * @throws SQLException
     */
    public ArrayList<ProductTopDto> getProductListByWord(int hard_number, String convention_word)
            throws SQLException {
        System.out.println("\n/// getProductListByWord()");

        ArrayList<ProductTopDto> ptdList = new ArrayList<ProductTopDto>();

        String sql = "SELECT  * FROM product_mst JOIN conversion_tbl ON product_mst.product_id=conversion_tbl.product_id"
                + " JOIN product_pic_tbl ON product_pic_tbl.product_id=product_mst.product_id"
                + " WHERE (hard_id,pic_category) IN (SELECT ?,0 FROM product_mst GROUP BY product_id)"
                + " AND conversion_word LIKE '%" + convention_word + "%'"
                + " ORDER BY product_mst.product_id DESC";

        try (PreparedStatement pstatement = connection.prepareStatement(sql)) {

            pstatement.setInt(1, hard_number);
            System.out.println("--- sql = " + pstatement);
            ResultSet rs = pstatement.executeQuery();
            while (rs.next()) {
                ProductTopDto ptd = setProductTopDto(rs);
                ptdList.add(ptd);
            }
        }
        return ptdList;
    }

    /***
     * 便利アイテム getProductList〜で使用
     * @param rs sqlの実行結果
     * @return ハード毎の商品リストを返す
     * @throws SQLException
     */
    private ProductTopDto setProductTopDto(ResultSet rs) throws SQLException {
        ProductTopDto tpd = new ProductTopDto();
        tpd.setProduct_id(rs.getInt("product_id"));
        tpd.setProduct_name(rs.getString("product_name"));
        tpd.setPrice(rs.getInt("price"));
        tpd.setStocks(rs.getInt("stocks"));
        tpd.setComment(rs.getString("comment"));
        tpd.setHard_id(rs.getInt("hard_id"));
        tpd.setCategory_id(rs.getInt("category_id"));
        tpd.setAve_eval(rs.getInt("ave_eval"));
        tpd.setPic_file(rs.getString("pic_file"));
        return tpd;
    }

    /***
     * 商品詳細を取得する
     * @param product_id 商品ID
     * @return 商品詳細
     * @throws SQLException
     */
    public ProductDetailDto getProductDetail(String product_id) throws
            SQLException {
        System.out.println("\n/// getProductDetail()");

        ProductDetailDto ent = new ProductDetailDto();
        String sql = "SELECT * FROM product_mst"
                + " JOIN hard_tbl ON product_mst.hard_id = hard_tbl.hard_id "
                + " JOIN product_pic_tbl ON product_mst.product_id = product_pic_tbl.product_id"
                + " WHERE product_pic_tbl.pic_category=1 AND product_mst.product_id=?"
                + " ORDER BY product_mst.product_id";

        try (PreparedStatement pstatement = connection.prepareStatement(sql)) {
            pstatement.setString(1, product_id);
            System.out.println("--- sql = " + pstatement);
            ResultSet rs = pstatement.executeQuery();
            if (rs.next()) {
                ent.setProduct_id(rs.getInt("product_id"));
                ent.setProduct_name(rs.getString("product_name"));
                ent.setPrice(rs.getInt("price"));
                ent.setInfo(escapeHtml(rs.getString("info")));
                ent.setStocks(rs.getInt("stocks"));
                ent.setComment(escapeHtml(rs.getString("comment")));
                ent.setHard_id(rs.getInt("hard_id"));
                ent.setCategory_id(rs.getInt("category_id"));
                ent.setAve_eval(rs.getInt("ave_eval"));
                ent.setReview_count(rs.getInt("review_count"));
                ent.setMainPic_file(rs.getString("pic_file"));
                ent.setHard_name(rs.getString("hard_name"));
            }
        }
        return ent;
    }

    /***
     * 個人情報の取得
     * @param user_id
     * @param password
     * @return
     * @throws SQLException
     */
    public Personal_mstVo getPersonal(String user_id) throws
            SQLException {
        System.out.println("\n/// getPersonal()");

        Personal_mstVo ent = null;
        String sql = "SELECT user_id,password,name,nickname,phone,postal_code,address FROM personal_mst"
                + " WHERE user_id=?";

        try (PreparedStatement pstatement = connection.prepareStatement(sql)) {
            pstatement.setString(1, user_id);
            System.out.println("--- sql = " + pstatement);
            ResultSet rs = pstatement.executeQuery();
            if (rs.next()) {
                ent = new Personal_mstVo();
                ent.setUser_id(rs.getString("user_id"));
                ent.setPassword(rs.getString("password"));
                ent.setName(rs.getString("name"));
                ent.setNickname(rs.getString("nickname"));
                ent.setPhone(rs.getString("phone"));
                ent.setPostal_code(rs.getString("postal_code"));
                ent.setAddress(rs.getString("address"));
            }
        }
        return ent;
    }

    /***
     * 商品サブ画像のリストを返す
     * @param product_id 商品ID
     * @return 商品サブ画像のリストを返す
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

    /***
     * 個人情報登録
     * @param user_id
     * @param password
     * @param name
     * @param nickname
     * @param phone
     * @param postal_code
     * @param address
     * @throws SQLException
     */
    public void insertPersonalData(String user_id, String password, String name, String nickname, String phone,
            String postal_code, String address)
            throws SQLException {
        System.out.println("\n/// insertPersonalData()");

        String sql = "INSERT INTO ecsite_db.personal_mst ( user_id, password, name, nickname, phone, postal_code, address )"
                + " VALUES (?,?,?,?,?,?,?)";

        try (PreparedStatement pstatement = connection.prepareStatement(sql)) {
            pstatement.setString(1, user_id);
            pstatement.setString(2, password);
            pstatement.setString(3, name);
            pstatement.setString(4, nickname);
            pstatement.setString(5, phone);
            pstatement.setString(6, postal_code);
            pstatement.setString(7, address);
            System.out.println("--- sql = " + pstatement);
            pstatement.executeUpdate();
        }
    }

    /***
     * 登録情報の更新
     * @param user_id
     * @param password
     * @param name
     * @param nickname
     * @param phone
     * @param postal_code
     * @param address
     * @throws SQLException
     */
    public void updataPersonalData(String user_id, String password, String name, String nickname, String phone,
            String postal_code, String address)
            throws SQLException {
        System.out.println("\n/// insertPersonalData()");

        String sql = "UPDATE ecsite_db.personal_mst SET"
                + " password=?, name=?, nickname=?, phone=?, postal_code=?,address=? WHERE user_id=?";

        try (PreparedStatement pstatement = connection.prepareStatement(sql)) {
            pstatement.setString(1, password);
            pstatement.setString(2, name);
            pstatement.setString(3, nickname);
            pstatement.setString(4, phone);
            pstatement.setString(5, postal_code);
            pstatement.setString(6, address);
            pstatement.setString(7, user_id);
            pstatement.executeUpdate();
        }
    }

    /***
     * ログイン用データベースとの照合
     * @param user_id
     * @param password
     * @return 入力されたIDとパスワードがデータベースに存在すればtrue、そうでなければfalse
     * @throws SQLException
     */
    public boolean login(String user_id, String password) throws SQLException {
        System.out.println("\n/// login()");
        boolean personal = false;

        String sql =
                "SELECT user_id FROM personal_mst WHERE user_id =? AND password =?";

        try (PreparedStatement pstatement = connection.prepareStatement(sql)) {
            pstatement.setString(1, user_id);
            pstatement.setString(2, password);
            System.out.println("--- sql = " + pstatement);
            ResultSet rs = pstatement.executeQuery();

            if (rs.next()) {
                personal = true;
            }
        }
        return personal;
    }

    /***
     * 登録用IDの重複チェック
     * @param user_id
     * @return IDがすでにDBに登録されていればfalse 無ければtrue
     * @throws SQLException
     */
    public boolean checkId(String user_id) throws SQLException {
        System.out.println("\n/// checkId()");
        boolean personal = true;

        String sql =
                "SELECT user_id FROM personal_mst WHERE user_id =?";

        try (PreparedStatement pstatement = connection.prepareStatement(sql)) {
            pstatement.setString(1, user_id);
            System.out.println("--- sql = " + pstatement);
            ResultSet rs = pstatement.executeQuery();
            if (rs.next()) {
                personal = false;
            }
        }
        return personal;
    }
}
