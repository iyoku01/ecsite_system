package model;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Test;

import database.Category_tblVo;
import database.Hard_tblVo;
import database.ListTop;
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
            ArrayList<ListTop> entList;
            entList = dao.getProductListAll(dao.getHardList(null));
            for (ListTop ent : entList) {
                ArrayList<ProductTopDto> list = ent.getTpd();
                for (ProductTopDto entity : list) {
                    System.out.println(entity);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail(e.getMessage());
        }
    }

    @Test
    public void testGetProductListById() {
        try (EcsiteDao dao = new EcsiteDao()) {
            ArrayList<ListTop> entList;
            entList = dao.getProductListById(dao.getHardList(null), "2", "3");
            for (ListTop ent : entList) {
                ArrayList<ProductTopDto> list = ent.getTpd();
                for (ProductTopDto entity : list) {
                    System.out.println(entity);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail(e.getMessage());
        }
    }

    @Test
    public void testGetProductListByWord() {
        try (EcsiteDao dao = new EcsiteDao()) {
            ArrayList<ListTop> entList;
            entList = dao.getProductListByWord(dao.getHardList(null), "��");
            for (ListTop ent : entList) {
                ArrayList<ProductTopDto> list = ent.getTpd();
                for (ProductTopDto entity : list) {
                    System.out.println(entity);
                }
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

}
