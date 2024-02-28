package com.best.kgw.service.impl;

import com.best.kgw.dao.AttendanceDao;
import com.best.kgw.service.AttendanceService;
import com.vo.AttendanceVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AttendanceServiceImpl implements AttendanceService {
    Logger logger = LoggerFactory.getLogger(AttendanceServiceImpl.class);
    @Autowired
    private AttendanceDao attendanceDao;

    @Override
    public List<AttendanceVO> attendanceData(int emp_no) throws Exception {
        List<AttendanceVO> attendanceCalendar = (List) attendanceDao.attendanceData(emp_no);
        return attendanceCalendar;
    }

    @Override
    public void attendanceTime(AttendanceVO attendanceVO) throws Exception {

        attendanceDao.attendanceTime(attendanceVO);
    }

    @Override
    public void attendanceEndTime(AttendanceVO attendanceVO) throws Exception {
        attendanceDao.attendanceEndTime(attendanceVO);
    }

    @Override
    public AttendanceVO attendance(int emp_no) throws Exception {
        logger.info("AttendanceServiceImpl : "+emp_no);
        return attendanceDao.attendance(emp_no);
    }

    //스케줄러에 따라서 월-금 23:59:59 에 근태 상태값 업데이트
    @Override
    public void attemdamceStateUpdate() throws Exception {
        attendanceDao.attemdamceStateUpdate();
    }
}
