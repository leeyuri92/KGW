package com.best.kgw.dao;

import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

public interface CalendarDao {
    public List<Map<String, Object>> calendarList(Map<String, Object> cmap) throws Exception;


    List<Map<String, Object>> delCalList(Map<String, Object> delMap) throws Exception;

    List<Map<String, Object>> addCalList(Map<String, Object> addMap) throws Exception;

    List<Map<String, Object>> upCalList(Map<String, Object> upMap) throws Exception;

    List<Map<String, Object>> calList(Map<String, Object> calMap) throws Exception;

    List<Map<String, Object>> myCalList(Map<String, Object> myCalMap) throws Exception;
}