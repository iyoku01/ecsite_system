package database;

public class ProductDetailDto extends Product_mstVo {
    private String hard_name; //ハード名
    private String mainPic_file; //メイン画像

    public String getHard_name() {
        return hard_name;
    }

    public void setHard_name(String hard_name) {
        this.hard_name = hard_name;
    }

    public String getMainPic_file() {
        return mainPic_file;
    }

    public void setMainPic_file(String mainPic_file) {
        this.mainPic_file = mainPic_file;
    }

    @Override
    public String toString() {
        return "ProductDetailDto [hard_name=" + hard_name + ", mainPic_file=" + mainPic_file + ", toString()="
                + super.toString() + "]";
    }

}
