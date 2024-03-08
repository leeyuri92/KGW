package com.best.kgw.dao;

import com.vo.ApprovalVO;

import java.util.List;

public interface DocumentDao {
//    기안문서 select
    List<ApprovalVO> DocumentList(ApprovalVO approvalVO);


    //결재자 문서 select
    List<ApprovalVO >ApprovalList(ApprovalVO approvalVO);

    //    기안하기위한 정보들
    List<ApprovalVO> DocumentInfo(ApprovalVO approvalvo);


// 기안문서 정보 insert
    public void documentInsert(ApprovalVO approvalVO) throws Exception;

// 결재문서 정보 insert
    void  approvalInsert(ApprovalVO approvalVO) throws  Exception;


    void approvalUpdate(ApprovalVO approvalvo) throws Exception;

    // 임시저장 업데이트
    int saveModify(ApprovalVO approvalVO) throws Exception;

    //임시저장 삭제
    int saveDocumentDelete(int document_no) throws Exception;

    void documentStateModify(ApprovalVO approvalvo) throws Exception;
}
