package com.best.kgw.service;

import com.vo.KiwoomNoticeVO;

import java.util.List;

public interface KiwoomNoticeService {
    public List<KiwoomNoticeVO> kiwoomNoticeList(KiwoomNoticeVO kiwoomNoticeVO) throws Exception;
    public int kiwoomNoticeDelete(int board_no) throws Exception;
}
