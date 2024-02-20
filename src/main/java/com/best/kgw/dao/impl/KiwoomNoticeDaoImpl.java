package com.best.kgw.dao.impl;

import com.best.kgw.dao.KiwoomNoticeDao;
import com.best.kgw.vo.KiwoomNoticeVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class KiwoomNoticeDaoImpl implements KiwoomNoticeDao {
    Logger logger = LoggerFactory.getLogger(KiwoomNoticeDaoImpl.class);

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List<KiwoomNoticeVO> kiwoomNoticeList(KiwoomNoticeVO kiwoomNoticeVO) throws Exception {
        logger.info("kiwoomNoticeList");
        List<KiwoomNoticeVO> kiwoomNoticeList = sqlSessionTemplate.selectList("kiwoomNoticeList", kiwoomNoticeVO);
        logger.info(kiwoomNoticeList.toString());
       return kiwoomNoticeList;

    }

    @Override
    public int kiwoomNoticeDelete(int board_no) throws Exception {
        logger.info("kiwoomNoticeDelete");
        int kiwoomNoticeDelete=0;
        sqlSessionTemplate.delete("kiwoomNoticeDelete",board_no);
    return kiwoomNoticeDelete;
    }
}
