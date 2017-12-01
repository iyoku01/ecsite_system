package database;

/* Code Generator Information.
 * generator Version 1.0.0 release 2007/10/10
 * generated Date Fri Dec 01 10:26:33 JST 2017
 */
import java.io.Serializable;

/**
 * History_tblVo.
 * @author ica
 * @version 1.0 
 * history 
 * Symbol	Date		Person		Note
 * [1]		2017/12/01	ica		Generated.
 */
public class History_tblVo implements Serializable{

	public static final String TABLE = "HISTORY_TBL";

	/**
	 * user_id:char(10) <Primary Key>
	 */
	private String user_id;

	/**
	 * order_date:datetime(0) <Primary Key>
	 */
	private java.sql.Timestamp order_date;

	/**
	 * order_id:int(10)
	 */
	private int order_id;

	/**
	 * shipping:bit(1)
	 */
	private boolean shipping;

	/**
	* Constractor
	*/
	public History_tblVo(){}

	/**
	* Constractor
	* @param <code>user_id</code>
	* @param <code>order_date</code>
	*/
	public History_tblVo(String user_id, java.sql.Timestamp order_date){
		this.user_id = user_id;
		this.order_date = order_date;
	}

	public String getUser_id(){ return this.user_id; }

	public void setUser_id(String user_id){ this.user_id = user_id; }

	public java.sql.Timestamp getOrder_date(){ return this.order_date; }

	public void setOrder_date(java.sql.Timestamp order_date){ this.order_date = order_date; }

	public int getOrder_id(){ return this.order_id; }

	public void setOrder_id(int order_id){ this.order_id = order_id; }

	public boolean getShipping(){ return this.shipping; }

	public void setShipping(boolean shipping){ this.shipping = shipping; }

	public String toString(){
		StringBuffer buffer = new StringBuffer();
		buffer.append("[History_tblVo:");
		buffer.append(" user_id: ");
		buffer.append(user_id);
		buffer.append(" order_date: ");
		buffer.append(order_date);
		buffer.append(" order_id: ");
		buffer.append(order_id);
		buffer.append(" shipping: ");
		buffer.append(shipping);
		buffer.append("]");
		return buffer.toString();
	}

}
