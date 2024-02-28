package com.best.kgw.service;

import java.util.List;
import java.util.Map;

public interface VehicleReservationService {

    List<Map<String, Object>> vehicleList(Map<String, Object> vMap);

    List<Map<String, Object>> vehicleReservationList(Map<String, Object> vrMap);

    List<Map<String, Object>> delVehicleReservation(Map<String, Object> delMap);

    List<Map<String, Object>> addVehicleReservation(Map<String, Object> addMap);

    List<Map<String, Object>> upVehicleReservList(Map<String, Object> upMap);

    List<Map<String, Object>> vehicleReservList(Map<String, Object> reservMap);

    List<Map<String, Object>> myVehicleReservList(Map<String, Object> myReservMap);
}

