package database;

/* Code Generator Information.
 * generator Version 1.0.0 release 2007/10/10
 * generated Date Mon Dec 04 11:18:17 JST 2017
 */
import java.io.Serializable;

/**
 * Recommend_tblVo.
 * @author ica
 * @version 1.0 
 * history 
 * Symbol	Date		Person		Note
 * [1]		2017/12/04	ica		Generated.
 */
public class Recommend_tblVo implements Serializable{

	public static final String TABLE = "RECOMMEND_TBL";

	/**
	 * 商品ID:int(10) <Primary Key>
	 */
	private int product_id;

	/**
	 * おすすめ商品画像ファイル名:varchar(20)
	 */
	private String recommend_pic;

	/**
	* Constractor
	*/
	public Recommend_tblVo(){}

	/**
	* Constractor
	* @param <code>product_id</code>
	*/
	public Recommend_tblVo(int product_id){
		this.product_id = product_id;
	}

	public int getProduct_id(){ return this.product_id; }

	public void setProduct_id(int product_id){ this.product_id = product_id; }

	public String getRecommend_pic(){ return this.recommend_pic; }

	public void setRecommend_pic(String recommend_pic){ this.recommend_pic = recommend_pic; }

	public String toString(){
		StringBuffer buffer = new StringBuffer();
		buffer.append("[Recommend_tblVo:");
		buffer.append(" product_id: ");
		buffer.append(product_id);
		buffer.append(" recommend_pic: ");
		buffer.append(recommend_pic);
		buffer.append("]");
		return buffer.toString();
	}

}
