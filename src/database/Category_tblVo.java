package database;

/* Code Generator Information.
 * generator Version 1.0.0 release 2007/10/10
 * generated Date Mon Dec 04 11:18:13 JST 2017
 */
import java.io.Serializable;

/**
 * Category_tblVo.
 * @author ica
 * @version 1.0 
 * history 
 * Symbol	Date		Person		Note
 * [1]		2017/12/04	ica		Generated.
 */
public class Category_tblVo implements Serializable{

	public static final String TABLE = "CATEGORY_TBL";

	/**
	 * カテゴリーID:int(10) <Primary Key>
	 */
	private int category_id;

	/**
	 * カテゴリー名:varchar(20)
	 */
	private String category_name;

	/**
	* Constractor
	*/
	public Category_tblVo(){}

	/**
	* Constractor
	* @param <code>category_id</code>
	*/
	public Category_tblVo(int category_id){
		this.category_id = category_id;
	}

	public int getCategory_id(){ return this.category_id; }

	public void setCategory_id(int category_id){ this.category_id = category_id; }

	public String getCategory_name(){ return this.category_name; }

	public void setCategory_name(String category_name){ this.category_name = category_name; }

	public String toString(){
		StringBuffer buffer = new StringBuffer();
		buffer.append("[Category_tblVo:");
		buffer.append(" category_id: ");
		buffer.append(category_id);
		buffer.append(" category_name: ");
		buffer.append(category_name);
		buffer.append("]");
		return buffer.toString();
	}

}
