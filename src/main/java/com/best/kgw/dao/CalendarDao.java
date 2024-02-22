package com.best.kgw.dao;

import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

public interface CalendarDao {
    public List<Map<String, Object>> calendarList(Map<String, Object> cmap) throws Exception;

    List<Map<String, Object>> assetList(@RequestParam Map<String, Object> aMap) throws Exception;

    List<Map<String, Object>> assetReservationList(Map<String, Object> arMap) throws Exception;

    List<Map<String, Object>> delList(Map<String, Object> delMap) throws Exception;

    List<Map<String, Object>> addList(Map<String, Object> addMap) throws Exception;

//    List<Map<String, Object>> addEventList(Map<String, Object> addMap) throws Exception;
}