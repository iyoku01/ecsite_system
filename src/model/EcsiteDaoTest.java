package model;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Test;

import database.Category_tblVo;

public class EcsiteDaoTest {

    @Test
    public void test() {
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

}
