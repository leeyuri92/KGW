package com.best.kgw.controller;

import com.best.kgw.service.MediaNoticeService;
import com.vo.MediaNoticeCommendVO;
import com.vo.MediaNoticeVO;
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
@RequestMapping("/media/*")
public class MediaNoticeController {
    Logger logger = LoggerFactory.getLogger(MediaNoticeController.class);

    @Autowired
    private MediaNoticeService mediaNoticeService;

    @GetMapping("mediaNotice")
    //키움소식 목록조회
    public String mediaNoticeList(MediaNoticeVO mediaNoticeVO, Model model) throws Exception {
        logger.info("mediaNoticeList");
        List<MediaNoticeVO> mediaNoticeList = mediaNoticeService.mediaNoticeList(mediaNoticeVO);
        model.addAttribute("mediaNoticeList", mediaNoticeList);
        return "forward:mediaNotice.jsp";
    }

    @GetMapping("mediaDetail")
    //키움소식 상세조회
    public String mediaNoticeDetail(MediaNoticeVO mediaNoticeVO, MediaNoticeCommendVO mediaNoticeCommendVO, Model model) throws Exception {
        logger.info("mediaNoticeDetail");
        List<MediaNoticeVO> mediaNoticeDetail = mediaNoticeService.mediaNoticeList(mediaNoticeVO);
        model.addAttribute("mediaNoticeDetail", mediaNoticeDetail);
        logger.info("mediaNoticeDetail:" + mediaNoticeDetail);

        List<MediaNoticeCommendVO> commendList = mediaNoticeService.commendList(mediaNoticeCommendVO);
        model.addAttribute("commendList", commendList);
        logger.info("commendList: " + commendList);
        return "forward:mediaDetail.jsp";
    }

    @GetMapping("mediaDelete")
    //키움소식 삭제
    public String mediaNoticeDelete(int board_no) throws Exception {
        logger.info("mediaNoticeDelete");
        int mediaNoticeDelete = 0;
        mediaNoticeDelete = mediaNoticeService.mediaNoticeDelete(board_no);
        if (mediaNoticeDelete == 1) {
            return "redirect:mediaNotice";
        } else {
            return "error";
        }
    }

    @PostMapping("mediaInsert")
    //키움소식 작성
    public String mediaNoticeInsert(MediaNoticeVO mediaNoticeVO) throws Exception {
        int result = 0;
        String path = "";
        result = mediaNoticeService.mediaNoticeInsert(mediaNoticeVO);
        if (result == 1) {
            path = "redirect:mediaNotice";
        }else{
            path =  "error";
        }
        return path;
    }

    //키움소식  수정
    @PostMapping("mediaModify")
    public String mediaNoticeModify(MediaNoticeVO mediaNoticeVO) throws Exception {
        logger.info("Modify");
        int result = 0;
        String path = "";
        result = mediaNoticeService.mediaNoticeModify(mediaNoticeVO);
        logger.info("Modify2");
        if (result == 1) {
            path = "redirect:mediaNotice";
        }else{
            path =  "error";
        }
        return path;
    }

    @PostMapping("CommendInsert")
    public String mediaCommendInsert (MediaNoticeCommendVO mediaNoticeCommendVO) throws Exception{
        logger.info("mediaCommendInsert");
        logger.info(mediaNoticeCommendVO.toString());
        int mediaCommendInsert = 0;
        mediaCommendInsert=mediaNoticeService.mediaCommendInsert(mediaNoticeCommendVO);
        logger.info("mediaCommendInsert:"+mediaCommendInsert);
        return "redirect:mediaDetail?board_no="+mediaNoticeCommendVO.getBoard_no();
//        return "redirect:kiwoomDetail?board_no="+kiwoomNoticeCommendVO.getBoard_no().toString();
    }

    @GetMapping("CommendDelete")
    public String mediaCommendDelete (int board_no,int commend_no)throws Exception{
        logger.info("mediaCommendDelete");
        int mediaCommendDelete =0;
        mediaCommendDelete =mediaNoticeService.mediaCommendDelete(commend_no);
        logger.info("mediaCommendDelete");
        return "redirect:mediaDetail?board_no="+board_no;
        }
}

