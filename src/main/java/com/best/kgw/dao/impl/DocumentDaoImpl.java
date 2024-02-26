package com.best.kgw.dao.impl;

import com.best.kgw.dao.DocumentDao;
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

    @Override
    public List<Map<String ,Object>>DocumentList(Map<String,Object>dMap){
        List<Map<String,Object>>list=new ArrayList<>();
        list=sqlSessionTemplate.selectList("selectDocument",dMap);
        logger.info("DocumentList"+list);
        return list;
    }

}
