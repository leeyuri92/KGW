package com.best.kgw.dao;

import java.util.List;
import java.util.Map;

public interface ChartDao {
    List<Map<String, Object>> faList(Map<String, Object> kmap);

    List<Map<String, Object>> warList(Map<String, Object> wmap);
}
