package com.best.kgw.dao.impl;

import com.best.kgw.dao.AdminDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDaoImpl implements AdminDao {
    Logger logger = LoggerFactory.getLogger(AdminDaoImpl.class);

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public int regist(EmpVO empVO) throws Exception {
        logger.info("AdminDaoImpl 호출");
        int result = 0;
        result = sqlSessionTemplate.insert("memberInsert",empVO);
        return result;
    }



}
