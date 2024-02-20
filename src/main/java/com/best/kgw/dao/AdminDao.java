package com.best.kgw.dao;

import com.best.kgw.vo.EmpVO;

import java.util.List;
import java.util.Map;

public interface AdminDao {
    int regist(EmpVO empVO) throws Exception;

    List<Map<String, Object>> empList(Map<String, Object> pmap);
}
