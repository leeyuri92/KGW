package com.best.kgw.dao;

import java.util.List;
import java.util.Map;

public interface ChartDao {
    List<Map<String, Object>> wList(Map<String, Object> wmap);

    List<Map<String, Object>> pList(Map<String, Object> pmap);

    List<Map<String, Object>> fList(Map<String, Object> fmap);

    double kWar(Map<String, Object> kmap);

    void faUpdate(Map<String, Object> umap);

    List<Map<String, Object>> hList(Map<String, Object> hmap);

    List<Map<String, Object>> rList(Map<String, Object> rmap);
}
