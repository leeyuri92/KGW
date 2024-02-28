package com.best.kgw.service;

import com.vo.CalendarVO;

import java.util.List;
import java.util.Map;

public interface CalendarService {
    List<Map<String, Object>> calendarList(Map<String, Object> tmap);

    public void deleteCalList(int calendarNo) throws Exception;

    public void insertCalendar(CalendarVO calendarVO);

    public void updateCalendar(CalendarVO calendarVO);


    List<Map<String, Object>> calList(Map<String, Object> calMap);

    List<Map<String, Object>> myCalList(Map<String, Object> myReservMap);

}

