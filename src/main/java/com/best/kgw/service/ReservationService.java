package com.best.kgw.service;

import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

public interface ReservationService {

    List<Map<String, Object>> assetList(@RequestParam Map<String, Object> aMap);

    List<Map<String, Object>> assetReservationList(@RequestParam Map<String, Object> arMap);

    List<Map<String, Object>> addReservList(@RequestParam Map<String, Object> addMap);

    List<Map<String, Object>> delReservList(@RequestParam Map<String, Object> delMap);

    List<Map<String, Object>> upReservList(@RequestParam Map<String, Object> upMap);

    List<Map<String, Object>> reservList(@RequestParam Map<String, Object> reservMap);

    List<Map<String, Object>> myReservList(@RequestParam Map<String, Object> myReservMap);

}

