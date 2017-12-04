package database;

/* Code Generator Information.
 * generator Version 1.0.0 release 2007/10/10
 * generated Date Mon Dec 04 11:18:16 JST 2017
 */
import java.io.Serializable;

/**
 * Product_mstVo.
 * @author ica
 * @version 1.0 
 * history 
 * Symbol	Date		Person		Note
 * [1]		2017/12/04	ica		Generated.
 */
public class Product_mstVo implements Serializable{

	public static final String TABLE = "PRODUCT_MST";

	/**
	 * 商品ID:int(10) <Primary Key>
	 */
	private int product_id;

	/**
	 * 商品名:varchar(30)
	 */
	private String product_name;

	/**
	 * 金額:int(10)
	 */
	private int price;

	/**
	 * 在庫数:mediumint(7)
	 */
	private int stocks;

	/**
	 * コメント:text(65535)
	 */
	private String comment;

	/**
	 * ハードID:int(10)
	 */
	private int hard_id;

	/**
	 * カテゴリーID:int(10)
	 */
	private int category_id;

	/**
	 * 平均評価:float(12)
	 */
	private float ave_eval;

	/**
	* Constractor
	*/
	public Product_mstVo(){}

	/**
	* Constractor
	* @param <code>product_id</code>
	*/
	public Product_mstVo(int product_id){
		this.product_id = product_id;
	}

	public int getProduct_id(){ return this.product_id; }

	public void setProduct_id(int product_id){ this.product_id = product_id; }

	public String getProduct_name(){ return this.product_name; }

	public void setProduct_name(String product_name){ this.product_name = product_name; }

	public int getPrice(){ return this.price; }

	public void setPrice(int price){ this.price = price; }

	public int getStocks(){ return this.stocks; }

	public void setStocks(int stocks){ this.stocks = stocks; }

	public String getComment(){ return this.comment; }

	public void setComment(String comment){ this.comment = comment; }

	public int getHard_id(){ return this.hard_id; }

	public void setHard_id(int hard_id){ this.hard_id = hard_id; }

	public int getCategory_id(){ return this.category_id; }

	public void setCategory_id(int category_id){ this.category_id = category_id; }

	public float getAve_eval(){ return this.ave_eval; }

	public void setAve_eval(float ave_eval){ this.ave_eval = ave_eval; }

	public String toString(){
		StringBuffer buffer = new StringBuffer();
		buffer.append("[Product_mstVo:");
		buffer.append(" product_id: ");
		buffer.append(product_id);
		buffer.append(" product_name: ");
		buffer.append(product_name);
		buffer.append(" price: ");
		buffer.append(price);
		buffer.append(" stocks: ");
		buffer.append(stocks);
		buffer.append(" comment: ");
		buffer.append(comment);
		buffer.append(" hard_id: ");
		buffer.append(hard_id);
		buffer.append(" category_id: ");
		buffer.append(category_id);
		buffer.append(" ave_eval: ");
		buffer.append(ave_eval);
		buffer.append("]");
		return buffer.toString();
	}

}
