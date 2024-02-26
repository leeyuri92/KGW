/**********************************************************************************
 작성자 : 이유리
 작성일자 : 24.02.18
 기능 : FAchart 페이지 생성 및 리스트, chart 생성
 **********************************************************************************/
package com.best.kgw.dao.impl;

import com.best.kgw.dao.ChartDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ChartDaoImpl implements ChartDao {
    Logger logger = LoggerFactory.getLogger(ChartDaoImpl.class);

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List<Map<String, Object>> wList(Map<String, Object> wmap) {
        logger.info("wList");
        List<Map<String, Object>> wList = null;
        wList = sqlSessionTemplate.selectList("wList", wmap);
        logger.info(wList.toString());
        return wList;
    }

    @Override
    public List<Map<String, Object>> pList(Map<String, Object> pmap) {
        logger.info("pList");
        List<Map<String, Object>> pList = null;
        pList = sqlSessionTemplate.selectList("pList", pmap);
        logger.info(pList.toString());
        return pList;
    }

    @Override
    public List<Map<String, Object>> fList(Map<String, Object> fmap) {
        logger.info("fList");
        List<Map<String, Object>> fList = null;
        fList = sqlSessionTemplate.selectList("fList", fmap);
        logger.info(fList.toString());
        return fList;
    }

    @Override
    public double kWar(Map<String, Object> kmap) {
        logger.info("kWar : ");
        double kWar = sqlSessionTemplate.selectOne("kWar",kmap);
        logger.info("kWar : " + kWar);
        return kWar;
    }

    /**********************************************************************************
     작성자 : 이유리
     작성일자 : 24.02.21
     기능 : 등록/방출에 따른 WAR값 업데이트
     **********************************************************************************/

    @Override
    public  void faUpdate(Map<String, Object> umap) {
        logger.info("faUpdate 입력값 : " + umap);
        logger.info(umap.get("FA_NO").toString());
        int result = sqlSessionTemplate.update("faUpdate",umap);
        logger.info("업데이트 성공했니? result : " + result );
    }

    /**********************************************************************************
     작성자 : 이유리
     작성일자 : 24.02.26
     기능 : 입/퇴사자 차트
     **********************************************************************************/
    @Override
    public List<Map<String, Object>> hList(Map<String, Object> hmap) {
        logger.info("hireList");
        List<Map<String, Object>> hList = null;
        hList = sqlSessionTemplate.selectList("hireList", hmap);
        logger.info(hList.toString());
        return hList;
    }

    @Override
    public List<Map<String, Object>> rList(Map<String, Object> rmap) {
        logger.info("retireList");
        List<Map<String, Object>> rList = null;
        rList = sqlSessionTemplate.selectList("retireList", rmap);
        logger.info(rList.toString());
        return rList;
    }
}
