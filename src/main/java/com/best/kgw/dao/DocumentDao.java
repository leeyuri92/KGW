package com.best.kgw.dao;

import com.vo.ApprovalVO;

import java.util.List;
import java.util.Map;

public interface DocumentDao {
    List<Map<String ,Object>> DocumentList(Map<String, Object> dMap);

    //    기안하기정보
    List<Map<String,Object>> DocumentInfo(ApprovalVO approvalvo);


    //사용자 문서 입력
    int DocumentInsert(ApprovalVO approvalVO);

    //    문서결재
    int ApprovalInsert(ApprovalVO approvalVO);

    public void documentInsert(ApprovalVO approvalVO) throws Exception;
}
