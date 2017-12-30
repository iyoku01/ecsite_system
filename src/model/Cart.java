package model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import database.CartProductDto;
import database.ProductDetailDto;

public class Cart {

    //カート内の商品<商品ID, 個数>
    //LinkedHashMap k=vを入れた順番に並ぶ
    private Map<Integer, Integer> cartMap = new LinkedHashMap<Integer, Integer>();

    /***
     * カートに商品を追加する
     * ※同一商品IDの個数は合算される
     * @param productId 商品ID
     * @param buyCount 商品数
     */
    public void add(int productId, int buyCount) {
        if (cartMap.containsKey(productId)) {
            buyCount += cartMap.get(productId);
        }
        cartMap.put(productId, buyCount);
    }

    /***
     * カートの商品の購入数を変更する
     * @param productId
     * @param buyCount
     */
    public void update(int productId, int buyCount) {
        cartMap.put(productId, buyCount);
    }

    /***
     * カートから商品を削除する
     * @param productId
     */
    public void delete(int productId) {
        cartMap.remove(productId);
    }

    /***
     * カートの合計金額を返す
     * @return 合計金額
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
     * カートの合計商品数を返す
     * @return 合計商品数
     */
    public int getSumBuyCount() {
        int sum = 0;
        for (int c : cartMap.values()) {
            sum += c;
        }
        return sum;
    }

    /***
     * カート内の商品リストを返す
     * @return 商品リスト
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
     * カートが空か判定する
     * @return カートが空の場合、Trueを返す
     */
    public boolean isEmpty() {
        return cartMap.isEmpty();
    }

    /***
     * カート内の商品マップ<商品ID, 個数>を返す
     * @return 商品マップ<商品ID, 個数>
     */
    public Map<Integer, Integer> getCartMap() {
        return cartMap;
    }

}
