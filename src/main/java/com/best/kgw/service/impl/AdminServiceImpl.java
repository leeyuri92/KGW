package com.best.kgw.service.impl;

import com.best.kgw.dao.AdminDao;
import com.best.kgw.service.AdminSevice;
import com.vo.EmpVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class AdminServiceImpl implements AdminSevice {
    Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);

    @Autowired
    private AdminDao adminDao;
 /*
    작성자 : 이동건
    작성일자 : 24.01.18
    기능 : 회원가입(RegistServiceImpl)
    */

    @Override
    public int regist(EmpVO empVO) throws Exception {
        logger.info("RegistServiceImpl : Regist 호출");
        int result = 0;
        result = adminDao.regist(empVO);
        return result;
    }

    @Override
    public List<Map<String, Object>> empList(Map<String, Object> pmap) {
        List<Map<String, Object>> empList = new ArrayList<>();
        logger.info("Service Detail");
        empList = adminDao.empList(pmap);
        logger.info(empList.toString());
        return empList;
    }

    @Override
    public int empInfoUpdate(Map<String, Object> pmap) {
        logger.info("Service empInfoUpdate");
        int result = 0;
        result = adminDao.empInfoUpdate(pmap);
        return result;
    }
}
