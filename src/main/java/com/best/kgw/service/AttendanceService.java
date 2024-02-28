package com.best.kgw.service;

import com.vo.AttendanceVO;

import java.util.List;

public interface AttendanceService {

    public void attendanceTime(AttendanceVO attendanceVO) throws Exception;

    public void attendanceEndTime(AttendanceVO attendanceVO) throws Exception;

    public AttendanceVO attendance(int emp_no) throws Exception;

    public List<AttendanceVO> attendanceData(int emp_no) throws Exception;

    public void attemdamceStateUpdate() throws Exception;

    public void attendaceMod(AttendanceVO attendanceVO) throws Exception;
}
