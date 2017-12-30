package database;

/* Code Generator Information.
 * generator Version 1.0.0 release 2007/10/10
 * generated Date Mon Dec 04 11:18:14 JST 2017
 */
import java.io.Serializable;

/**
 * Conversion_tblVo.
 * @author ica
 * @version 1.0 
 * history 
 * Symbol	Date		Person		Note
 * [1]		2017/12/04	ica		Generated.
 */
public class Conversion_tblVo implements Serializable{

	public static final String TABLE = "CONVERSION_TBL";

	/**
	 * è§ïiID:int(10) <Primary Key>
	 */
	private int product_id;

	/**
	 * è§ïiï ñº:text(65535)
	 */
	private String conversion_word;

	/**
	* Constractor
	*/
	public Conversion_tblVo(){}

	/**
	* Constractor
	* @param <code>product_id</code>
	*/
	public Conversion_tblVo(int product_id){
		this.product_id = product_id;
	}

	public int getProduct_id(){ return this.product_id; }

	public void setProduct_id(int product_id){ this.product_id = product_id; }

	public String getConversion_word(){ return this.conversion_word; }

	public void setConversion_word(String conversion_word){ this.conversion_word = conversion_word; }

	public String toString(){
		StringBuffer buffer = new StringBuffer();
		buffer.append("[Conversion_tblVo:");
		buffer.append(" product_id: ");
		buffer.append(product_id);
		buffer.append(" conversion_word: ");
		buffer.append(conversion_word);
		buffer.append("]");
		return buffer.toString();
	}

}
