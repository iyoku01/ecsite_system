package database;

/* Code Generator Information.
 * generator Version 1.0.0 release 2007/10/10
 * generated Date Mon Dec 18 11:36:48 JST 2017
 */
import java.io.Serializable;

/**
 * Review_tblVo.
 * @author ica
 * @version 1.0
 * history
 * Symbol	Date		Person		Note
 * [1]		2017/12/18	ica		Generated.
 */
public class Review_tblVo implements Serializable {

    public static final String TABLE = "REVIEW_TBL";

    /**
     * レビューID:int(10) <Primary Key>
     */
    private int review_id;

    /**
     * 商品ID:int(10)
     */
    private int product_id;

    /**
     * ユーザーID:varchar(10)
     */
    private String user_id;

    /**
     * ニックネーム:varchar(20)
     */
    private String nickname;

    /**
     * 評価:int(10)
     */
    private int evaluation;

    /**
     * レビュー:text(65535)
     */
    private String review;

    /**
     * レビュー日時:datetime(0)
     */
    private java.sql.Timestamp date;

    /**
    * Constractor
    */
    public Review_tblVo() {
    }

    /**
    * Constractor
    * @param <code>review_id</code>
    */
    public Review_tblVo(int review_id) {
        this.review_id = review_id;
    }

    public int getReview_id() {
        return this.review_id;
    }

    public void setReview_id(int review_id) {
        this.review_id = review_id;
    }

    public int getProduct_id() {
        return this.product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getUser_id() {
        return this.user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getNickname() {
        return this.nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public int getEvaluation() {
        return this.evaluation;
    }

    public void setEvaluation(int evaluation) {
        this.evaluation = evaluation;
    }

    public String getReview() {
        return this.review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public java.sql.Timestamp getDate() {
        return this.date;
    }

    public void setDate(java.sql.Timestamp date) {
        this.date = date;
    }

    public String toString() {
        StringBuffer buffer = new StringBuffer();
        buffer.append("[Review_tblVo:");
        buffer.append(" review_id: ");
        buffer.append(review_id);
        buffer.append(" product_id: ");
        buffer.append(product_id);
        buffer.append(" user_id: ");
        buffer.append(user_id);
        buffer.append(" nickname: ");
        buffer.append(nickname);
        buffer.append(" evaluation: ");
        buffer.append(evaluation);
        buffer.append(" review: ");
        buffer.append(review);
        buffer.append(" date: ");
        buffer.append(date);
        buffer.append("]");
        return buffer.toString();
    }

}
