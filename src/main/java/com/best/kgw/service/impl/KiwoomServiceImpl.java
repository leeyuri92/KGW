package com.best.kgw.service.impl;

import com.best.kgw.dao.KiwoomDao;
import com.best.kgw.service.KiwoomService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class KiwoomServiceImpl implements KiwoomService {
    Logger logger = LoggerFactory.getLogger(KiwoomServiceImpl.class);

    @Autowired
    private KiwoomDao kiwoomDao;
    @Override
    public List<Map<String, Object>> kiwoomList(Map<String, Object> kmap) {
        List<Map<String, Object>> kiwoomList = new ArrayList<>();
        logger.info("kiwoomList Service ");
        kiwoomList = kiwoomDao.kiwoomList(kmap);
        logger.info(kiwoomList.toString());
        return kiwoomList;
    }
}
