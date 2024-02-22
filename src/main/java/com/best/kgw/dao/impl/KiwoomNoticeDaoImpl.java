package com.best.kgw.dao.impl;

import com.best.kgw.dao.KiwoomNoticeDao;
import com.vo.KiwoomNoticeVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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
        kiwoomNoticeDelete = sqlSessionTemplate.delete("kiwoomNoticeDelete",board_no);
        logger.info("kiwoomNoticeDelete : " + kiwoomNoticeDelete);
        return kiwoomNoticeDelete;
    }



    @Override
    public int kiwoomNoticeInsert(Map<String, Object> pMap) throws Exception {
        logger.info("kiwoomNoticeInset");
        int kiwoomNoticeInsert=0;
        kiwoomNoticeInsert=sqlSessionTemplate.insert("kiwoomNoticeInsert",pMap);
        logger.info("kiwoomNoticeInsert" + kiwoomNoticeInsert);
        return kiwoomNoticeInsert;
    }
//    @Override
//    public List<KiwoomNoticeVO> kiwoomNoticeUpdate(KiwoomNoticeVO kiwoomNoticeVO) throws Exception {
//        return null;
//    }
}
