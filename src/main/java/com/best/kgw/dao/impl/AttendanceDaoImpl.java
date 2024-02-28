package com.best.kgw.dao.impl;

import com.best.kgw.dao.AttendanceDao;
import com.vo.AttendanceVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.time.LocalTime;
import java.util.List;

@Repository
public class AttendanceDaoImpl implements AttendanceDao {
    Logger logger = LoggerFactory.getLogger(AttendanceDaoImpl.class);

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List<AttendanceVO> attendanceData(int emp_no) throws Exception {
        List<AttendanceVO> attendanceCalendar = sqlSessionTemplate.selectList("selectOne", emp_no);
        return attendanceCalendar;
    }


    @Override
    public void attendanceTime(AttendanceVO attendanceVO) throws Exception {
        sqlSessionTemplate.insert("insertData", attendanceVO);
    }

    @Override
    public void attendanceEndTime(AttendanceVO attendanceVO) throws Exception {
        logger.info(attendanceVO.toString());
        sqlSessionTemplate.update("updateData", attendanceVO);
    }

    @Override
    public AttendanceVO attendance(int emp_no) throws Exception {
        logger.info(""+emp_no);
        return sqlSessionTemplate.selectOne("selectDate",emp_no);
    }

    @Override
    public void attemdamceStateUpdate() throws Exception {
        sqlSessionTemplate.insert("insertAbsenteeism");
    }

    @Override
    public void attendaceMod(AttendanceVO attendanceVO) throws Exception {
        sqlSessionTemplate.insert("attendaceModify", attendanceVO);
    }
}
