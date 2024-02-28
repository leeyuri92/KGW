package com.best.kgw.controller;

import com.best.kgw.service.NoticeBoardService;
import com.vo.NoticeBoardVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/notice/*")
public class NoticeBoardController {
    Logger logger = LoggerFactory.getLogger(MediaNoticeController.class);

    @Autowired
    private NoticeBoardService noticeBoardService;

    @GetMapping("noticeList")
    //보드리스트
    public String noticeList(NoticeBoardVO noticeboardVO, Model model) throws Exception {
        logger.info("NoticeList");
        List<NoticeBoardVO> noticeList = noticeBoardService.noticeList(noticeboardVO);
        model.addAttribute("noticeList", noticeList);
        return "forward:noticeList.jsp";
    }

    @GetMapping("noticeDetail")
    // 상세조회
    public String noticeDetail(NoticeBoardVO noticeboardVO, Model model) throws Exception {
        logger.info("noticeDetail");
        List<NoticeBoardVO> noticeList = noticeBoardService.noticeList(noticeboardVO);
        model.addAttribute("noticeList", noticeList);
        logger.info("noticeDetail".toString());
        return "forward:noticeDetail.jsp";
    }

    @PostMapping("noticeInsert")
    //공지사항 작성
    public String noticeInsert(NoticeBoardVO noticeboardVO) throws Exception {
        logger.info("noticeInsert");
        int noticeInsert = 0;
        String path = "";
        noticeInsert = noticeBoardService.noticeInsert(noticeboardVO);
        logger.info("noticeInsert");
        if (noticeInsert == 1) {
            path = "redirect:noticeList";
        } else {
            path = "error";
        }
        return path;
    }

    @GetMapping("noticeDelete")
    //게시글 삭제
    public String noticeDelete(int notice_no) throws Exception {
        logger.info("noticeDelete");
        int noticeDelete = 0;
        noticeDelete = noticeBoardService.noticeDelete(notice_no);
        if (noticeDelete == 1) {
            return "redirect:noticeList";
        } else {
            return "error";
        }
    }
    @PostMapping("noticeModify")
    public String noticeModify (NoticeBoardVO noticeBoardVO) throws Exception {
        logger.info("noticeModify");
        int noticeModify=0;
        noticeModify=noticeBoardService.noticeModify(noticeBoardVO);
        logger.info("noticeModify");
        if(noticeModify ==1) {
           return "redirect:noticeList";
        } else {
            return "error";
        }
    }
}



