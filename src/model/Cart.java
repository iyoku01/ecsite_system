package model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import database.CartProductDto;
import database.ProductDetailDto;

public class Cart {

    //�J�[�g���̏��i<���iID, ��>
    //LinkedHashMap k=v����ꂽ���Ԃɕ���
    private Map<Integer, Integer> cartMap = new LinkedHashMap<Integer, Integer>();

    /***
     * �J�[�g�ɏ��i��ǉ�����
     * �����ꏤ�iID�̌��͍��Z�����
     * @param productId ���iID
     * @param buyCount ���i��
     */
    public void add(int productId, int buyCount) {
        if (cartMap.containsKey(productId)) {
            buyCount += cartMap.get(productId);
        }
        cartMap.put(productId, buyCount);
    }

    /***
     * �J�[�g�̏��i�̍w������ύX����
     * @param productId
     * @param buyCount
     */
    public void update(int productId, int buyCount) {
        cartMap.put(productId, buyCount);
    }

    /***
     * �J�[�g���珤�i���폜����
     * @param productId
     */
    public void delete(int productId) {
        cartMap.remove(productId);
    }

    /***
     * �J�[�g�̍��v���z��Ԃ�
     * @return ���v���z
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public int getSumPrice() throws ClassNotFoundException, SQLException {
        int sum = 0;
        try (EcsiteDao dao = new EcsiteDao()) {
            for (Map.Entry<Integer, Integer> mapEntry : cartMap.entrySet()) {
                ProductDetailDto product = dao.getProductDetail(mapEntry.getKey().toString());
                sum += mapEntry.getValue() * product.getPrice();
            }
        }
        return sum;
    }

    /***
     * �J�[�g�̍��v���i����Ԃ�
     * @return ���v���i��
     */
    public int getSumBuyCount() {
        int sum = 0;
        for (int c : cartMap.values()) {
            sum += c;
        }
        return sum;
    }

    /***
     * �J�[�g���̏��i���X�g��Ԃ�
     * @return ���i���X�g
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public ArrayList<CartProductDto> getCartProductList() throws ClassNotFoundException, SQLException {
        ArrayList<CartProductDto> cartProductList = new ArrayList<CartProductDto>();
        try (EcsiteDao dao = new EcsiteDao()) {
            for (Map.Entry<Integer, Integer> mapEntry : cartMap.entrySet()) {
                CartProductDto cartProduct = new CartProductDto();
                ProductDetailDto product = dao.getProductDetail(mapEntry.getKey().toString());
                cartProduct.setBuy_count(mapEntry.getValue());
                cartProduct.setProduct_id(product.getProduct_id());
                cartProduct.setProduct_name(product.getProduct_name());
                cartProduct.setPrice(product.getPrice());
                cartProduct.setMainPic_file(product.getMainPic_file());
                cartProductList.add(cartProduct);
            }
        }
        return cartProductList;
    }

    /***
     * �J�[�g���󂩔��肷��
     * @return �J�[�g����̏ꍇ�ATrue��Ԃ�
     */
    public boolean isEmpty() {
        return cartMap.isEmpty();
    }

    /***
     * �J�[�g���̏��i�}�b�v<���iID, ��>��Ԃ�
     * @return ���i�}�b�v<���iID, ��>
     */
    public Map<Integer, Integer> getCartMap() {
        return cartMap;
    }

}
