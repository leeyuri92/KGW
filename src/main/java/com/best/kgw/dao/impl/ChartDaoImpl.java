package com.best.kgw.dao.impl;

import com.best.kgw.dao.ChartDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ChartDaoImpl implements ChartDao {
    Logger logger = LoggerFactory.getLogger(ChartDaoImpl.class);

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List<Map<String, Object>> faList(Map<String, Object> fmap) {
        logger.info("FA : ");
        List<Map<String, Object>> fList = null;
        fList = sqlSessionTemplate.selectList("fList", fmap);
        logger.info(fList.toString());
        return fList;
    }

    @Override
    public List<Map<String, Object>> warList(Map<String, Object> wmap) {
        logger.info("WAR : ");
        List<Map<String, Object>> wList = null;
        wList = sqlSessionTemplate.selectList("wList", wmap);
        logger.info(wList.toString());
        return wList;
    }


}
