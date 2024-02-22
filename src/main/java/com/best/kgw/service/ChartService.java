package com.best.kgw.service;

import java.util.List;
import java.util.Map;

public interface ChartService {
    List<Map<String, Object>> wList(Map<String, Object> wmap);

    List<Map<String, Object>> fList(Map<String, Object> fmap);

    double kWar(Map<String, Object> kmap);

    void faUpdate(Map<String, Object> FA_NO);
}
