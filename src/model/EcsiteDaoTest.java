package model;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Test;

import database.Category_tblVo;
import database.Hard_tblVo;
import database.Product_mstVo;
import database.Recommend_tblVo;

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
            entList = dao.getHardList();
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
    public void testGetProduct() {
        try (EcsiteDao dao = new EcsiteDao()) {
            Product_mstVo ent = dao.getProductDetail("1");
            System.out.println(ent);
        } catch (Exception e) {
            e.printStackTrace();
            fail(e.getMessage());
        }
    }

    @Test
    public void testGetProductPicList() {
        try (EcsiteDao dao = new EcsiteDao()) {
            ArrayList<String> entList;
            entList = dao.getProductSubPicList("1");
            for (String ent : entList) {
                System.out.println(ent);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail(e.getMessage());
        }
    }

}
