package com.best.kgw.service.impl;

import com.best.kgw.dao.DashboardDao;
import com.best.kgw.service.DashboardService;
import com.best.kgw.vo.EmpVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**********************************************************************************
 작성자 : 박병현
 작성일자 : 24.02.19
 기능 : 메인페이지
 **********************************************************************************/
@Service
public class DashboardServiceImpl implements DashboardService {
    Logger logger = LoggerFactory.getLogger(DashboardServiceImpl.class);

    @Autowired
    private DashboardDao dashboardDao;

    /**********************************************************************************
     작성자 : 박병현
     작성일자 : 24.02.19
     기능 : 한명의 사원 정보 조회 (Service)
     **********************************************************************************/
    @Override
    public List<EmpVO> empDetail(EmpVO empVO) throws Exception{
        logger.info("Service : empInfo");
        List<EmpVO> empList;
        empList = dashboardDao.empDetail(empVO);
        return empList;
    }
}
