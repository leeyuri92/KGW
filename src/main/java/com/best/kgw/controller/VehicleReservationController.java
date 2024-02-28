package com.best.kgw.controller;

import com.best.kgw.service.ReservationService;
import com.best.kgw.service.VehicleReservationService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/vehicleReservation/*")
public class VehicleReservationController {
    Logger logger = LoggerFactory.getLogger(VehicleReservationController.class);

    @Autowired
    private VehicleReservationService vehicleReservationService;
    // 차량 예약 컨트롤러
    @GetMapping("vehicleReservationList")
    public String vehicleReservationList(@RequestParam Map<String, Object> vMap, @RequestParam Map<String, Object> vrMap, Model model){
        List<Map<String, Object>> vehicleList;
        List<Map<String, Object>> vehicleReservationList;
        logger.info("ReservationController: vehicleList 호출");
        logger.info("ReservationController: vehicleReservationList 호출");
        vehicleList = vehicleReservationService.vehicleList(vMap);
        vehicleReservationList = vehicleReservationService.vehicleReservationList(vrMap);
        model.addAttribute("assetList", vehicleList);
        model.addAttribute("assetReservationList", vehicleReservationList);
        logger.info(vehicleList.toString());
        logger.info(vehicleReservationList.toString());
        return "forward:/reservation/assetReservation.jsp";
    }

    @PostMapping("/addVehicleReservation")
    public String addVehicleReservation(@RequestParam Map<String, Object> addMap, Model model){
        List<Map<String, Object>> addVehicleReservation;
        logger.info("reservationService: addVehicleReservation 호출");
        addVehicleReservation = vehicleReservationService.addVehicleReservation(addMap);
        model.addAttribute("addVehicleReservation", addVehicleReservation);
        logger.info(addVehicleReservation.toString());
        return "forward:/reservation/assetReservation.jsp";
    }

    @DeleteMapping("/delVehicleReservation")
    public String delVehicleReservation(@RequestParam Map<String, Object> delMap, Model model){
        List<Map<String, Object>> delVehicleReservation;
        logger.info("reservationService: delVehicleReservation 호출");
        delVehicleReservation = vehicleReservationService.delVehicleReservation(delMap);
        model.addAttribute("delVehicleReservation", delVehicleReservation);
        logger.info(delVehicleReservation.toString());
        return "forward:/reservation/assetReservation.jsp";
    }

    @PutMapping("/upVehicleReservList")
    public String upVehicleReservList(@RequestParam Map<String, Object> upMap, Model model){
        List<Map<String, Object>> upVehicleReservList;
        logger.info("reservationService: upVehicleReservList 호출");
        upVehicleReservList = vehicleReservationService.upVehicleReservList(upMap);
        model.addAttribute("upVehicleReservList", upVehicleReservList);
        logger.info(upVehicleReservList.toString());
        return "forward:/reservation/assetReservation.jsp";
    }

    @GetMapping("vehicleReservList")
    public String vehicleReservList(@RequestParam Map<String, Object> reservMap, Model model){
        logger.info("reservationService : vehicleReservList 호출");
        List<Map<String ,Object>> vehicleReservList = null;
        vehicleReservList = vehicleReservationService.vehicleReservList(reservMap);
        model.addAttribute("vehicleReservList", vehicleReservList);
        logger.info(vehicleReservList.toString());
        return "forward:/reservation/assetReservation.jsp";
    }

    @GetMapping("myVehicleReservList")
    public String myVehicleReservList(@RequestParam Map<String, Object>myReservMap, Model model){
        logger.info("reservationService : myVehicleReservList 호출");
        List<Map<String ,Object>> myVehicleReservList = null;
        myVehicleReservList = vehicleReservationService.myVehicleReservList(myReservMap);
        model.addAttribute("myVehicleReservList", myVehicleReservList);
        logger.info(myVehicleReservList.toString());
        return "forward:/reservation/assetReservation.jsp";
    }

}
