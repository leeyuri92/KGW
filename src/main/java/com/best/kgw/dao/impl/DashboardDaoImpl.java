package com.best.kgw.dao.impl;

import com.best.kgw.dao.DashboardDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DashboardDaoImpl implements DashboardDao {
    Logger logger = LoggerFactory.getLogger(DashboardDaoImpl.class);

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
    @Override
    public List<EmpVO> empDetail(EmpVO empVO) throws Exception{
        logger.info("Repository : DashboardDaoImpl");
        return sqlSessionTemplate.selectList("empDetail", empVO);
    }
}
