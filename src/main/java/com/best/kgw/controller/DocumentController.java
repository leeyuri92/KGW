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
        approvalVO.setStorage("false");
        List<ApprovalVO> list = documentService.DocumentList(approvalVO);
        model.addAttribute("list", list);
        return "forward:documentList.jsp";
    }

    //    결재 함
    @GetMapping("/approvalList")
    public String ApprovalList(Model model, ApprovalVO approvalVO) {
        List<ApprovalVO> list2 = documentService.ApprovalList(approvalVO);
        model.addAttribute("list2", list2);
        return "forward:approvalList.jsp";
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
    public String SaveList(Model model, ApprovalVO approvalVO) throws  Exception{
        approvalVO.setStorage("true");
        List<ApprovalVO> list3 = documentService.DocumentList(approvalVO);
        logger.info("saveLIst"+list3);
        model.addAttribute("list3", list3);
        logger.info("saveLIst"+list3);
        return "forward:approvalSaveList.jsp";
    }
//임시저장함 상세
    @GetMapping("/saveDetail")
    public String SaveDetail(Model model, ApprovalVO approvalVO) throws  Exception{
        approvalVO.setStorage("true");
        List<ApprovalVO> saveDetail = documentService.DocumentList(approvalVO);
        logger.info("DetailSaveINFO");
        model.addAttribute("saveDetail", saveDetail);
        return "forward:approvalSaveListDetail.jsp";
    }



//   select 구분

    //  기안문서 할떄   값을 select 하기
    @GetMapping("/docu")
    public String DocumentInfo(Model model, ApprovalVO approvalvo) throws  Exception {
        List<ApprovalVO> faList = documentService.DocumentInfo(approvalvo);
        logger.info("controller!!!!!!!!!1");
        model.addAttribute("faList", faList);
        return "forward:approvalDocu.jsp";

    }


    //결재 파트 업데이트 처리
    @PostMapping("/approvalUpdate")
    public String approvalUpdate(ApprovalVO approvalvo) throws Exception {
        logger.info("approvalUpdateController================================================"+ approvalvo);
        documentService.approvalUpdate(approvalvo);
        return "redirect:./approvalList";
    }

//    임시저장 파트 업데이트 처리
@PostMapping("/saveDetailUpdate")
public String saveModify (ApprovalVO approvalVO) throws Exception {
    int saveModify=0;
    saveModify=documentService.saveModify(approvalVO);
    if(saveModify ==1) {
        logger.info("saveModify");
        return "redirect:documentList";
    } else {
        return "error";
    }

}
//delete부분 임시저장
    @DeleteMapping("/saveList/{document_no}")
    //게시글 삭제
    public String saveDelete(@PathVariable("document_no") Integer document_no) throws Exception {
        int documentDelete = 0;
       documentDelete = documentService.saveDelete(document_no);
        if (documentDelete == 1) {
            return "redirect:documentList";
        } else {
            return "error";
        }
    }

    @PostMapping("/updateApproval")
    public String updateApproval(ApprovalVO approvalVO, String fruitCondition) {
        if ("중간결재대기".equals(approvalVO.getApproval_category()) && "true".equals(approvalVO.getAction())) {
           documentService.updateApprovalStatus(approvalVO);
            logger.info("controller 중간결재 성공");
        } else  if  ("중간려재대기".equals(approvalVO.getApproval_category()) && "false".equals(approvalVO.getAction())) {
            documentService.updateApprovalStatus(approvalVO);
            logger.info("controller 중간결재반려");
        } if ("최종결대기;".equals(approvalVO.getApproval_category()) && "true".equals(approvalVO.getAction())) {
            documentService.updateApprovalStatus(approvalVO);
            logger.info("controller 최종결재 성공");
        } if ("최종결재대기".equals(approvalVO.getApproval_category()) && "false".equals(approvalVO.getAction())) {
            documentService.updateApprovalStatus(approvalVO);
            logger.info("최종결재 반려");
        }

        return "redirect:approvalList";
    }

}






