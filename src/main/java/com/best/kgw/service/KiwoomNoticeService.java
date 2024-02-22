package com.best.kgw.service;


import com.vo.KiwoomNoticeVO;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

public interface KiwoomNoticeService {
    public List<KiwoomNoticeVO> kiwoomNoticeList(KiwoomNoticeVO kiwoomNoticeVO) throws Exception;
    public int kiwoomNoticeDelete(int board_no) throws Exception;

    //    public  List<KiwoomNoticeVO> kiwoomNoticeUpdate(KiwoomNoticeVO kiwoomNoticeVO)throws  Exception;
    public int kiwoomNoticeInsert(@RequestParam Map<String, Object> pMap) throws Exception;
}
