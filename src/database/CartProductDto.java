package database;

public class CartProductDto {
    private int product_id;
    private String product_name;
    private int price;
    private String mainPic_file; //ÉÅÉCÉìâÊëú
    private int buy_count; //çwì¸êî

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

    public String getMainPic_file() {
        return mainPic_file;
    }

    public void setMainPic_file(String mainPic_file) {
        this.mainPic_file = mainPic_file;
    }

    public int getBuy_count() {
        return buy_count;
    }

    public void setBuy_count(int buy_count) {
        this.buy_count = buy_count;
    }

    @Override
    public String toString() {
        return "CartProductDto [product_id=" + product_id + ", product_name=" + product_name + ", price=" + price
                + ", mainPic_file=" + mainPic_file + ", buy_count=" + buy_count + "]";
    }

}
