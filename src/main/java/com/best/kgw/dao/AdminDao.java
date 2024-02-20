package com.best.kgw.dao;

import com.best.kgw.vo.EmpVO;

import java.util.List;
import java.util.Map;

public interface AdminDao {
   public int regist(EmpVO empVO) throws Exception;

    public List<Map<String, Object>> empList(Map<String, Object> pmap);

    public int empInfoUpdate(Map<String, Object> pmap);
}
