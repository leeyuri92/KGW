package com.best.kgw.dao.impl;

import com.best.kgw.dao.VehicleReservationDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Repository
public class VehicleReservationDaoImpl implements VehicleReservationDao {
    Logger logger = LoggerFactory.getLogger(VehicleReservationDaoImpl.class);

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List<Map<String, Object>> vehicleList(@RequestParam Map<String, Object> vMap)throws Exception {
        logger.info("Dao : vehicleList 호출");
        logger.info(vMap.toString());
        List<Map<String,Object>> list = null;
        list = sqlSessionTemplate.selectList("vList", vMap);
        logger.info(list.toString());
        return list;
    }

    @Override
    public List<Map<String, Object>> vehicleReservationList(@RequestParam Map<String, Object> vrMap)throws Exception {
        logger.info("Dao : vehicleReservationList 호출");
        logger.info(vrMap.toString());
        List<Map<String,Object>> list = null;
        list = sqlSessionTemplate.selectList("vrList", vrMap);
        logger.info(list.toString());
        return list;
    }

    @Override
    public List<Map<String, Object>> addVehicleReservation(@RequestParam Map<String, Object> addMap)throws Exception {
        logger.info("Dao : addVehicleReservation 호출");
        logger.info(addMap.toString());
        List<Map<String,Object>> list = null;
        list = sqlSessionTemplate.selectList("addVehicleReservation", addMap);
        logger.info(list.toString());
        return list;
    }
    @Override
    public List<Map<String, Object>> delVehicleReservation(@RequestParam Map<String, Object> delMap)throws Exception {
        logger.info("Dao : delVehicleReservation 호출");
        logger.info(delMap.toString());
        List<Map<String,Object>> list = null;
        list = sqlSessionTemplate.selectList("delVehicleReservation", delMap);
        logger.info(list.toString());
        return list;
    }

    @Override
    public List<Map<String, Object>> upVehicleReservList(@RequestParam Map<String, Object> upMap)throws Exception {
        logger.info("Dao : upVehicleReservList 호출");
        logger.info(upMap.toString());
        List<Map<String,Object>> list = null;
        list = sqlSessionTemplate.selectList("upVehicleReservList", upMap);
        logger.info(list.toString());
        return list;
    }

    @Override
    public List<Map<String, Object>> vehicleReservList(@RequestParam Map<String, Object> reservMap)throws Exception {
        logger.info("Dao : vehicleReservList 호출");
        logger.info(reservMap.toString());
        List<Map<String,Object>> list = null;
        list = sqlSessionTemplate.selectList("vehicleReservList", reservMap);
        logger.info(list.toString());
        return list;
    }

    @Override
    public List<Map<String, Object>> myVehicleReservList(@RequestParam Map<String, Object> myReservMap)throws Exception {
        logger.info("Dao : myVehicleReservList 호출");
        logger.info(myReservMap.toString());
        List<Map<String,Object>> list = null;
        list = sqlSessionTemplate.selectList("myVehicleReservList", myReservMap);
        logger.info(list.toString());
        return list;
    }


}

