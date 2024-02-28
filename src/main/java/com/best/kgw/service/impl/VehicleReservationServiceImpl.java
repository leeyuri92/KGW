package com.best.kgw.service.impl;

import com.best.kgw.dao.VehicleReservationDao;
import com.best.kgw.service.VehicleReservationService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class VehicleReservationServiceImpl implements VehicleReservationService {
    Logger logger = LoggerFactory.getLogger(VehicleReservationServiceImpl.class);
    @Autowired
    private VehicleReservationDao vehicleReservationDao;

    //차량 서비스

    @Override
    public List<Map<String, Object>> vehicleList(Map<String, Object> vMap) {
        List<Map<String, Object>> assetList = null;
        logger.info("Service : assetList 호출");
        try {
            assetList = vehicleReservationDao.vehicleList(vMap);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return assetList;
    }

    @Override
    public List<Map<String, Object>> vehicleReservationList(Map<String, Object> vrMap) {
        List<Map<String, Object>> assetReservationList = null;
        logger.info("Service : assetReservationList 호출");
        try {
            assetReservationList = vehicleReservationDao.vehicleReservationList(vrMap);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return assetReservationList;
    }

    @Override
    public List<Map<String, Object>> addVehicleReservation(Map<String, Object> addMap) {
        List<Map<String, Object>> addVehicleReservation = null;
        logger.info("Service : addVehicleReservation 호출");
        try {
            addVehicleReservation = vehicleReservationDao.addVehicleReservation(addMap);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return addVehicleReservation;
    }
    @Override
    public List<Map<String, Object>> delVehicleReservation(Map<String, Object> delMap) {
        List<Map<String, Object>> delVehicleReservation = null;
        logger.info("Service : delVehicleReservation 호출");
        try {
            delVehicleReservation = vehicleReservationDao.delVehicleReservation(delMap);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return delVehicleReservation;
    }

    @Override
    public List<Map<String, Object>> upVehicleReservList(Map<String, Object> upMap) {
        List<Map<String, Object>> upVehicleReservList = null;
        logger.info("Service : upVehicleReservList 호출");
        try {
            upVehicleReservList = vehicleReservationDao.upVehicleReservList(upMap);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return upVehicleReservList;
    }

    @Override
    public List<Map<String, Object>> vehicleReservList(Map<String, Object> reservMap) {
        List<Map<String, Object>> vehicleReservList = null;
        logger.info("Service : vehicleReservList 호출");
        try {
            vehicleReservList = vehicleReservationDao.vehicleReservList(reservMap);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return vehicleReservList;
    }

    @Override
    public List<Map<String, Object>> myVehicleReservList(Map<String, Object> myReservMap) {
        List<Map<String, Object>> myVehicleReservList = null;
        logger.info("Service : myVehicleReservList 호출");
        try {
            myVehicleReservList = vehicleReservationDao.myVehicleReservList(myReservMap);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return myVehicleReservList;
    }

}
