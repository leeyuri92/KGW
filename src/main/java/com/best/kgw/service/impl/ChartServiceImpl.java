/**********************************************************************************
 작성자 : 이유리
 작성일자 : 24.02.18
 기능 : FAchart 페이지 생성 및 리스트, chart 생성
 **********************************************************************************/
package com.best.kgw.service.impl;

import com.best.kgw.dao.ChartDao;
import com.best.kgw.service.ChartService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ChartServiceImpl implements ChartService {
    Logger logger = LoggerFactory.getLogger(ChartServiceImpl.class);

    @Autowired
    private ChartDao chartDao;

    @Override
    public List<Map<String, Object>> wList(Map<String, Object> wmap) {
        logger.info("warList : ");
        List<Map<String, Object>> wList = chartDao.wList(wmap);
        logger.info(wList.toString());
        return wList;
    }

    @Override
    public List<Map<String, Object>> pList(Map<String, Object> pmap) {
        logger.info("pList : ");
        List<Map<String, Object>> pList = chartDao.pList(pmap);
        logger.info(pList.toString());
        return pList;
    }

    @Override
    public List<Map<String, Object>> fList(Map<String, Object> fmap) {
        logger.info("fList");
        List<Map<String, Object>> fList = chartDao.fList(fmap);
        logger.info(fList.toString());
        return fList;
    }

    @Override
    public  double kWar(Map<String, Object> kmap) {
        logger.info("kWar");
        double kWar = chartDao.kWar(kmap);
        logger.info("kWar : " + kWar);
        return kWar;
    }

    /**********************************************************************************
     작성자 : 이유리
     작성일자 : 24.02.21
     기능 : 등록/방출에 따른 WAR값 업데이트
     **********************************************************************************/

    @Override
    public void faUpdate(Map<String, Object> FA_NO) {
        logger.info("faUpdate : " + FA_NO);
        chartDao.faUpdate(FA_NO);
    }

    /**********************************************************************************
     작성자 : 이유리
     작성일자 : 24.02.26
     기능 : 입/퇴사자 차트
     **********************************************************************************/

    @Override
    public List<Map<String, Object>> hList(Map<String, Object> hmap) {
        logger.info("hList : ");
        List<Map<String, Object>> hList = chartDao.hList(hmap);
        logger.info(hList.toString());
        return hList;
    }

    @Override
    public List<Map<String, Object>> rList(Map<String, Object> rmap) {
        logger.info("rList : ");
        List<Map<String, Object>> rList = chartDao.rList(rmap);
        logger.info(rList.toString());
        return rList;
    }
}
