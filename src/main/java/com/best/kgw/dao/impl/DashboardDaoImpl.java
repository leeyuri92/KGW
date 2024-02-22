package com.best.kgw.dao.impl;

import com.best.kgw.dao.DashboardDao;
import com.vo.EmpVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**********************************************************************************
 작성자 : 박병현
 작성일자 : 24.02.19
 기능 : DashboardDaoImpl
 **********************************************************************************/
@Repository
public class DashboardDaoImpl implements DashboardDao {
    Logger logger = LoggerFactory.getLogger(DashboardDaoImpl.class);

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    /**********************************************************************************
     작성자 : 박병현
     작성일자 : 24.02.19
     기능 : 한명의 사원 정보 조회 (Dao)
     **********************************************************************************/
    @Override
    public List<EmpVO> empDetail(EmpVO empVO) throws Exception{
        logger.info("Repository : DashboardDaoImpl");
        return sqlSessionTemplate.selectList("empDetail", empVO);
    }
}
