package com.best.kgw.controller;

import com.best.kgw.service.ChartService;
import com.google.gson.Gson;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class ChartController {
    Logger logger = LoggerFactory.getLogger(ChartController.class);

    @Autowired
    private ChartService chartService;

    @GetMapping("kList")
    public String faPage(Map<String, Object> fmap, Map<String, Object> wmap, Model model) {
        logger.info("faPage");

        // FA선수리스트
        List<Map<String, Object>> fList = chartService.faList(fmap);
        logger.info("fList : " + fList);
        model.addAttribute("fList", fList);

        // FA선수 WAR차트
        List<Map<String, Object>> wList = chartService.warList(wmap);
        logger.info("wList : " + wList);
        List<Object[]> dataList = new ArrayList<>();
        String[] hs = {"NAME", "WAR"};
        dataList.add(hs);
        for (Map<String, Object> entry : wList) {
            dataList.add(new Object[]{entry.get("K_NAME"), entry.get("K_WAR")});
        }
        logger.info("dataList : " + dataList); // 객체[]라서 주소값으로 나올것 -> Json으로 바꿔야 값이 나옴

        Gson g = new Gson();
        String wChart = g.toJson(dataList);
        logger.info("wChart : " + wChart);
        model.addAttribute("wChart", wChart);
        return "forward:/strategy/FAchart.jsp";
    }


}
