package com.best.kgw.dao;

import java.util.List;

public interface DashboardDao {
    List<EmpVO>empDetail(EmpVO empVO) throws Exception;
}
