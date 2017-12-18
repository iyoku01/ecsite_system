package database;

public class HistoryDto {

    //çwì¸óöóópdto

    private String date;
    private int order_id;
    private int product_id;
    private String product_name;
    private int price;
    private String pic_file;
    private int number;
    private String shipping;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

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

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getPic_file() {
        return pic_file;
    }

    public void setPic_filer(String pic_file) {
        this.pic_file = pic_file;
    }

    public String getShipping() {
        return shipping;
    }

    public void setShipping(boolean shipping) {
        if (shipping) {
            this.shipping = "î≠ëóçœÇ›";
        } else {
            this.shipping = "ñ¢î≠ëó";
        }
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("HistoryDto [date=");
        builder.append(date);
        builder.append(", order_id=");
        builder.append(order_id);
        builder.append(", product_id=");
        builder.append(product_id);
        builder.append(", product_name=");
        builder.append(product_name);
        builder.append(", price=");
        builder.append(price);
        builder.append(", number=");
        builder.append(number);
        builder.append(", pic_file=");
        builder.append(pic_file);
        builder.append(", shipping=");
        builder.append(shipping);
        builder.append("]");
        return builder.toString();
    }

}
