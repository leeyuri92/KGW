package com.best.kgw.controller;

import com.best.kgw.service.ReservationService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/assetReservation/*")
public class ReservationController {
    Logger logger = LoggerFactory.getLogger(ReservationController.class);
    @Autowired
    private ReservationService reservationService;

    @GetMapping("assetReservationList")
    public String assetReservationList(@RequestParam Map<String, Object> aMap, @RequestParam Map<String, Object> arMap, Model model){
        List<Map<String, Object>> assetList;
        List<Map<String, Object>> assetReservationList;
        logger.info("ReservationController: assetList 호출");
        logger.info("ReservationController: assetReservationList 호출");
        assetList = reservationService.assetList(aMap);
        assetReservationList = reservationService.assetReservationList(arMap);
        model.addAttribute("assetList", assetList);
        model.addAttribute("assetReservationList", assetReservationList);
        logger.info(assetList.toString());
        logger.info(assetReservationList.toString());
        return "forward:/reservation/assetReservation.jsp";
    }

    @PostMapping("/addReservation")
    public String addReservList(@RequestParam Map<String, Object> addMap, Model model){
        List<Map<String, Object>> addReservList;
        logger.info("reservationService: addReservList 호출");
        addReservList = reservationService.addReservList(addMap);
        model.addAttribute("addReservList", addReservList);
        logger.info(addReservList.toString());
        return "forward:/reservation/assetReservation.jsp";
    }

    @DeleteMapping("/delReservation")
    public String delReservList(@RequestParam Map<String, Object> delMap, Model model){
        List<Map<String, Object>> delReservList;
        logger.info("reservationService: delReservList 호출");
        delReservList = reservationService.delReservList(delMap);
        model.addAttribute("delReservList", delReservList);
        logger.info(delReservList.toString());
        return "forward:/reservation/assetReservation.jsp";
    }

    @PutMapping("/updateReservation")
    public String upReservList(@RequestParam Map<String, Object> upMap, Model model){
        List<Map<String, Object>> upReservList;
        logger.info("reservationService: upReservList 호출");
        upReservList = reservationService.upReservList(upMap);
        model.addAttribute("upReservList", upReservList);
        logger.info(upReservList.toString());
        return "forward:/reservation/assetReservation.jsp";
    }

    @GetMapping("reservList")
    public String reservList(@RequestParam Map<String, Object> reservMap, Model model){
        logger.info("reservationService : reservList 호출");
        List<Map<String ,Object>> reservList = null;
        reservList = reservationService.reservList(reservMap);
        model.addAttribute("reservList", reservList);
        logger.info(reservList.toString());
        return "forward:/reservation/assetReservation.jsp";
    }

    @GetMapping("myReservList")
    public String myReservList(@RequestParam Map<String, Object>myReservMap, Model model){
        logger.info("reservationService : myReservList 호출");
        List<Map<String ,Object>> myReservList = null;
        myReservList = reservationService.myReservList(myReservMap);
        model.addAttribute("myReservList", myReservList);
        logger.info(myReservList.toString());
        return "forward:/reservation/assetReservation.jsp";
    }
}

