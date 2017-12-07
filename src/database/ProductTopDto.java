package database;

//トップ画面の商品リスト用のdto
public class ProductTopDto {
    private int product_id;
    private String product_name;
    private int price;
    private int stocks;
    private String comment;
    private int hard_id;
    private int category_id;
    private float ave_eval;
    private String pic_file; //ロゴ画像

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getStocks() {
        return stocks;
    }

    public void setStocks(int stocks) {
        this.stocks = stocks;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getHard_id() {
        return hard_id;
    }

    public void setHard_id(int hard_id) {
        this.hard_id = hard_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public float getAve_eval() {
        return ave_eval;
    }

    public void setAve_eval(float ave_eval) {
        this.ave_eval = ave_eval;
    }

    public String getPic_file() {
        return pic_file;
    }

    public void setPic_file(String pic_file) {
        this.pic_file = pic_file;
    }

}
