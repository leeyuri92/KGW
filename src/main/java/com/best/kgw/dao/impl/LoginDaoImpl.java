package com.best.kgw.dao.impl;


import com.best.kgw.dao.LoginDao;
import com.vo.EmpVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;
/**********************************************************************************
 작성자 : 이유리
 작성일자 : 24.02.26
 기능 : Security Login 구현
 **********************************************************************************/
@Repository
public class LoginDaoImpl implements LoginDao {
  Logger logger = LoggerFactory.getLogger(LoginDaoImpl.class);

  @Autowired
  private SqlSessionTemplate sqlSessionTemplate = null ;


  @Override
  public EmpVO login(String emp_no) throws Exception {
    logger.info("login() 호출 - 입력받은 값 : " + emp_no);
    EmpVO empVO = null;
    try {
      empVO = sqlSessionTemplate.selectOne("login", emp_no);
    } catch (Exception e) {
      logger.info(e.toString());
    }
    return empVO;
  }

  @Override
  public String findId(Map<String, Object> fmap) throws Exception {
    logger.info("findId");
    logger.info("fmap : " + fmap);
    String id = sqlSessionTemplate.selectOne("findId", fmap);
    logger.info("찾은 id 값 : " + id);
    return id;
  }
} 