package com.best.kgw.service;

import com.vo.CalendarVO;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

public interface ReservationService {

    List<Map<String, Object>> assetList(@RequestParam Map<String, Object> aMap);

    List<Map<String, Object>> assetReservationList(@RequestParam Map<String, Object> arMap);

    public void deleteReservation(CalendarVO calendarVO);

    public void insertReservation(CalendarVO calendarVO);

    public void updateReservation(CalendarVO calendarVO);

    List<Map<String, Object>> reservList(@RequestParam Map<String, Object> reservMap);

    List<Map<String, Object>> myReservList(@RequestParam Map<String, Object> myReservMap);

}

