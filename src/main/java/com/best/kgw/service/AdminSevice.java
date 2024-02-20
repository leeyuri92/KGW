package com.best.kgw.service;

import com.best.kgw.vo.EmpVO;

import java.util.List;
import java.util.Map;

public interface AdminSevice {
    public int regist(EmpVO empVO) throws Exception;

    public List<Map<String, Object>> empList(Map<String, Object> pmap);

    public int empInfoUpdate(Map<String, Object> pmap);
}
