package com.best.kgw.service;

import java.util.List;
import java.util.Map;

public interface CalendarService {
    List<Map<String, Object>> calendarList(Map<String, Object> tmap);

    List<Map<String, Object>> assetList(Map<String, Object> aMap);

    List<Map<String, Object>> assetReservationList(Map<String, Object> arMap);

    List<Map<String, Object>> delList(Map<String, Object> delMap);

    List<Map<String, Object>> addList(Map<String, Object> addMap);

    List<Map<String, Object>> upList(Map<String, Object> upMap);

    List<Map<String, Object>> reservList(Map<String, Object> reservMap);

    List<Map<String, Object>> myReservList(Map<String, Object> myReservMap);

//    List<Map<String, Object>> addEventList(Map<String, Object> addMap);
}

