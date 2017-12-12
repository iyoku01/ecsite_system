package database;

/* Code Generator Information.
 * generator Version 1.0.0 release 2007/10/10
 * generated Date Tue Dec 12 12:23:43 JST 2017
 */
import java.io.Serializable;

/**
 * Personal_mstVo.
 * @author ica
 * @version 1.0 
 * history 
 * Symbol	Date		Person		Note
 * [1]		2017/12/12	ica		Generated.
 */
public class Personal_mstVo implements Serializable{

	public static final String TABLE = "PERSONAL_MST";

	/**
	 * ユーザーID:char(10) <Primary Key>
	 */
	private String user_id;

	/**
	 * パスワード:varchar(24)
	 */
	private String password;

	/**
	 * 名前:varchar(30)
	 */
	private String name;

	/**
	 * ニックネーム:varchar(20)
	 */
	private String nickname;

	/**
	 * 電話番号:char(12)
	 */
	private String phone;

	/**
	 * 郵便番号:char(7)
	 */
	private String postal_code;

	/**
	 * 住所:varchar(50)
	 */
	private String address;

	/**
	* Constractor
	*/
	public Personal_mstVo(){}

	/**
	* Constractor
	* @param <code>user_id</code>
	*/
	public Personal_mstVo(String user_id){
		this.user_id = user_id;
	}

	public String getUser_id(){ return this.user_id; }

	public void setUser_id(String user_id){ this.user_id = user_id; }

	public String getPassword(){ return this.password; }

	public void setPassword(String password){ this.password = password; }

	public String getName(){ return this.name; }

	public void setName(String name){ this.name = name; }

	public String getNickname(){ return this.nickname; }

	public void setNickname(String nickname){ this.nickname = nickname; }

	public String getPhone(){ return this.phone; }

	public void setPhone(String phone){ this.phone = phone; }

	public String getPostal_code(){ return this.postal_code; }

	public void setPostal_code(String postal_code){ this.postal_code = postal_code; }

	public String getAddress(){ return this.address; }

	public void setAddress(String address){ this.address = address; }

	public String toString(){
		StringBuffer buffer = new StringBuffer();
		buffer.append("[Personal_mstVo:");
		buffer.append(" user_id: ");
		buffer.append(user_id);
		buffer.append(" password: ");
		buffer.append(password);
		buffer.append(" name: ");
		buffer.append(name);
		buffer.append(" nickname: ");
		buffer.append(nickname);
		buffer.append(" phone: ");
		buffer.append(phone);
		buffer.append(" postal_code: ");
		buffer.append(postal_code);
		buffer.append(" address: ");
		buffer.append(address);
		buffer.append("]");
		return buffer.toString();
	}

}
