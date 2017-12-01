package database;

/* Code Generator Information.
 * generator Version 1.0.0 release 2007/10/10
 * generated Date Fri Dec 01 10:26:35 JST 2017
 */
import java.io.Serializable;

/**
 * Product_pic_tblVo.
 * @author ica
 * @version 1.0 
 * history 
 * Symbol	Date		Person		Note
 * [1]		2017/12/01	ica		Generated.
 */
public class Product_pic_tblVo implements Serializable{

	public static final String TABLE = "PRODUCT_PIC_TBL";

	/**
	 * 商品ID:int(10) <Primary Key>
	 */
	private int product_id;

	/**
	 * 画像カテゴリ:int(10) <Primary Key>
	 */
	private int pic_category;

	/**
	 * サブ画像表示順:int(10) <Primary Key>
	 */
	private int pic_number;

	/**
	 * 画像ファイル名:varchar(20)
	 */
	private String pic_file;

	/**
	* Constractor
	*/
	public Product_pic_tblVo(){}

	/**
	* Constractor
	* @param <code>product_id</code>
	* @param <code>pic_category</code>
	* @param <code>pic_number</code>
	*/
	public Product_pic_tblVo(int product_id, int pic_category, int pic_number){
		this.product_id = product_id;
		this.pic_category = pic_category;
		this.pic_number = pic_number;
	}

	public int getProduct_id(){ return this.product_id; }

	public void setProduct_id(int product_id){ this.product_id = product_id; }

	public int getPic_category(){ return this.pic_category; }

	public void setPic_category(int pic_category){ this.pic_category = pic_category; }

	public int getPic_number(){ return this.pic_number; }

	public void setPic_number(int pic_number){ this.pic_number = pic_number; }

	public String getPic_file(){ return this.pic_file; }

	public void setPic_file(String pic_file){ this.pic_file = pic_file; }

	public String toString(){
		StringBuffer buffer = new StringBuffer();
		buffer.append("[Product_pic_tblVo:");
		buffer.append(" product_id: ");
		buffer.append(product_id);
		buffer.append(" pic_category: ");
		buffer.append(pic_category);
		buffer.append(" pic_number: ");
		buffer.append(pic_number);
		buffer.append(" pic_file: ");
		buffer.append(pic_file);
		buffer.append("]");
		return buffer.toString();
	}

}
