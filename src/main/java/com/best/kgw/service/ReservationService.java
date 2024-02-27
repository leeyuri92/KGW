package com.best.kgw.service;

import java.util.List;
import java.util.Map;

public interface ReservationService {

    List<Map<String, Object>> assetList(Map<String, Object> aMap);

    List<Map<String, Object>> assetReservationList(Map<String, Object> arMap);

    List<Map<String, Object>> delReservList(Map<String, Object> delMap);

    List<Map<String, Object>> addReservList(Map<String, Object> addMap);

    List<Map<String, Object>> upReservList(Map<String, Object> upMap);

    List<Map<String, Object>> reservList(Map<String, Object> reservMap);

    List<Map<String, Object>> myReservList(Map<String, Object> myReservMap);

}

