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

}

