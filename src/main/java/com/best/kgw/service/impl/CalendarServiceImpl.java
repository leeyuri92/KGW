package com.best.kgw.service.impl;

import com.best.kgw.dao.CalendarDao;
import com.best.kgw.service.CalendarService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CalendarServiceImpl implements CalendarService {
    Logger logger = LoggerFactory.getLogger(CalendarServiceImpl.class);
    @Autowired
    private CalendarDao calendarDao;

    @Override
    public List<Map<String, Object>> calendarList(Map<String, Object> cMap) {
        List<Map<String, Object>> calendarList = null;
        logger.info("Service : calendarList 호출");
        try {
            calendarList = calendarDao.calendarList(cMap);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return calendarList;
    }

    @Override
    public List<Map<String, Object>> addCalList(Map<String, Object> addMap) {
        List<Map<String, Object>> addCalList = null;
        logger.info("Service : addCalList 호출");
        try {
            addCalList = calendarDao.addCalList(addMap);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return addCalList;
    }
    @Override
    public List<Map<String, Object>> delCalList(Map<String, Object> delMap) {
        List<Map<String, Object>> delCalList = null;
        logger.info("Service : delCalList 호출");
        try {
            delCalList = calendarDao.delCalList(delMap);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return delCalList;
    }

    @Override
    public List<Map<String, Object>> upCalList(Map<String, Object> upMap) {
        List<Map<String, Object>> upCalList = null;
        logger.info("Service : upCalList 호출");
        try {
            upCalList = calendarDao.upCalList(upMap);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return upCalList;
    }

    @Override
    public List<Map<String, Object>> calList(Map<String, Object> calMap) {
        List<Map<String, Object>> calList = null;
        logger.info("Service : calList 호출");
        try {
            calList = calendarDao.calList(calMap);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return calList;
    }

    @Override
    public List<Map<String, Object>> myCalList(Map<String, Object> myCalMap) {
        List<Map<String, Object>> myCalList = null;
        logger.info("Service : myCalList 호출");
        try {
            myCalList = calendarDao.myCalList(myCalMap);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return myCalList;
    }

}
