package com.best.kgw.service.impl;

import com.best.kgw.dao.DashboardDao;
import com.best.kgw.service.DashboardService;
import com.best.kgw.vo.EmpVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DashboardServiceImpl implements DashboardService {
    Logger logger = LoggerFactory.getLogger(DashboardServiceImpl.class);

    @Autowired
    private DashboardDao dashboardDao;

    @Override
    public List<EmpVO> empDetail(EmpVO empVO) throws Exception{
        logger.info("Service : empInfo");
        List<EmpVO> empList;
        empList = dashboardDao.empDetail(empVO);
        return empList;
    }
}
