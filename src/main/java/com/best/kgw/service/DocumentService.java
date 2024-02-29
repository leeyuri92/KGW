package com.best.kgw.service;

import com.vo.ApprovalVO;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

public interface DocumentService {
    List<Map<String ,Object>> DocumentList(Map<String, Object> dMap);

    //기안하기 문서 정보
    List<Map<String ,Object>>DocumentInfo(Map<String, Object> aMap);




    int insertDocumentWithApproval(ApprovalVO approvalVO);

//    int documetnInsert(ApprovalVO approvalVO);

}
