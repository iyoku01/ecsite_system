package database;

import java.util.ArrayList;

public class ListTop {

    //�g�b�v�p��DtoTopProduct���n�[�h���ɕێ�����ׂ̃N���X
    private int hard_id;
    private String hard_name;
    private ArrayList<ProductTopDto> tpd;

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
        return tpd;
    }

    public void setTpd(ArrayList<ProductTopDto> tpd) {
        this.tpd = tpd;
    }

}
