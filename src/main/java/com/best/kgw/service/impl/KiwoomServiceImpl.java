package com.best.kgw.service.impl;

import com.best.kgw.dao.KiwoomDao;
import com.best.kgw.service.KiwoomService;
import com.vo.KChartVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KiwoomServiceImpl implements KiwoomService {
    Logger logger = LoggerFactory.getLogger(KiwoomServiceImpl.class);

    @Autowired
    private KiwoomDao kiwoomDao;
    @Override
    public List<KChartVO> kiwoomList(KChartVO kChartVO) {
        List<KChartVO> kiwoomList = kiwoomDao.kiwoomList(kChartVO);
        logger.info("kiwoomList Service ");
        logger.info(kiwoomList.toString());
        return kiwoomList;
    }
}
