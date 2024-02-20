package com.best.kgw.service;

import com.best.kgw.vo.EmpVO;

import java.util.List;

public interface DashboardService {

    List<EmpVO>empDetail(EmpVO empVO) throws Exception;
}
