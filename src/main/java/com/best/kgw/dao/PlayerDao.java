package com.best.kgw.dao;

import com.vo.PitchersVO;

import java.util.List;
import java.util.Map;

public interface PlayerDao {

    List<Map<String,Object>> hitterList(Map<String, Object> hMap);


    List<PitchersVO>pitcherList(PitchersVO pitchersVO);
}
