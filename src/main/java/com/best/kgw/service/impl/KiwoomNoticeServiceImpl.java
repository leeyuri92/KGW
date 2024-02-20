package com.best.kgw.service.impl;

import com.best.kgw.dao.KiwoomNoticeDao;
import com.best.kgw.service.KiwoomNoticeService;
import com.best.kgw.vo.KiwoomNoticeVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KiwoomNoticeServiceImpl implements KiwoomNoticeService{
    Logger logger = LoggerFactory.getLogger(KiwoomNoticeServiceImpl.class);
    @Autowired
    private KiwoomNoticeDao kiwoomNoticeDao;
    @Override
    public List<KiwoomNoticeVO> kiwoomNoticeList(KiwoomNoticeVO kiwoomNoticeVO) throws Exception {
        logger.info("kiwoomNoticeList");
        List<KiwoomNoticeVO> kiwoomNoticeList=kiwoomNoticeDao.kiwoomNoticeList(kiwoomNoticeVO);
        return kiwoomNoticeList;
    }

    @Override
    public int kiwoomNoticeDelete(int board_no) throws Exception {
        logger.info("kiwoomNoticeDelete");
        int kiwoomNoticeDelete=0;
        kiwoomNoticeDelete=kiwoomNoticeDao.kiwoomNoticeDelete(board_no);
        return kiwoomNoticeDelete;
    }
}
