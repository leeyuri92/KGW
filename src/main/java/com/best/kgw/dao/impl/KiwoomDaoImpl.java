package com.best.kgw.dao.impl;

import com.best.kgw.dao.KiwoomDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class KiwoomDaoImpl implements KiwoomDao {

    Logger logger = LoggerFactory.getLogger(KiwoomDaoImpl.class);

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List<Map<String, Object>> kiwoomList(Map<String, Object> kmap) {
        logger.info("Repository : kiwoomList 호출" + kmap);
        List<Map<String,Object>> empList = null;
        empList = sqlSessionTemplate.selectList("kiwoomList",kmap);
        logger.info(empList.toString());
        return empList;
    }


}
