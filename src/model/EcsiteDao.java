package model;

import static model.Util.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import database.Category_tblVo;
import database.Hard_tblVo;
import database.HistoryDto;
import database.Personal_mstVo;
import database.ProductDetailDto;
import database.ProductTopDto;
import database.Recommend_tblVo;
import database.Review_tblVo;

/***
 * Dao
 * @author takehara
 *
 */
public class EcsiteDao implements AutoCloseable {

    protected Connection connection;

    public EcsiteDao() throws ClassNotFoundException, SQLException {
        System.out.println("--- connection.open");
        //Tomcat JDBC POOL��DBCP�ƈقȂ�A�A�v���P�[�V������WEB-INF/lib�Ƀ��C�u������u���Ă����[�h����Ȃ����߁AClass.forName()���L�q
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
     * �J�e�S���[�̃��X�g���擾����
     * @return �J�e�S���[�̃��X�g��Ԃ�
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
     * �n�[�h�̃��X�g���擾����
     * @param hard_id �n�[�hID
     * @return �n�[�h�̃��X�g��Ԃ�
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
     * �������ߏ��i�̃��X�g���擾����
     * @return �������ߏ��i�̃��X�g��Ԃ�
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
     * �g�b�v��ʗp�̏��i�ڍׂƃ��S�摜�̎擾(�S��)
     * @param hardList �n�[�h�e�[�u��
     * @return ���i���X�g��Ԃ�
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
     * �g�b�v��ʗp�̏��i�ڍׂƃ��S�摜�̎擾(�J�e�S���[����)
     * @param hardList �n�[�h�e�[�u��
     * @param hard_id �n�[�hID
     * @param category_id �J�e�S���[ID
     * @return ���i���X�g��Ԃ�
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
     * �g�b�v��ʗp�̏��i�ڍׂƃ��S�摜�̎擾(���[�h����)
     * @param hardList �n�[�h�e�[�u��
     * @param convention_word �������[�h
     * @return ���i���X�g��Ԃ�
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
     * �֗��A�C�e�� getProductList�`�Ŏg�p
     * @param rs sql�̎��s����
     * @return �n�[�h���̏��i���X�g��Ԃ�
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
     * ���i�ڍׂ��擾����
     * @param product_id ���iID
     * @return ���i�ڍ�
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
     * �l���̎擾
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
                ent.setName(escapeHtml(rs.getString("name")));
                ent.setNickname(escapeHtml(rs.getString("nickname")));
                ent.setPhone(rs.getString("phone"));
                ent.setPostal_code(rs.getString("postal_code"));
                ent.setAddress(escapeHtml(rs.getString("address")));
            }
        }
        return ent;
    }

    /***
     * ���i�T�u�摜�̃��X�g��Ԃ�
     * @param product_id ���iID
     * @return ���i�T�u�摜�̃��X�g��Ԃ�
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
     * �l���o�^
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

        String sql = "INSERT INTO personal_mst ( user_id, password, name, nickname, phone, postal_code, address )"
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
     * �o�^���̍X�V
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

        String sql = "UPDATE personal_mst SET"
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
     * ���O�C���p�f�[�^�x�[�X�Ƃ̏ƍ�
     * @param user_id
     * @param password
     * @return ���͂��ꂽID�ƃp�X���[�h���f�[�^�x�[�X�ɑ��݂����true�A�����łȂ����false
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
     * �o�^�pID�̏d���`�F�b�N
     * @param user_id
     * @return ID�����ł�DB�ɓo�^����Ă����false �������true
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

    /***
     * �w�������̎擾
     * @param user_id
     * @return �w���������i���X�g
     * @throws SQLException
     */
    public ArrayList<HistoryDto> getHistoryList(String user_id) throws SQLException {
        System.out.println("\n/// getHistoryList()");

        ArrayList<HistoryDto> historyList;

        String sql =
                "SELECT date,order_tbl.order_id,product_mst.product_id,product_name,price,number,pic_file,shipping FROM personal_mst"
                        + " JOIN order_tbl ON personal_mst.user_id=order_tbl.user_id"
                        + " JOIN order_product_tbl ON order_tbl.order_id=order_product_tbl.order_id"
                        + " JOIN product_mst ON order_product_tbl.product_id=product_mst.product_id"
                        + " JOIN product_pic_tbl ON product_mst.product_id= product_pic_tbl.product_id"
                        + " WHERE (order_tbl.user_id, pic_category) IN (SELECT ?,1 FROM order_tbl"
                        + " JOIN order_product_tbl ON order_tbl.order_id=order_product_tbl.order_id"
                        + " JOIN product_pic_tbl ON order_product_tbl.product_id=product_pic_tbl.product_id"
                        + " GROUP BY order_product_tbl.product_id) ORDER BY date DESC";

        try (PreparedStatement pstatement = connection.prepareStatement(sql)) {
            pstatement.setString(1, user_id);
            System.out.println("--- sql = " + pstatement);
            ResultSet rs = pstatement.executeQuery();
            historyList = new ArrayList<HistoryDto>();
            if (rs.next()) {
                HistoryDto ent = new HistoryDto();
                ent.setDate(rs.getString("date"));
                ent.setOrder_id(rs.getInt("order_id"));
                ent.setProduct_id(rs.getInt("product_id"));
                ent.setProduct_name(rs.getString("product_name"));
                ent.setPrice(rs.getInt("price"));
                ent.setNumber(rs.getInt("number"));
                ent.setShipping(rs.getBoolean("shipping"));
                historyList.add(ent);
            }
        }
        return historyList;
    }

    /***
     * ���r���[�L���p���[�U�[�����i���w�����Ă��邩�`�F�b�N
     * @param user_id
     * @param product_id
     * @return �w���������Ƃ̂��鏤�i�ł����true �����łȂ����false
     * @throws SQLException
     */
    public boolean checkWriteReview(String user_id, String product_id) throws SQLException {
        System.out.println("\n/// checkWriteReview()");

        boolean writeReview = false;
        String sql =
                "SELECT user_id FROM order_tbl"
                        + " JOIN order_product_tbl ON order_tbl.order_id=order_product_tbl.order_id"
                        + " WHERE user_id=? AND product_id=?";

        try (PreparedStatement pstatement = connection.prepareStatement(sql)) {
            pstatement.setString(1, user_id);
            pstatement.setString(2, product_id);
            System.out.println("--- sql = " + pstatement);
            ResultSet rs = pstatement.executeQuery();

            if (rs.next()) {
                writeReview = true;
            }
        }
        return writeReview;
    }

    /***
     * ���iID�ɑ΂��郌�r���[�ꗗ�̎擾
     * @param product_id
     * @return ���r���[�̃��X�g
     * @throws SQLException
     */
    public ArrayList<Review_tblVo> getReviewList(String product_id) throws
            SQLException {
        System.out.println("\n/// getReviewList()");

        ArrayList<Review_tblVo> reviewList = null;
        String sql = "SELECT review_id,product_id,user_id,nickname,evaluation,review,date FROM review_tbl"
                + " WHERE product_id=? ORDER BY review_id DESC";

        try (PreparedStatement pstatement = connection.prepareStatement(sql)) {
            pstatement.setString(1, product_id);
            System.out.println("--- sql = " + pstatement);
            ResultSet rs = pstatement.executeQuery();
            reviewList = new ArrayList<Review_tblVo>();
            while (rs.next()) {
                Review_tblVo ent = new Review_tblVo();
                ent.setReview_id(rs.getInt("review_id"));
                ent.setProduct_id(rs.getInt("product_id"));
                ent.setUser_id(rs.getString("user_id"));
                ent.setNickname(escapeHtml(rs.getString("nickname")));
                ent.setEvaluation(rs.getInt("evaluation"));
                ent.setReview(escapeHtml(rs.getString("review")));
                ent.setDate(rs.getTimestamp("date"));
                reviewList.add(ent);
            }
        }
        return reviewList;
    }

    /***
     * ���r���[��ǉ�����
     * @param product_id
     * @param user_id
     * @param nickname
     * @param evaluation
     * @param review
     * @throws SQLException
     */
    public void insertReview(String product_id, String user_id, String nickname, String evaluation, String review)
            throws SQLException {
        System.out.println("\n/// insertReview()");

        String sql = "INSERT INTO review_tbl (product_id, user_id, nickname, evaluation, review, date)"
                + " VALUES (?,?,?,?,?,now())";

        try (PreparedStatement pstatement = connection.prepareStatement(sql)) {
            pstatement.setString(1, product_id);
            pstatement.setString(2, user_id);
            pstatement.setString(3, nickname);
            pstatement.setString(4, evaluation);
            pstatement.setString(5, review);
            System.out.println("--- sql = " + pstatement);
            pstatement.executeUpdate();
        }
    }

    /***
    <<<<<<< HEAD
     * ���O�C�����[�U�[�̃��r���[���擾
     * @param product_id
     * @param user_id
     * @return ���i�ɑ΂��郍�O�C�����[�U�[�̃��r���[
     * @throws SQLException
     */
    public Review_tblVo getReview(String product_id, String user_id) throws
            SQLException {
        System.out.println("\n/// getReview()");

        Review_tblVo review = null;
        String sql = "SELECT review_id,product_id,user_id,nickname,evaluation,review,date FROM review_tbl"
                + " WHERE product_id=? AND user_id=?";

        try (PreparedStatement pstatement = connection.prepareStatement(sql)) {
            pstatement.setString(1, product_id);
            pstatement.setString(2, user_id);
            System.out.println("--- sql = " + pstatement);
            ResultSet rs = pstatement.executeQuery();

            if (rs.next()) {
                review = new Review_tblVo();
                review.setReview_id(rs.getInt("review_id"));
                review.setProduct_id(rs.getInt("product_id"));
                review.setUser_id(rs.getString("user_id"));
                review.setNickname(escapeHtml(rs.getString("nickname")));
                review.setEvaluation(rs.getInt("evaluation"));
                review.setReview(escapeHtml(rs.getString("review")));
                review.setDate(rs.getTimestamp("date"));
            }
        }
        return review;
    }

    /***
     * ���r���[�̍X�V
     * @param product_id
     * @param user_id
     * @param nickname
     * @param evaluation
     * @param review
     * @throws SQLException
     */
    public void updateReview(String product_id, String user_id, String nickname, String evaluation, String review)
            throws SQLException {
        System.out.println("\n/// updataReview()");

        String sql = "UPDATE review_tbl SET"
                + " nickname=?, evaluation=?, review=?, date=now() WHERE user_id=? AND product_id=?";

        try (PreparedStatement pstatement = connection.prepareStatement(sql)) {
            pstatement.setString(1, nickname);
            pstatement.setString(2, evaluation);
            pstatement.setString(3, review);
            pstatement.setString(4, user_id);
            pstatement.setString(5, product_id);
            pstatement.executeUpdate();
        }
    }

    /*
         * ����TBL�A�������iTBL�ɒǉ�����
         * @param user_id ���[�UID
         * @param cart �J�[�g���
         * @return ����ID
         * @throws SQLException
         */
    public int insertOrder(String user_id, Cart cart)
            throws SQLException {
        System.out.println("\n/// insertOrder()");

        String sql;
        int order_Id = 0;

        connection.setAutoCommit(false);

        sql = "INSERT INTO order_tbl (user_id, date, shipping)"
                + " VALUES (?, now(), 0)";
        try (PreparedStatement pstatement = connection.prepareStatement(sql)) {
            pstatement.setString(1, user_id);
            System.out.println("--- sql = " + pstatement);
            pstatement.executeUpdate();
        }

        sql = "SELECT DISTINCT LAST_INSERT_ID() order_id FROM order_tbl";
        try (PreparedStatement pstatement = connection.prepareStatement(sql)) {
            System.out.println("--- sql = " + pstatement);
            ResultSet rs = pstatement.executeQuery();
            if (rs.next()) {
                order_Id = rs.getInt("order_id");
            }
        }

        sql = "INSERT INTO order_product_tbl (order_id, product_id, number)"
                + " VALUES (?, ?, ?)";
        try (PreparedStatement pstatement = connection.prepareStatement(sql)) {
            for (Map.Entry<Integer, Integer> mapEntry : cart.getCartMap().entrySet()) {
                pstatement.setInt(1, order_Id);
                pstatement.setInt(2, mapEntry.getKey());
                pstatement.setInt(3, mapEntry.getValue());
                System.out.println("--- sql = " + pstatement);
                pstatement.executeUpdate();
            }
        }

        connection.commit();

        return order_Id;

    }

    /***
     * �w�肵�����iID�̕]�����ς��X�V����
     * @param product_id
     * @throws SQLException
     */
    public void updateEvaluation(String product_id)
            throws SQLException {
        System.out.println("\n/// updataEvaluation()");

        String sql = "UPDATE product_mst SET"
                + " ave_eval=(SELECT AVG(evaluation) FROM review_tbl WHERE product_id=?) WHERE product_id=?";

        try (PreparedStatement pstatement = connection.prepareStatement(sql)) {
            pstatement.setString(1, product_id);
            pstatement.setString(2, product_id);
            pstatement.executeUpdate();
        }
    }
}
