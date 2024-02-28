package com.best.kgw.dao;

import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

public interface VehicleReservationDao {

    List<Map<String, Object>> vehicleList(Map<String, Object> vMap)throws Exception;

    List<Map<String, Object>> vehicleReservationList(Map<String, Object> vrMap)throws Exception;

    List<Map<String, Object>> delVehicleReservation(Map<String, Object> delMap)throws Exception;

    List<Map<String, Object>> addVehicleReservation(Map<String, Object> addMap)throws Exception;

    List<Map<String, Object>> upVehicleReservList(Map<String, Object> upMap)throws Exception;

    List<Map<String, Object>> vehicleReservList(Map<String, Object> reservMap)throws Exception;

    List<Map<String, Object>> myVehicleReservList(Map<String, Object> myReservMap)throws Exception;
}