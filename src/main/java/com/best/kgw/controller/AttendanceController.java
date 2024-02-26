package com.best.kgw.controller;

import com.best.kgw.service.AttendanceService;
import com.vo.AttendanceVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/attendance/*")
public class AttendanceController {
    Logger logger = LoggerFactory.getLogger(AttendanceController.class);

    @Autowired
    private AttendanceService attendanceService;

    @GetMapping("attendanceCalendar")
    public String attendanceCalendar(AttendanceVO attendanceVO, Model model) throws Exception {
        logger.info("AttendanceController : attendanceCalendar");
        List<AttendanceVO> attendanceCalendar = attendanceService.attendanceData(attendanceVO.getEmp_no());
        model.addAttribute("attendanceCalendar",attendanceCalendar);
        return "forward:/attendance/attendanceCalendar.jsp";
    }

    @PostMapping("attendanceTime")
    @ResponseBody
    public void attendanceTime(AttendanceVO attendanceVO) throws Exception{
        logger.info(attendanceVO.toString());

        attendanceService.attendanceTime(attendanceVO);
    }

    @PostMapping("attendanceEndTime")
    @ResponseBody
    public void attendanceEndTime(AttendanceVO attendanceVO) throws Exception{
        logger.info(attendanceVO.toString());

        attendanceService.attendanceEndTime(attendanceVO);
    }

}
