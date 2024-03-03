package com.best.kgw.controller;

import com.best.kgw.service.DocumentService;
import com.best.kgw.service.FileService;
import com.vo.ApprovalVO;
import com.vo.MediaNoticeVO;
import com.vo.NoticeBoardVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("approval")
public class DocumentController {
    Logger logger = LoggerFactory.getLogger("DocumentController".getClass());

    @Autowired
    private DocumentService documentService;
    private FileService fileService;


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

    @GetMapping("/approvalDetail")
    public String DetailIn(Model model, ApprovalVO approvalVO) {
        List<ApprovalVO> approvalDetail = documentService.ApprovalList(approvalVO);
        model.addAttribute("approvalDetail", approvalDetail);
        return "forward:approvalIn.jsp";
    }

    @GetMapping("/approvalDetail2")
    public String DetailOut(Model model, ApprovalVO approvalVO) {
        List<ApprovalVO> approvalDetail = documentService.ApprovalList(approvalVO);
        model.addAttribute("approvalDetail", approvalDetail);
        return "forward:approvalOut.jsp";
    }
    @GetMapping("/approvalDetail3")
    public String DetailExtension(Model model, ApprovalVO approvalVO) {
        List<ApprovalVO> approvalDetail = documentService.ApprovalList(approvalVO);
        model.addAttribute("approvalDetail", approvalDetail);
        return "forward:approvalExtension.jsp";
    }
    @GetMapping("/approvalDetail4")
    public String DetailVacation(Model model, ApprovalVO approvalVO) {
        List<ApprovalVO> approvalDetail = documentService.ApprovalList(approvalVO);
        model.addAttribute("approvalDetail", approvalDetail);
        return "forward:approvalVacation.jsp";
    }



    // 문서 작성
    @PostMapping("documentInsert")
    public String  documentInsert( ApprovalVO approvalVO) throws Exception {
        logger.info("DocumentController :  documentInsert");
        documentService.documentInsert(approvalVO);
        return "redirect:documentList";
    }
//임시보관함 조회
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

    @PostMapping("/approvalUpdate")
    public String approvalUpdate(ApprovalVO approvalvo) throws Exception {
        documentService.approvalUpdate(approvalvo);
        return "redirect:./approvalList";
    }

//    @PostMapping("middleModify")
//    public void middleModify(ApprovalVO approvalVO, @RequestParam("files") MultipartFile file, HttpServletRequest req, HttpServletResponse resp) throws Exception {
//        byte[] signImageData = file.getBytes();
//        approvalVO.setMiddleSign_img(approvalVO.getMiddleSign_img());
//        documentService.updateApprovalAndDocument(approvalVO);
//        resp.sendRedirect("/approvalList");
//    }


}




