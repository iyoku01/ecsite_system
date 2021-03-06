package model;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Test;

import database.Category_tblVo;
import database.Hard_tblVo;
import database.HistoryDto;
import database.Personal_mstVo;
import database.ProductTopDto;
import database.Product_mstVo;
import database.Recommend_tblVo;
import database.Review_tblVo;

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
            entList = dao.getProductListByWord(2, "モ");
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
            dao.insertPersonalData("hatano", "saki", "竹", "たけ", "08000000000", "1670000", "福島");
        } catch (Exception e) {
            e.printStackTrace();
            fail(e.getMessage());
        }
    }

    @Test
    public void testGetHistoryList() {
        try (EcsiteDao dao = new EcsiteDao()) {
            ArrayList<HistoryDto> entList;
            entList = dao.getHistoryList("takehara");
            for (HistoryDto ent : entList) {
                System.out.println(ent);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail(e.getMessage());
        }
    }

    @Test
    public void testCheckWriteReview() {
        try (EcsiteDao dao = new EcsiteDao()) {
            boolean writeReview;
            writeReview = dao.checkWriteReview("takehara", "2");
            System.out.println(writeReview);
        } catch (Exception e) {
            e.printStackTrace();
            fail(e.getMessage());
        }
    }

    @Test
    public void testGetReviewList() {
        try (EcsiteDao dao = new EcsiteDao()) {
            ArrayList<Review_tblVo> entList;
            entList = dao.getReviewList("3");
            for (Review_tblVo ent : entList) {
                System.out.println(ent);
            }
        } catch (Exception e) {
            e.printStackTrace();
            fail(e.getMessage());
        }
    }

    @Test
    public void testInsertReview() {
        try (EcsiteDao dao = new EcsiteDao()) {
            dao.insertReview("1", "takehara", "竹", "5", "とてもとても面白かったです");
        } catch (Exception e) {
            e.printStackTrace();
            fail(e.getMessage());
        }
    }

    @Test
    public void testGetReview() {
        try (EcsiteDao dao = new EcsiteDao()) {
            Review_tblVo ent;
            ent = dao.getReview("2", "takehara");
            System.out.println(ent);
        } catch (Exception e) {
            e.printStackTrace();
            fail(e.getMessage());
        }
    }

    @Test
    public void testUpdateReview() {
        try (EcsiteDao dao = new EcsiteDao()) {
            dao.updateReview("2", "takehara", "竹", "5", "とてもとても面白かったです");
        } catch (Exception e) {
            e.printStackTrace();
            fail(e.getMessage());
        }
    }

    public void testInsertOrder() {
        Cart cart = new Cart();
        cart.add(1, 3);
        cart.add(2, 4);

        try (EcsiteDao dao = new EcsiteDao()) {
            System.out.println("order_id = " + dao.insertOrder("agata1", cart));
        } catch (Exception e) {
            e.printStackTrace();
            fail(e.getMessage());
        }
    }

    @Test
    public void testUpdateEvaluation() {
        try (EcsiteDao dao = new EcsiteDao()) {
            dao.updateEvaluation("2");
        } catch (Exception e) {
            e.printStackTrace();
            fail(e.getMessage());
        }
    }

}
