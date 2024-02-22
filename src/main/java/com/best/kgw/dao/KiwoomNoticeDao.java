package com.best.kgw.dao;



import com.vo.KiwoomNoticeVO;

import java.util.List;
import java.util.Map;

public interface KiwoomNoticeDao {
     public List<KiwoomNoticeVO> kiwoomNoticeList(KiwoomNoticeVO kiwoomNoticeVO) throws Exception;
     public int kiwoomNoticeDelete(int board_no)throws Exception;

     public int kiwoomNoticeInsert(Map<String, Object> pMap) throws Exception;
//     public List<KiwoomNoticeVO> kiwoomNoticeUpdate(KiwoomNoticeVO kiwoomNoticeVO) throws Exception;
}
