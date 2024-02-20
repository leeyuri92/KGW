package com.best.kgw.dao;

import com.best.kgw.vo.EmpVO;

import java.util.List;

public interface DashboardDao {
    List<EmpVO>empDetail(EmpVO empVO) throws Exception;
}
