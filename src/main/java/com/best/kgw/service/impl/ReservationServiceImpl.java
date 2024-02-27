package com.best.kgw.service.impl;

import com.best.kgw.dao.CalendarDao;
import com.best.kgw.dao.ReservationDao;
import com.best.kgw.service.CalendarService;
import com.best.kgw.service.ReservationService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ReservationServiceImpl implements ReservationService {
    Logger logger = LoggerFactory.getLogger(ReservationServiceImpl.class);
    @Autowired
    private ReservationDao reservationDao;

    @Override
    public List<Map<String, Object>> assetList(Map<String, Object> aMap) {
        List<Map<String, Object>> assetList = null;
        logger.info("Service : assetList 호출");
        try {
            assetList = reservationDao.assetList(aMap);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return assetList;
    }

    @Override
    public List<Map<String, Object>> assetReservationList(Map<String, Object> arMap) {
        List<Map<String, Object>> assetReservationList = null;
        logger.info("Service : assetReservationList 호출");
        try {
            assetReservationList = reservationDao.assetReservationList(arMap);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return assetReservationList;
    }

    @Override
    public List<Map<String, Object>> addReservList(Map<String, Object> addMap) {
        List<Map<String, Object>> addReservList = null;
        logger.info("Service : addReservList 호출");
        try {
            addReservList = reservationDao.addReservList(addMap);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return addReservList;
    }
    @Override
    public List<Map<String, Object>> delReservList(Map<String, Object> delMap) {
        List<Map<String, Object>> delReservList = null;
        logger.info("Service : delReservList 호출");
        try {
            delReservList = reservationDao.delReservList(delMap);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return delReservList;
    }

    @Override
    public List<Map<String, Object>> upReservList(Map<String, Object> upMap) {
        List<Map<String, Object>> upReservList = null;
        logger.info("Service : upReservList 호출");
        try {
            upReservList = reservationDao.upReservList(upMap);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return upReservList;
    }

    @Override
    public List<Map<String, Object>> reservList(Map<String, Object> reservMap) {
        List<Map<String, Object>> reservList = null;
        logger.info("Service : reservList 호출");
        try {
            reservList = reservationDao.reservList(reservMap);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return reservList;
    }

    @Override
    public List<Map<String, Object>> myReservList(Map<String, Object> myReservMap) {
        List<Map<String, Object>> myReservList = null;
        logger.info("Service : myReservList 호출");
        try {
            myReservList = reservationDao.myReservList(myReservMap);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return myReservList;
    }

}
