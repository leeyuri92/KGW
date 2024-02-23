package com.best.kgw.service;

import java.util.List;
import java.util.Map;

public interface PlayerService {

    List<Map<String,Object>> hitterList(Map<String, Object> hMap);

    List<Map<String,Object>>pitcherList(Map<String, Object> pMap);
}
