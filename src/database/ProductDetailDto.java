package database;

public class ProductDetailDto extends Product_mstVo {
    String mainPic_file; //ÉÅÉCÉìâÊëú

    public String getMainPic_file() {
        return mainPic_file;
    }

    public void setMainPic_file(String mainPic_file) {
        this.mainPic_file = mainPic_file;
    }

    public String toString() {
        StringBuffer buffer = new StringBuffer();
        buffer.append("[ProductDetailDto:");
        buffer.append(" mainPic_file: ");
        buffer.append(mainPic_file);
        buffer.append("]");
        buffer.append(super.toString());
        return buffer.toString();
    }
}
