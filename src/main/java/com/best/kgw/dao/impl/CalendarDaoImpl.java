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
    public List<Map<String, Object>> addCalList(@RequestParam Map<String, Object> addMap)throws Exception {
        logger.info("Dao : addCalList 호출");
        logger.info(addMap.toString());
        List<Map<String,Object>> list = null;
        list = sqlSessionTemplate.selectList("addCalList", addMap);
        logger.info(list.toString());
        return list;
    }
    @Override
    public List<Map<String, Object>> delCalList(@RequestParam Map<String, Object> delMap)throws Exception {
        logger.info("Dao : delCalList 호출");
        logger.info(delMap.toString());
        List<Map<String,Object>> list = null;
        list = sqlSessionTemplate.selectList("delCalList", delMap);
        logger.info(list.toString());
        return list;
    }

    @Override
    public List<Map<String, Object>> upCalList(@RequestParam Map<String, Object> upMap)throws Exception {
        logger.info("Dao : upCalList 호출");
        logger.info(upMap.toString());
        List<Map<String,Object>> list = null;
        list = sqlSessionTemplate.selectList("upCalList", upMap);
        logger.info(list.toString());
        return list;
    }

    @Override
    public List<Map<String, Object>> calList(@RequestParam Map<String, Object> calMap)throws Exception {
        logger.info("Dao : calList 호출");
        logger.info(calMap.toString());
        List<Map<String,Object>> list = null;
        list = sqlSessionTemplate.selectList("reservList", calMap);
        logger.info(list.toString());
        return list;
    }

    @Override
    public List<Map<String, Object>> myCalList(@RequestParam Map<String, Object> myCalMap)throws Exception {
        logger.info("Dao : myCalList 호출");
        logger.info(myCalMap.toString());
        List<Map<String,Object>> list = null;
        list = sqlSessionTemplate.selectList("myCalList", myCalMap);
        logger.info(list.toString());
        return list;
    }

}

