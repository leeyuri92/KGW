package com.best.kgw.service;

import java.util.List;
import java.util.Map;

public interface CalendarService {
    List<Map<String, Object>> calendarList(Map<String, Object> tmap);


    List<Map<String, Object>> delCalList(Map<String, Object> delMap);

    List<Map<String, Object>> addCalList(Map<String, Object> addMap);

    List<Map<String, Object>> upCalList(Map<String, Object> upMap);


    List<Map<String, Object>> calList(Map<String, Object> calMap);

    List<Map<String, Object>> myCalList(Map<String, Object> myReservMap);

}

