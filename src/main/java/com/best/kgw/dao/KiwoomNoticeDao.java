package com.best.kgw.dao;

import com.vo.KiwoomNoticeVO;

import java.util.List;

public interface KiwoomNoticeDao {
     public List<KiwoomNoticeVO> kiwoomNoticeList(KiwoomNoticeVO kiwoomNoticeVO) throws Exception;
     public int kiwoomNoticeDelete(int board_no)throws Exception;
}
