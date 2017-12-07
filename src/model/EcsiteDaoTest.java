package model;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Test;

import database.Category_tblVo;
import database.Hard_tblVo;
import database.ListTop;
import database.Recommend_tblVo;
import database.ProductTopDto;

public class EcsiteDaoTest {

    @Test
    public void testGetCategoryList() {
        try (EcsiteDao dao = new EcsiteDao()) {
            ArrayList<Category_tblVo> entList;
            entList = dao.getCategoryList();
            for (Category_tblVo ent : entList) {
                System.out.println(ent);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail(e.getMessage());
        }
    }

    @Test
    public void testGetHardList() {
        try (EcsiteDao dao = new EcsiteDao()) {
            ArrayList<Hard_tblVo> entList;
            entList = dao.getHardList(null);
            for (Hard_tblVo ent : entList) {
                System.out.println(ent);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail(e.getMessage());
        }
    }

    @Test
    public void testGetRecommendList() {
        try (EcsiteDao dao = new EcsiteDao()) {
            ArrayList<Recommend_tblVo> entList;
            entList = dao.getRecommendList();
            for (Recommend_tblVo ent : entList) {
                System.out.println(ent);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail(e.getMessage());
        }
    }

    @Test
    public void testGetProductList() {
        try (EcsiteDao dao = new EcsiteDao()) {
            ArrayList<ListTop> entList;
            entList = dao.getProductList(null, null, "ƒ‚");
            for (ListTop ent : entList) {
                ArrayList<ProductTopDto> list = ent.getTpd();
                for (ProductTopDto entity : list) {
                    System.out.println(entity.getProduct_id());
                    System.out.println(entity.getProduct_name());
                    System.out.println(entity.getPrice());
                    System.out.println(entity.getStocks());
                    System.out.println(entity.getComment());
                    System.out.println(entity.getHard_id());
                    System.out.println(entity.getCategory_id());
                    System.out.println(entity.getAve_eval());
                    System.out.println(entity.getPic_file());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail(e.getMessage());
        }
    }

}
