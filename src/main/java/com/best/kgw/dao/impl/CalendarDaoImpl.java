package com.best.kgw.dao.impl;

import com.best.kgw.dao.CalendarDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Repository
public class CalendarDaoImpl implements CalendarDao {
    Logger logger = LoggerFactory.getLogger(CalendarDaoImpl.class);

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List<Map<String, Object>> calendarList(Map<String, Object> cMap)throws Exception {
        logger.info("Dao : calendarList 호출");
        logger.info(cMap.toString());
        List<Map<String,Object>> list = null;
        list = sqlSessionTemplate.selectList("cList", cMap);
        logger.info(list.toString());
        return list;
    }

    @Override
    public List<Map<String, Object>> assetList(@RequestParam Map<String, Object> aMap)throws Exception {
        logger.info("Dao : facilityList 호출");
        logger.info(aMap.toString());
        List<Map<String,Object>> list = null;
        list = sqlSessionTemplate.selectList("aList", aMap);
        logger.info(list.toString());
        return list;
    }

    @Override
    public List<Map<String, Object>> assetReservationList(@RequestParam Map<String, Object> arMap)throws Exception {
        logger.info("Dao : assetReservationList 호출");
        logger.info(arMap.toString());
        List<Map<String,Object>> list = null;
        list = sqlSessionTemplate.selectList("arList", arMap);
        logger.info(list.toString());
        return list;
    }
//
//    @Override
//    public List<Map<String, Object>> addEventList(@RequestParam Map<String, Object> addMap)throws Exception {
//        logger.info("Dao : addEventList 호출");
//        logger.info(addMap.toString());
//        List<Map<String,Object>> list = null;
//        list = sqlSessionTemplate.selectList("addList", addMap);
//        logger.info(list.toString());
//        return list;
//    }
}

