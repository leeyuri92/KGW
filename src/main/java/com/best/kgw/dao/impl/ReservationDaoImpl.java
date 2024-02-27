package com.best.kgw.dao.impl;

import com.best.kgw.dao.CalendarDao;
import com.best.kgw.dao.ReservationDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Repository
public class ReservationDaoImpl implements ReservationDao {
    Logger logger = LoggerFactory.getLogger(ReservationDaoImpl.class);

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

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

    @Override
    public List<Map<String, Object>> addReservList(@RequestParam Map<String, Object> addMap)throws Exception {
        logger.info("Dao : addReservList 호출");
        logger.info(addMap.toString());
        List<Map<String,Object>> list = null;
        list = sqlSessionTemplate.selectList("addReservList", addMap);
        logger.info(list.toString());
        return list;
    }
    @Override
    public List<Map<String, Object>> delReservList(@RequestParam Map<String, Object> delMap)throws Exception {
        logger.info("Dao : delReservList 호출");
        logger.info(delMap.toString());
        List<Map<String,Object>> list = null;
        list = sqlSessionTemplate.selectList("delReservList", delMap);
        logger.info(list.toString());
        return list;
    }

    @Override
    public List<Map<String, Object>> upReservList(@RequestParam Map<String, Object> upMap)throws Exception {
        logger.info("Dao : upReservList 호출");
        logger.info(upMap.toString());
        List<Map<String,Object>> list = null;
        list = sqlSessionTemplate.selectList("upReservList", upMap);
        logger.info(list.toString());
        return list;
    }

    @Override
    public List<Map<String, Object>> reservList(@RequestParam Map<String, Object> reservMap)throws Exception {
        logger.info("Dao : reservList 호출");
        logger.info(reservMap.toString());
        List<Map<String,Object>> list = null;
        list = sqlSessionTemplate.selectList("reservList", reservMap);
        logger.info(list.toString());
        return list;
    }

    @Override
    public List<Map<String, Object>> myReservList(@RequestParam Map<String, Object> myReservMap)throws Exception {
        logger.info("Dao : myReservList 호출");
        logger.info(myReservMap.toString());
        List<Map<String,Object>> list = null;
        list = sqlSessionTemplate.selectList("myReservList", myReservMap);
        logger.info(list.toString());
        return list;
    }

}

