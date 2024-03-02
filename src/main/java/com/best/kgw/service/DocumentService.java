package com.best.kgw.service;

import com.vo.ApprovalVO;

import java.util.List;
import java.util.Map;

public interface DocumentService {
    List<ApprovalVO> DocumentList(ApprovalVO approvalVO);


    //결재자 문서함
    List<ApprovalVO > ApprovalList(ApprovalVO approvalVO);

    //기안하기 문서 정보
    List<Map<String,Object>> DocumentInfo(ApprovalVO approvalvo);

    public void documentInsert(ApprovalVO approvalVO) throws Exception;


}
