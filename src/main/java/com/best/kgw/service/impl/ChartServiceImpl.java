package com.best.kgw.service.impl;

import com.best.kgw.dao.ChartDao;
import com.best.kgw.service.ChartService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ChartServiceImpl implements ChartService {
    Logger logger = LoggerFactory.getLogger(ChartServiceImpl.class);

    @Autowired
    private ChartDao chartDao;

    @Override
    public List<Map<String, Object>> faList(Map<String, Object> fmap) {
        logger.info("FA : ");
        List<Map<String, Object>> fList = chartDao.faList(fmap);
        logger.info(fList.toString());
        return fList;
    }

    @Override
    public List<Map<String, Object>> warList(Map<String, Object> wmap) {
        logger.info("WAR : ");
        List<Map<String, Object>> wList = chartDao.warList(wmap);
        logger.info(wList.toString());
        return wList;
    }
}
