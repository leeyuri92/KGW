package com.best.kgw.controller;

import com.best.kgw.service.KiwoomNoticeService;
import com.vo.KiwoomNoticeVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/kiwoom/*")
public class KiwoomNoticeController {
    Logger logger = LoggerFactory.getLogger(KiwoomNoticeController.class);

    @Autowired
    private KiwoomNoticeService kiwoomNoticeService;

    @GetMapping("kiwoomNotice")
    //키움소식 조회
    public String kiwoomNoticeList(KiwoomNoticeVO kiwoomNoticeVO, Model model) throws Exception {
        logger.info("kiwoomNoticeList");
        List<KiwoomNoticeVO> kiwoomNoticeList = kiwoomNoticeService.kiwoomNoticeList(kiwoomNoticeVO);
        model.addAttribute("kiwoomNoticeList", kiwoomNoticeList);
        return "forward:kiwoomNotice.jsp";
    }

    @GetMapping("kiwoomDetail")
    //키움소식 상세조회
    public String KiwoomNoticeList(KiwoomNoticeVO kiwoomNoticeVO, Model model) throws Exception {
        logger.info("kiwoomNoticeDetail");
        List<KiwoomNoticeVO> kiwoomNoticeList = kiwoomNoticeService.kiwoomNoticeList(kiwoomNoticeVO);
        model.addAttribute("kiwoomNoticeList", kiwoomNoticeList);
        return "forward:kiwoomDetail.jsp";
    }

    //  @DeleteMapping("kiwoomDelete")
    //
    @GetMapping("kiwoomDelete")
    //게시글 삭제
    public String kiwoomNoticeDelete(int board_no) throws Exception {
        logger.info("kiwoomNoticeDelete");
        int kiwoomNoticeDelete = 0;
        kiwoomNoticeDelete = kiwoomNoticeService.kiwoomNoticeDelete(board_no);
        if (kiwoomNoticeDelete == 1) {
            return "redirect:kiwoomNotice";
        } else {
            return "error";
        }

    }

    @PostMapping("kiwoomInsert")
    //스프링에서는 @RequestParam 있어서 req,res가 없어도 사용자가 입력한 값을 담을수 있다.
    //즉! 스프링은 더 이상 서블릿을 상속 받지 않아도 된다.
    public String kiwoomNoticeInsert(@RequestParam Map<String, Object> pMap) throws Exception {
        int result = 0;
        String path = "";
        result = kiwoomNoticeService.kiwoomNoticeInsert(pMap);
        if (result == 1) {
            path = "redirect:kiwoomNotice";
        }else{
            path =  "error";
        }
        return path; // 화면을 호출하는게 아니라 URL을 호출한다. - 23번라인
    }


}

