package com.best.kgw.dao.impl;

import com.best.kgw.dao.DocumentDao;
import com.vo.ApprovalVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
public class DocumentDaoImpl implements DocumentDao {
    Logger logger= LoggerFactory.getLogger("DocumentDaoImpl".getClass());
    @Autowired
    SqlSessionTemplate sqlSessionTemplate;
//기안자 문서함 list
    @Override
    public List<ApprovalVO>DocumentList(ApprovalVO approvalVO){
        List<ApprovalVO >list=new ArrayList<>();
        list=sqlSessionTemplate.selectList("selectDocument",approvalVO);
        return list;
    }


//결재자 결재함
    @Override
    public List<ApprovalVO >ApprovalList(ApprovalVO approvalVO){
        List<ApprovalVO>list2=new ArrayList<>();
        list2=sqlSessionTemplate.selectList("approvalDocument",approvalVO);
        return list2;
    }





    //    기안하기필요한 정보
     @Override
      public List<Map<String,Object>> DocumentInfo(ApprovalVO approvalvo){
         List<Map<String,Object>> kiwoomList =sqlSessionTemplate.selectList("k_List", approvalvo);
        return kiwoomList;
    }
// 문서 입력
//    @Override
//    public int DocumentInsert(ApprovalVO approvalVO) {
//        int result=0;
//
//        logger.info("=========================DocumentDao : DocumentInsert"+result);
////        sqlSessionTemplate.insert("insertDocument", approvalVO);
//        logger.info("============================"+approvalVO.getDocument_no());
//        return  result;
//    }
//
////    문서결재

//
//    
    
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
}

