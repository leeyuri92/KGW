package com.best.kgw.dao;

import com.vo.CalendarVO;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

public interface ReservationDao {

    List<Map<String, Object>> assetList(@RequestParam Map<String, Object> aMap) throws Exception;

    List<Map<String, Object>> assetReservationList(@RequestParam Map<String, Object> arMap) throws Exception;

    void deleteReservation(CalendarVO calendarVO) throws Exception;

    void insertReservation(CalendarVO calendarVO) throws Exception;

    void updateReservation(CalendarVO calendarVO) throws Exception;

    List<Map<String, Object>> reservList(@RequestParam Map<String, Object> reservMap) throws Exception;

    List<Map<String, Object>> myReservList(@RequestParam Map<String, Object> myReservMap) throws Exception;
}