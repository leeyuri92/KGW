package com.best.kgw.dao.impl;

import com.best.kgw.dao.DocumentDao;
import com.vo.ApprovalVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DocumentDaoImpl implements DocumentDao {
    Logger logger= LoggerFactory.getLogger("DocumentDaoImpl".getClass());
    @Autowired
    SqlSessionTemplate sqlSessionTemplate;
//기안자 문서함 list
    @Override
    public List<ApprovalVO>DocumentList(ApprovalVO approvalVO){
        List<ApprovalVO >list;
        list=sqlSessionTemplate.selectList("selectDocument",approvalVO);
        return list;
    }


//결재자 결재함
    @Override
    public List<ApprovalVO >ApprovalList(ApprovalVO approvalVO){
        List<ApprovalVO>list2;
        list2=sqlSessionTemplate.selectList("approvalDocument",approvalVO);
        return list2;
    }





    //    기안하기필요한 정보
     @Override
      public List<ApprovalVO> DocumentInfo(ApprovalVO approvalvo){
         List<ApprovalVO> faTeam =sqlSessionTemplate.selectList("faTeam", approvalvo);
        return faTeam;
    }
    
//    영입 문서 작성
    @Override
    public void documentInsert(ApprovalVO approvalVO) throws Exception {
        logger.info("==================approvalVO"+ approvalVO);
        sqlSessionTemplate.insert("documentInsert", approvalVO);
    }
    @Override
    public void  approvalInsert(ApprovalVO approvalVO) throws  Exception{
        logger.info("==================ApprovalInsert");
       sqlSessionTemplate.insert("approvalInsert",approvalVO);
    }
//    중간결재
@Override
public int approvalMiddleModify(ApprovalVO approvalVO) throws Exception {
    int middleModify=0;
    middleModify=sqlSessionTemplate.update("approvalMiddleModify",approvalVO);
    return middleModify;
}

//    최종결재
    public int approvalFinalModify(ApprovalVO approvalVO) throws Exception {
        int finalModify=0;
        finalModify=sqlSessionTemplate.update("approvalFinalModify",approvalVO);
        return finalModify;
    }

//    문서 업데이트처리
    @Override
    public int documentModify(ApprovalVO approvalVO) throws Exception {
        int documentModify=0;
        documentModify=sqlSessionTemplate.update("documentStateModify",approvalVO);
        return documentModify;
    }

    @Override
    public void approvalUpdate(ApprovalVO approvalvo) throws Exception {
        if(approvalvo.getApproval_category().equals("중간결재대기")){
            logger.info("dao"+approvalvo);
            approvalvo.setApproval_category("최종결재대기");
            sqlSessionTemplate.update("approvalMiddleModify", approvalvo);
        }else{
            logger.info("dao"+approvalvo);
            sqlSessionTemplate.update("approvalFinalModify", approvalvo);
        }



//
//        if ("approve".equals(actionType)) {
//            if ("중간결재대기".equals(approvalVO.getApproval_category())) {
//                approvalVO.setApproval_category("최종결재대기");
//                sqlSessionTemplate.update("approvalMiddleModify", approvalVO);
//            } else if ("최종결재대기".equals(approvalVO.getApproval_category())) {
//                approvalVO.setApproval_category("최종결재승인");
//                sqlSessionTemplate.update("approvalFinalModify", approvalVO);
//            }
//        } else if ("reject".equals(actionType)) {
//            approvalVO.setRejection_content(rejectionContent);
//            if ("중간결재대기".equals(approvalVO.getApproval_category())) {
//                approvalVO.setApproval_category("중간승인반려");
//                sqlSessionTemplate.update("approvalMiddleModify", approvalVO);
//            } else if ("최종결재대기".equals(approvalVO.getApproval_category())) {
//                approvalVO.setApproval_category("최종승인반려");
//                sqlSessionTemplate.update("approvalFinalModify", approvalVO);
//            }
//        }
//    }
    }
// 임시저장 업데이트
@Override
public int saveModify(ApprovalVO approvalVO) throws Exception {
    logger.info("saveModify");
    int saveModify=0;
   saveModify=sqlSessionTemplate.update("saveModify",approvalVO);
    return saveModify;
}




//임시저장 삭제
    @Override
public int saveDocumentDelete(int document_no) throws Exception {
    int documentDelete=0;
   documentDelete=sqlSessionTemplate.delete("documentDelete",document_no);
    return documentDelete;
}




    //결재문서 부분 업데이트 처리 로직
    @Override
    public void updateApprovalStatus(ApprovalVO approvalVO) {
        sqlSessionTemplate.update("updateApprovalStatus", approvalVO);
    }




}

