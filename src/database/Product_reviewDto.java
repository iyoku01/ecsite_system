package database;

public class Product_reviewDto {
    int evaluation_agv;//���i�̕]���̕��ϒl
    int count; //���i�̃��r���[����

    public int getEvaluation_agv() {
        return evaluation_agv;
    }

    public void setEvaluation_agv(int evaluation_agv) {
        this.evaluation_agv = evaluation_agv;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String toString() {
        StringBuffer buffer = new StringBuffer();
        buffer.append("[Product_reviewDto:");
        buffer.append(" evaluation_agv: ");
        buffer.append(evaluation_agv);
        buffer.append(" count: ");
        buffer.append(count);
        buffer.append("]");
        return buffer.toString();
    }
}
