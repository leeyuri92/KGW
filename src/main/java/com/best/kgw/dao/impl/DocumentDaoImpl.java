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
    public List<Map<String ,Object>>DocumentList(Map<String,Object>dMap){
        List<Map<String,Object>>list=new ArrayList<>();
        list=sqlSessionTemplate.selectList("selectDocument",dMap);
//        logger.info("DocumentList"+list);
        return list;
    }
//    기안하기정보
     @Override
      public List<Map<String,Object>> DocumentInfo(ApprovalVO approvalvo){
         List<Map<String,Object>> kiwoomList =sqlSessionTemplate.selectList("k_List", approvalvo);
        return kiwoomList;
    }
// 문서 입력
    @Override
    public int DocumentInsert(ApprovalVO approvalVO) {
        int result=0;

        logger.info("=========================DocumentDao : DocumentInsert"+result);
//        sqlSessionTemplate.insert("insertDocument", approvalVO);
        logger.info("============================"+approvalVO.getDocument_no());
        return  result;
    }

//    문서결재
    @Override
    public int ApprovalInsert(ApprovalVO approvalVO){
        logger.info("==================ApprovalInsert");
        int result2=0;
        result2=sqlSessionTemplate.insert("insertApproval",approvalVO);
        logger.info(String.valueOf(approvalVO.getDocument_no()));

        return result2;
    }

    @Override
    public void documentInsert(ApprovalVO approvalVO) throws Exception {
        logger.info("==================approvalVO"+ approvalVO);
        sqlSessionTemplate.insert("documentInsert", approvalVO);
    }
}

