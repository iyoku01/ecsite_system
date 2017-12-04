package database;

/* Code Generator Information.
 * generator Version 1.0.0 release 2007/10/10
 * generated Date Mon Dec 04 11:18:15 JST 2017
 */
import java.io.Serializable;

/**
 * Order_product_tblVo.
 * @author ica
 * @version 1.0 
 * history 
 * Symbol	Date		Person		Note
 * [1]		2017/12/04	ica		Generated.
 */
public class Order_product_tblVo implements Serializable{

	public static final String TABLE = "ORDER_PRODUCT_TBL";

	/**
	 * íçï∂î‘çÜ:int(10) <Primary Key>
	 */
	private int order_id;

	/**
	 * è§ïiî‘çÜ:int(10) <Primary Key>
	 */
	private int product_id;

	/**
	 * å¬êî:int(10)
	 */
	private int number;

	/**
	* Constractor
	*/
	public Order_product_tblVo(){}

	/**
	* Constractor
	* @param <code>order_id</code>
	* @param <code>product_id</code>
	*/
	public Order_product_tblVo(int order_id, int product_id){
		this.order_id = order_id;
		this.product_id = product_id;
	}

	public int getOrder_id(){ return this.order_id; }

	public void setOrder_id(int order_id){ this.order_id = order_id; }

	public int getProduct_id(){ return this.product_id; }

	public void setProduct_id(int product_id){ this.product_id = product_id; }

	public int getNumber(){ return this.number; }

	public void setNumber(int number){ this.number = number; }

	public String toString(){
		StringBuffer buffer = new StringBuffer();
		buffer.append("[Order_product_tblVo:");
		buffer.append(" order_id: ");
		buffer.append(order_id);
		buffer.append(" product_id: ");
		buffer.append(product_id);
		buffer.append(" number: ");
		buffer.append(number);
		buffer.append("]");
		return buffer.toString();
	}

}
