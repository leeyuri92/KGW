package com.best.kgw.service;

import java.util.List;
import java.util.Map;

public interface ChartService {
    List<Map<String, Object>> wList(Map<String, Object> wmap);

    List<Map<String, Object>> pList(Map<String, Object> pmap);

    List<Map<String, Object>> faList(Map<String, Object> fmap);

    double kWar(Map<String, Object> kmap);

    void faInit(Map<String, Object> imap);

    void faUpdate(Map<String, Object> FA_NO);

    List<Map<String, Object>> hList(Map<String, Object> hmap);

    List<Map<String, Object>> rList(Map<String, Object> rmap);
}
