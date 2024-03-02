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
    @GetMapping("/documentList")
    public String DocumentList(Model model, ApprovalVO approvalVO) {
        approvalVO.setGubun("false");
        List<ApprovalVO> list = documentService.DocumentList(approvalVO);
        model.addAttribute("list", list);
        return "forward:approvalList.jsp";
    }





    //    결재 함
    @GetMapping("/approvalList")
    public String ApprovalList(Model model, ApprovalVO approvalVO) {
        List<ApprovalVO> list2 = documentService.ApprovalList(approvalVO);
        model.addAttribute("list2", list2);
        return "forward:approvalList2.jsp";
    }

    // 문서 작성
    @PostMapping("documentInsert")
    public String  documentInsert( ApprovalVO approvalVO) throws Exception {
        logger.info("DocumentController :  documentInsert");
        documentService.documentInsert(approvalVO);
        return "redirect:documentList";
    }

    @GetMapping("/saveList")
    public String SaveList(Model model, ApprovalVO approvalVO) {
        approvalVO.setGubun("true");
        List<ApprovalVO> list3 = documentService.DocumentList(approvalVO);
        model.addAttribute("list3", list3);
        return "forward:approvalList3.jsp";
    }




    //   값을 select 하기
    @GetMapping("/docu")
    public String DocumentInfo(Model model, ApprovalVO approvalvo) {
        List<Map<String,Object>> kiwoomList = documentService.DocumentInfo(approvalvo);
        model.addAttribute("kiwoomList", kiwoomList);
        return "forward:approvalDocu.jsp";

    }


}




