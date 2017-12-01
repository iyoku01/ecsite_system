package database;

/* Code Generator Information.
 * generator Version 1.0.0 release 2007/10/10
 * generated Date Fri Dec 01 10:26:33 JST 2017
 */
import java.io.Serializable;

/**
 * Hard_tblVo.
 * @author ica
 * @version 1.0 
 * history 
 * Symbol	Date		Person		Note
 * [1]		2017/12/01	ica		Generated.
 */
public class Hard_tblVo implements Serializable{

	public static final String TABLE = "HARD_TBL";

	/**
	 * ハードID:int(10) <Primary Key>
	 */
	private int hard_id;

	/**
	 * ハード名:varchar(20)
	 */
	private String hard_name;

	/**
	* Constractor
	*/
	public Hard_tblVo(){}

	/**
	* Constractor
	* @param <code>hard_id</code>
	*/
	public Hard_tblVo(int hard_id){
		this.hard_id = hard_id;
	}

	public int getHard_id(){ return this.hard_id; }

	public void setHard_id(int hard_id){ this.hard_id = hard_id; }

	public String getHard_name(){ return this.hard_name; }

	public void setHard_name(String hard_name){ this.hard_name = hard_name; }

	public String toString(){
		StringBuffer buffer = new StringBuffer();
		buffer.append("[Hard_tblVo:");
		buffer.append(" hard_id: ");
		buffer.append(hard_id);
		buffer.append(" hard_name: ");
		buffer.append(hard_name);
		buffer.append("]");
		return buffer.toString();
	}

}
