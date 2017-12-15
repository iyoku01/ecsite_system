package database;

import java.util.ArrayList;

public class ListTop {

    //トップ用のDtoTopProductをハード毎に保持する為のクラス
    private int hard_id;
    private String hard_name;
    private ArrayList<ProductTopDto> ptd;

    public int getHard_id() {
        return hard_id;
    }

    public void setHard_id(int hard_id) {
        this.hard_id = hard_id;
    }

    public String getHard_name() {
        return hard_name;
    }

    public void setHard_name(String hard_name) {
        this.hard_name = hard_name;
    }

    public ArrayList<ProductTopDto> getTpd() {
        return ptd;
    }

    public void setPtd(ArrayList<ProductTopDto> ptd) {
        this.ptd = ptd;
    }

}
