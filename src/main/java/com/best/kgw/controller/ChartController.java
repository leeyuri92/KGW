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

    /**********************************************************************************
     작성자 : 이유리
     작성일자 : 24.02.18
     기능 : FAchart 페이지 생성 및 리스트, chart 생성
     **********************************************************************************/
    @GetMapping("manage/FAChart")
    public String faPage(Map<String, Object> fmap, Map<String, Object> wmap, Map<String, Object> kmap, Map<String, Object> pmap, Model model) {
        logger.info("faPage 호출");

        // 1. FA 선수 현황 -  WAR차트
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

        // 2. FA 선수 현황 -  포지션별 차트
        List<Map<String, Object>> pList = chartService.pList(pmap);
        logger.info("pList (받아온 DB data) : " + pList);
        // 1차 가공
        List<Object[]> pieList = new ArrayList<>();
        String[] hs2 = {"FA_POS", "COUNT"};
        pieList.add(hs2);
        for (Map<String, Object> entry : pList) {
            pieList.add(new Object[]{entry.get("FA_POS"), entry.get("COUNT")});
        }
        logger.info("pieList : " + pieList);  // 객체[]라서 주소값으로 나올것 -> Json으로 바꿔야 값이 나옴(2차 가공)
        // 2차 가공
        g = new Gson();
        String pChart = g.toJson(pieList);
        logger.info("pChart : " + pChart);
        model.addAttribute("pChart", pChart);

        // 3. FA 선수 명단
        List<Map<String, Object>> faList = chartService.faList(fmap);
        logger.info("faList : " + faList);
        model.addAttribute("faList", faList);

        // 4. FA 선수 명단 - WAR 비교차트_키움
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

    /**********************************************************************************
     작성자 : 이유리
     작성일자 : 24.02.26
     기능 : 입/퇴사자 차트
     **********************************************************************************/
    @GetMapping("admin/empChart")
    public String hnrPage(Map<String, Object> hmap, Map<String, Object> rmap, Model model) {
        logger.info("hnrPage 호출");

        // 1. 입사자 차트
        List<Map<String, Object>> hList = chartService.hList(hmap);
        logger.info("hList (받아온 DB data) : " + hList);
        model.addAttribute("hList", hList);

        // 1차 가공
        List<Object[]> dataList = new ArrayList<>();
        String[] hs = {"YEAR", "입사자 수"};
        dataList.add(hs);
        for (Map<String, Object> entry : hList) {
            dataList.add(new Object[]{entry.get("HIREYEAR").toString(), entry.get("COUNT")});
        }
        logger.info("dataList : " + dataList);  // 객체[]라서 주소값으로 나올것 -> Json으로 바꿔야 값이 나옴(2차 가공)

        // 2차 가공
        Gson g = new Gson();
        String hChart = g.toJson(dataList);
        logger.info("hChart : " + hChart);
        model.addAttribute("hChart", hChart);

        // 2. 퇴사자 차트
        List<Map<String, Object>> rList = chartService.rList(rmap);
        logger.info("rList (받아온 DB data) : " + rList);
        model.addAttribute("rList", rList);

        // 1차 가공
        List<Object[]> dataList2 = new ArrayList<>();
        String[] hs2 = {"YEAR", "퇴사자 수"};
        dataList2.add(hs2);
        for (Map<String, Object> entry : rList) {
            dataList2.add(new Object[]{entry.get("RETIREYEAR").toString(), entry.get("COUNT")});
        }
        logger.info("dataList2 : " + dataList2);  // 객체[]라서 주소값으로 나올것 -> Json으로 바꿔야 값이 나옴(2차 가공)

        // 2차 가공
        g = new Gson();
        String rChart = g.toJson(dataList2);
        logger.info("rChart : " + rChart);
        model.addAttribute("rChart", rChart);

        return "forward:/admin/empChart.jsp";
    }

    /**********************************************************************************
     작성자 : 이유리
     작성일자 : 24.02.27
     기능 : 검색기 비동기 처리
     **********************************************************************************/
    @GetMapping("searchFA")
    @ResponseBody
    public String searchFA (@RequestParam Map<String, Object> smap) {
        logger.info("searchFA 호출");
        List<Map<String, Object>> searchFA = chartService.faList(smap);
        logger.info("searchFA : " + searchFA);

        Gson g = new Gson();
        String faJson = g.toJson(searchFA);
        logger.info(faJson);
        return faJson;
    }

    /**********************************************************************************
     작성자 : 이유리
     작성일자 : 24.02.28
     기능 : 등록/방출 버튼 기본값으로 초기화
     **********************************************************************************/
    @GetMapping("faInit")
    public String faInit(Map<String, Object> imap) {
        logger.info("faInit");
        chartService.faInit(imap);
        return "redirect:kList";
    }
}
