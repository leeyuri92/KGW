package com.best.kgw.dao;

import com.vo.CalendarVO;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

public interface CalendarDao {
    public List<Map<String, Object>> calendarList(Map<String, Object> cmap) throws Exception;

    void deleteCalendar(int calendarNo) throws Exception;

    void updateCalendar(CalendarVO calendarVO) throws Exception;

    void insertCalendar(CalendarVO calendarVO) throws Exception;

    List<Map<String, Object>> calList(Map<String, Object> calMap) throws Exception;

    List<Map<String, Object>> myCalList(Map<String, Object> myCalMap) throws Exception;
}