package com.best.kgw.controller;

import com.best.kgw.service.DocumentService;
import com.vo.ApprovalVO;
import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("approval")
public class DocumentController {
    Logger logger = LoggerFactory.getLogger("DocumentController".getClass());

    @Autowired
    private DocumentService documentService;

    //    문서함
    @GetMapping("/approvalList")
    public String DocumentList(Model model, @RequestParam Map<String, Object> dMap) {
        List<Map<String, Object>> list = documentService.DocumentList(dMap);
        model.addAttribute("list", list);
        return "forward:approvalList.jsp";
    }

    //   값을 select 하기
    @GetMapping("/docu")
    public String DocumentInfo(Model model, @RequestParam Map<String, Object> aMap) {
        List<Map<String, Object>> list2 = documentService.DocumentInfo(aMap);
        model.addAttribute("list2", list2);
        return "forward:approvalDocu.jsp";

    }

    //    insert test
//    @PostMapping("/approvalList")
//    @ResponseBody
//    public   void DocumentInsert(ApprovalVO approvalVO) throws  Exception{
//        documentService.insertDocumentWithApproval(approvalVO);
//        logger.info("ControllerInsert"+approvalVO.toString());
//    }

    @PostMapping("/approvalList")
    public String  DocumentInsert( ApprovalVO approvalVO) throws Exception {
        logger.info("2 Insert"+approvalVO.toString());
        int result=0;

        result  =documentService.insertDocumentWithApproval(approvalVO);

         return  "redirect:approvalList";
    }
}




