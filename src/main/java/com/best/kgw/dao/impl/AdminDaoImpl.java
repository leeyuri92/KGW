package com.best.kgw.dao.impl;

import com.best.kgw.dao.AdminDao;
import com.vo.EmpVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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

    @Override
    public List<Map<String, Object>> empList(Map<String, Object> pmap) {
        logger.info("Repository : empList 호출" + pmap);
        List<Map<String,Object>> empList = null;
        empList = sqlSessionTemplate.selectList("empList",pmap);
        logger.info(empList.toString());
        return empList;
    }

    @Override
    public int empInfoUpdate(Map<String, Object> pmap) {
        logger.info("Repository : empInfoUpdate");
        int result = 0;
        try {
            result = sqlSessionTemplate.update("empInfoUpdate", pmap);

        } catch (Exception e) {
            logger.info(e.toString());
        }
        logger.info(String.valueOf(result));
        return result;
    }


}
