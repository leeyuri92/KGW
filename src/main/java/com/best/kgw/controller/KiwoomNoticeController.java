package com.best.kgw.controller;

import com.best.kgw.service.KiwoomNoticeService;
import com.best.kgw.vo.KiwoomNoticeVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/kiwoom/*")
public class KiwoomNoticeController {
Logger logger = LoggerFactory.getLogger(KiwoomNoticeController.class);

    @Autowired
    private KiwoomNoticeService kiwoomNoticeService;

    @GetMapping("kiwoomNotice")
    public String kiwoomNoticeList(KiwoomNoticeVO kiwoomNoticeVO, Model model) throws Exception {
     logger.info("kiwoomNoticeList");
    List<KiwoomNoticeVO> kiwoomNoticeList=kiwoomNoticeService.kiwoomNoticeList(kiwoomNoticeVO);
    model.addAttribute("kiwoomNoticeList",kiwoomNoticeList);
    return "forward:kiwoomNotice.jsp";
    }

    @GetMapping("kiwoomDetail")
    public String KiwoomNoticeList(KiwoomNoticeVO kiwoomNoticeVO, Model model) throws Exception{
        logger.info("kiwoomNoticeDetail");
        List<KiwoomNoticeVO> kiwoomNoticeList =kiwoomNoticeService.kiwoomNoticeList(kiwoomNoticeVO);
        model.addAttribute("kiwoomNoticeList",kiwoomNoticeList);
        return "forward:kiwoomDetail.jsp";
    }

  @DeleteMapping("kiwoomDelete")
  @ResponseBody
    public String kiwoomNoticeDelete(int board_no) throws Exception {
        logger.info("kiwoomNoticeDelete");
        int kiwoomNoticeDelete= 0;
        kiwoomNoticeDelete=kiwoomNoticeService.kiwoomNoticeDelete(board_no);
        if (kiwoomNoticeDelete==1){
         return "redirect:kiwoomNotice";
        }
         else {
        return "";

    }
  }
}
