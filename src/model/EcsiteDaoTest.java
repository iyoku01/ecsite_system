package model;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Test;

import database.Category_tblVo;
import database.Hard_tblVo;
import database.Personal_mstVo;
import database.ProductTopDto;
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
            entList = dao.getHardList(null);
            for (Hard_tblVo ent : entList) {
                System.out.println(ent);
            }

            entList = dao.getHardList("1");
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
    public void testGetPersonal() {
        try (EcsiteDao dao = new EcsiteDao()) {
            Personal_mstVo ent;
            ent = dao.getPersonal("takehara");
            System.out.println(ent);
        } catch (Exception e) {
            e.printStackTrace();
            fail(e.getMessage());
        }
    }

    @Test
    public void testGetProductListAll() {
        try (EcsiteDao dao = new EcsiteDao()) {
            ArrayList<ProductTopDto> entList;
            entList = dao.getProductListAll(1);
            for (ProductTopDto entity : entList) {
                System.out.println(entity);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail(e.getMessage());
        }
    }

    @Test
    public void testGetProductListById() {
        try (EcsiteDao dao = new EcsiteDao()) {
            ArrayList<ProductTopDto> entList;
            entList = dao.getProductListById(1, "1", null);
            for (ProductTopDto entity : entList) {
                System.out.println(entity);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail(e.getMessage());
        }
    }

    @Test
    public void testGetProductListByWord() {
        try (EcsiteDao dao = new EcsiteDao()) {
            ArrayList<ProductTopDto> entList;
            entList = dao.getProductListByWord(2, "ƒ‚");
            for (ProductTopDto entity : entList) {
                System.out.println(entity);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail(e.getMessage());
        }
    }

    @Test
    public void testGetProductDetail() {
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

    @Test
    public void testLogin() {
        try (EcsiteDao dao = new EcsiteDao()) {
            boolean personal = false;
            personal = dao.login("takehara", "saki");
            System.out.println(personal);
        } catch (Exception e) {
            e.printStackTrace();
            fail(e.getMessage());
        }
    }

    @Test
    public void testCheckId() {
        try (EcsiteDao dao = new EcsiteDao()) {
            boolean exist;
            exist = dao.checkId("takehara");
            System.out.println(exist);
        } catch (Exception e) {
            e.printStackTrace();
            fail(e.getMessage());
        }
    }

    @Test
    public void testInsertPersonalData() {
        try (EcsiteDao dao = new EcsiteDao()) {
            dao.insertPersonalData("hatano", "saki", "’|", "‚½‚¯", "08000000000", "1670000", "•Ÿ“‡");
        } catch (Exception e) {
            e.printStackTrace();
            fail(e.getMessage());
        }
    }

}
