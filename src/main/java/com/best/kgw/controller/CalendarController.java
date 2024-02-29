package com.best.kgw.controller;

import com.best.kgw.service.CalendarService;
import com.vo.CalendarVO;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Slf4j
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

    @PostMapping("/insertCalendar")
    @ResponseBody
    public ResponseEntity<String> insertCalendar(CalendarVO calendarVO) {
        logger.info("등록 컨트롤러 호출");

        ResponseEntity<String> entity = null;

        try {
            calendarService.insertCalendar(calendarVO);
            logger.info("등록 DB 연결 시도");
            entity = new ResponseEntity<>("1", HttpStatus.OK);
        } catch (Exception e) {
            logger.info("예외 발생 등록 DB 처리 못함");
            e.printStackTrace();
            entity = new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return entity;
    }

    @PostMapping("/deleteCalendar")
    @ResponseBody
    public ResponseEntity<String> deleteCalList(CalendarVO calendarVO) {
        logger.info("삭제 컨트롤러 호출");
        log.info(Integer.toString(calendarVO.getCalendar_no()));
        int calendar_no = calendarVO.getCalendar_no();
        ResponseEntity<String> entity = null;

        try {
            calendarService.deleteCalList(calendar_no);
            logger.info("삭제 DB 연결 시도");
            entity = new ResponseEntity<>("1", HttpStatus.OK);
        } catch (Exception e) {
            logger.info("예외 발생 삭제 DB 처리 못함");
            e.printStackTrace();
            entity = new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return entity;
    }

    @PostMapping("/updateCalendar")
    @ResponseBody
    public ResponseEntity<String> updateCalendar(CalendarVO calendarVO) {
        logger.info("업데이트 컨트롤러 호출");

        ResponseEntity<String> entity = null;

        try {
            calendarService.updateCalendar(calendarVO);
            logger.info("업데이트 DB 연결 시도");
            entity = new ResponseEntity<>("1", HttpStatus.OK);
        } catch (Exception e) {
            logger.info("예외 발생 업데이트 DB 처리 못함");
            e.printStackTrace();
            entity = new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return entity;
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

