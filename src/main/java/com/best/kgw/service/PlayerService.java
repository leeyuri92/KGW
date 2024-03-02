package com.best.kgw.service;

import com.vo.PitchersVO;

import java.util.List;
import java.util.Map;

public interface PlayerService {

    List<Map<String,Object>> hitterList(Map<String, Object> hMap);


    List<PitchersVO> pitcherList(PitchersVO pitchersVO);
}
