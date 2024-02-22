/**********************************************************************************
 작성자 : 이유리
 작성일자 : 24.02.18
 기능 : FAchart 페이지 생성 및 리스트, chart 생성
 **********************************************************************************/

package com.best.kgw.controller;

import com.best.kgw.service.ChartService;
import com.google.gson.Gson;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.swing.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class ChartController {
    Logger logger = LoggerFactory.getLogger(ChartController.class);

    @Autowired
    private ChartService chartService;

    @GetMapping("kList")
    public String faPage(Map<String, Object> fmap, Map<String, Object> wmap, Map<String, Object> kmap, Model model) {
        logger.info("faPage 호출");

        // FA 선수 현황 -  WAR차트
        List<Map<String, Object>> wList = chartService.wList(wmap);
        logger.info("wList (받아온 DB data) : " + wList);
        // 1차 가공
        List<Object[]> dataList = new ArrayList<>();
        String[] hs = {"NAME", "WAR"};
        dataList.add(hs);
        for (Map<String, Object> entry : wList) {
            dataList.add(new Object[]{entry.get("FA_NAME"), entry.get("FA_WAR")});
        }
        logger.info("dataList : " + dataList);  // 객체[]라서 주소값으로 나올것 -> Json으로 바꿔야 값이 나옴(2차 가공)
        // 2차 가공
        Gson g = new Gson();
        String wChart = g.toJson(dataList);
        logger.info("wChart : " + wChart);
        model.addAttribute("wChart", wChart);

        // FA 선수 명단
        List<Map<String, Object>> fList = chartService.fList(fmap);
        logger.info("fList : " + fList);
        model.addAttribute("fList", fList);

        // FA 선수 명단 - WAR 비교차트_키움
        double kWar = chartService.kWar(kmap);
        logger.info("kWar : " + kWar);
        model.addAttribute("kWar", kWar);

        return "forward:/strategy/FAchart.jsp";
    }

    /**********************************************************************************
     작성자 : 이유리
     작성일자 : 24.02.21
     기능 : 등록/방출에 따른 WAR값 업데이트
     **********************************************************************************/

    @GetMapping("faUpdate")
    @ResponseBody // Ajax 처리 시 넘기는 값이 없어도 필요
    public void faUpdate(@RequestParam Map<String, Object> k_id) {
        logger.info("faUpdate : "+k_id);
        chartService.faUpdate(k_id);
    }

    @GetMapping("faWar")
    @ResponseBody // Ajax 처리 시 값을 넘길 때 필요
    public double faWar(Map<String, Object> fmap) {
        // fa 선수 추가했을 시 WAR 평균값 불러오기
        double faWar = chartService.kWar(fmap);
        logger.info("faWar : " + faWar);
        return faWar ;
    }

//    @GetMapping("faWar")
//    public void faWar(Map<String, Object> fmap, Model model) {
//        double faWar = chartService.fWar(fmap);
//        logger.info("faWar : " + faWar);
//        model.addAttribute("faWar", faWar);
//    }


}
