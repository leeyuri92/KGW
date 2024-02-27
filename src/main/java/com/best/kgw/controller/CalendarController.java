package com.best.kgw.controller;

import com.best.kgw.service.CalendarService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/calendar/*")
public class CalendarController {
    Logger logger = LoggerFactory.getLogger(CalendarController.class);
    @Autowired
    private CalendarService calendarService;

    @GetMapping("calendarList")
    public String calendarList(@RequestParam Map<String, Object> cMap, @RequestParam Map<String, Object> aMap, @RequestParam Map<String, Object> arMap, Model model){
        List<Map<String, Object>> calendarList;
        logger.info("calendarController: calendarList 호출");
        calendarList = calendarService.calendarList(cMap);
        logger.info(calendarList.toString());
        model.addAttribute("calendarList", calendarList);
        return "forward:/calendar/calendar.jsp";
    }

    @PostMapping("/addCalendar")
    public String addCalList(@RequestParam Map<String, Object> addMap, Model model){
        List<Map<String, Object>> addCalList;
        logger.info("calendarController: delList 호출");
        addCalList = calendarService.addCalList(addMap);
        model.addAttribute("addCalList", addCalList);
        logger.info(addCalList.toString());
        return "forward:/calendar/calendar.jsp";
    }

    @DeleteMapping("/delCalendar")
    public String delCalList(@RequestParam Map<String, Object> delMap, Model model){
        List<Map<String, Object>> delCalList;
        logger.info("calendarController: delList 호출");
        delCalList = calendarService.delCalList(delMap);
        model.addAttribute("delCalList", delCalList);
        logger.info(delCalList.toString());
        return "forward:/calendar/calendar.jsp";
    }

    @PutMapping("/updateCalendar")
    public String upCalList(@RequestParam Map<String, Object> upMap, Model model){
        List<Map<String, Object>> upCalList;
        logger.info("calendarController: delList 호출");
        upCalList = calendarService.upCalList(upMap);
        model.addAttribute("upCalList", upCalList);
        logger.info(upCalList.toString());
        return "forward:/calendar/calendar.jsp";
    }

    @GetMapping("calList")
    public String calList(@RequestParam Map<String, Object> calMap, Model model){
        logger.info("calendarController : calList 호출");
        List<Map<String ,Object>> calList = null;
        calList = calendarService.calList(calMap);
        model.addAttribute("calList", calList);
        logger.info(calList.toString());
        return "forward:/calendar/calendar.jsp";
    }

    @GetMapping("myCalList")
    public String myCalList(@RequestParam Map<String, Object>myCalMap, Model model){
        logger.info("calendarController : myCalList 호출");
        List<Map<String ,Object>> myCalList = null;
        myCalList = calendarService.myCalList(myCalMap);
        model.addAttribute("myCalList", myCalList);
        logger.info(myCalList.toString());
        return "forward:/calendar/calendar.jsp";
    }

}

