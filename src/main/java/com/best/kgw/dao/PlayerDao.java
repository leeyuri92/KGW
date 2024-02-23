package com.best.kgw.dao;

import java.util.List;
import java.util.Map;

public interface PlayerDao {

    List<Map<String,Object>> hitterList(Map<String, Object> hMap);

    List<Map<String,Object>>pitcherList(Map<String, Object> pMap);
}
