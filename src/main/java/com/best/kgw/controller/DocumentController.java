package com.best.kgw.controller;

import com.best.kgw.service.DocumentService;
import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("approval")
public class DocumentController {
    Logger logger= LoggerFactory.getLogger("DocumentController".getClass());

    @Autowired
    private DocumentService documentService;

    @GetMapping("/approvalList")
    public  String DocumentList(Model model, @RequestParam Map<String ,Object>dMap){
        List<Map<String ,Object>> list= documentService.DocumentList(dMap);
        logger.info("ControllerList"+list);
        model.addAttribute("list",list);
        return "forward:approvalList.jsp";

    }
}
