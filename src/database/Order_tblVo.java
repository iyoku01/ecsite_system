package database;

/* Code Generator Information.
 * generator Version 1.0.0 release 2007/10/10
 * generated Date Mon Dec 04 11:18:15 JST 2017
 */
import java.io.Serializable;

/**
 * Order_tblVo.
 * @author ica
 * @version 1.0 
 * history 
 * Symbol	Date		Person		Note
 * [1]		2017/12/04	ica		Generated.
 */
public class Order_tblVo implements Serializable{

	public static final String TABLE = "ORDER_TBL";

	/**
	 * 注文番号:int(10) <Primary Key>
	 */
	private int order_id;

	/**
	 * ユーザー名:char(10)
	 */
	private String user_id;

	/**
	 * 注文日時:datetime(0)
	 */
	private java.sql.Timestamp date;

	/**
	 * 発送フラグ:bit(1)
	 */
	private boolean shipping;

	/**
	* Constractor
	*/
	public Order_tblVo(){}

	/**
	* Constractor
	* @param <code>order_id</code>
	*/
	public Order_tblVo(int order_id){
		this.order_id = order_id;
	}

	public int getOrder_id(){ return this.order_id; }

	public void setOrder_id(int order_id){ this.order_id = order_id; }

	public String getUser_id(){ return this.user_id; }

	public void setUser_id(String user_id){ this.user_id = user_id; }

	public java.sql.Timestamp getDate(){ return this.date; }

	public void setDate(java.sql.Timestamp date){ this.date = date; }

	public boolean getShipping(){ return this.shipping; }

	public void setShipping(boolean shipping){ this.shipping = shipping; }

	public String toString(){
		StringBuffer buffer = new StringBuffer();
		buffer.append("[Order_tblVo:");
		buffer.append(" order_id: ");
		buffer.append(order_id);
		buffer.append(" user_id: ");
		buffer.append(user_id);
		buffer.append(" date: ");
		buffer.append(date);
		buffer.append(" shipping: ");
		buffer.append(shipping);
		buffer.append("]");
		return buffer.toString();
	}

}
