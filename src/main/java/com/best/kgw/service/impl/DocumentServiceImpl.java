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
    public List<Map<String, Object>> DocumentList(Map<String, Object> dMap) {
        List<Map<String, Object>> list = documentDao.DocumentList(dMap);
        return list;
    }

    //기안하기필요한 문서 정보
    @Override
    public List<Map<String,Object>> DocumentInfo(ApprovalVO approvalvo) {
        List<Map<String,Object>> kiwoomList = documentDao.DocumentInfo(approvalvo);
        return kiwoomList;
    }

    @Override
    public void documentInsert(ApprovalVO approvalVO) throws Exception {
        documentDao.documentInsert(approvalVO);
    }
}



/*  임시 저장  파트 따로
* List<Map<String, Object>> filteredList = list.stream()
    .filter(map -> "임시저장".equals(map.get("state")))
    .collect(Collectors.toList());
*
*
* try {
            // 插入文档
            int documentInsertResult = documentDao.insertDocument(approvalVO);
            if (documentInsertResult != 1) {
                throw new RuntimeException("Failed to insert document");
            }

            // 获取插入文档后生成的文档编号
            int documentNo = approvalVO.getDocument_no();

            // 构造审批数据
            approvalVO.setDocument_no(documentNo);

            // 插入审批记录
            int approvalInsertResult = documentDao.insertApproval(approvalVO);
            if (approvalInsertResult != 1) {
                throw new RuntimeException("Failed to insert approval");
            }
        } catch (Exception e) {
            // 捕获异常并处理
            logger.error("Error occurred during document and approval insertion: " + e.getMessage());
            throw new RuntimeException("Insertion failed", e); // 抛出异常使事务回滚
        }
    }

* */