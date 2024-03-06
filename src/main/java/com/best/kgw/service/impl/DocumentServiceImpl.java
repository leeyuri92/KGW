package com.best.kgw.service.impl;

import com.best.kgw.dao.DocumentDao;
import com.best.kgw.service.DocumentService;
import com.vo.ApprovalVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class DocumentServiceImpl implements DocumentService {
    Logger logger = LoggerFactory.getLogger("DocumentServiceImpl".getClass());

    @Autowired
    DocumentDao documentDao;

    //기안자 문서함
    @Override
    public List<ApprovalVO> DocumentList(ApprovalVO approvalVO) {
        List<ApprovalVO> list = documentDao.DocumentList(approvalVO);
        return list;
    }

    //결재자 문서함
    @Override
    public List<ApprovalVO> ApprovalList(ApprovalVO approvalVO) {
        List<ApprovalVO> list2 = documentDao.ApprovalList(approvalVO);
        return list2;
    }


    //기안하기필요한 문서 정보
    @Override
    public List<Map<String, Object>> DocumentInfo(ApprovalVO approvalvo) {
        List<Map<String, Object>> kiwoomList = documentDao.DocumentInfo(approvalvo);
        return kiwoomList;
    }

    @Transactional
    @Override
    public void documentInsert(ApprovalVO approvalVO) throws Exception {
        documentDao.documentInsert(approvalVO);
//        logger.info(String.valueOf(approvalVO.getDocument_no()) + "serviceIMPL");
        approvalVO.setDocument_no(approvalVO.getDocument_no());
        logger.info(approvalVO.toString());
        documentDao.approvalInsert(approvalVO);

    }




    @Override
    public void approvalUpdate(ApprovalVO approvalvo) throws Exception {
        documentDao.approvalUpdate(approvalvo);
        logger.info("serviceUpdate"+approvalvo);
    }


//    임시저장 업데이트 처리
@Override
public int saveModify(ApprovalVO approvalVO) throws Exception {
    int saveModify =0;
    saveModify= documentDao.saveModify(approvalVO);
    return saveModify;
}

    @Override
    public int saveDelete(int document_no) throws Exception {
        int  documentDelete =0;
        documentDelete = documentDao.saveDocumentDelete(document_no);
        return documentDelete;
    }



//    결재 업대이트 처리

}



