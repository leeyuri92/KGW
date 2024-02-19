package com.best.kgw.service;

import java.util.List;
import java.util.Map;

public interface ChartService {
    List<Map<String, Object>> faList(Map<String, Object> kmap);

    List<Map<String, Object>> warList(Map<String, Object> wmap);
}
