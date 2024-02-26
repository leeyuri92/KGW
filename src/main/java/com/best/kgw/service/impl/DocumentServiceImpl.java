package com.best.kgw.service.impl;

import com.best.kgw.dao.DocumentDao;
import com.best.kgw.service.DocumentService;
import com.vo.DocumentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class DocumentServiceImpl implements DocumentService {
    Logger logger= LoggerFactory.getLogger("DocumentServiceImpl".getClass());
    @Autowired
    DocumentDao documentDao;

    @Override
    public List<Map<String, Object>> DocumentList(Map<String, Object> dMap) {
        List<Map<String,Object>>list=documentDao.DocumentList(dMap);
        logger.info("list"+list);
        return list;
}
}


/*  임시 저장  파트 따로
* List<Map<String, Object>> filteredList = list.stream()
    .filter(map -> "임시저장".equals(map.get("state")))
    .collect(Collectors.toList());
* */