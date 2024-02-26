package com.best.kgw.controller;

import com.best.kgw.service.DashboardService;
import com.vo.EmpVO;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Map;

/**********************************************************************************
 작성자 : 박병현
 작성일자 : 24.02.19
 기능 : 메인페이지 Controller
 **********************************************************************************/
@Controller
//@RequestMapping("/")
public class DashboardController{
    Logger logger = LoggerFactory.getLogger(DashboardController.class);
    @Autowired
    private DashboardService dashboardService;
//    private

    /**********************************************************************************
     작성자 : 박병현
     작성일자 : 24.02.19
     기능 : 메인페이지
     **********************************************************************************/
    @GetMapping("/")
    public String DashboardForm(EmpVO empvo, Model model) throws Exception {
        logger.info("Controller : DashboardForm");
        List<EmpVO> empList;
        EmpVO empDetail = dashboardService.empDetail(empvo);
        logger.info(empDetail.toString());
        model.addAttribute("empDetail", empDetail);
        return "forward:/dashboard/dashboardForm.jsp";
    }

    /**********************************************************************************
     작성자 : 박병현 (동건씨 땡큐)
     작성일자 : 24.02.24
     기능 : 사원 상세조회
     **********************************************************************************/
    @GetMapping("mypage")
    public String empDetail(EmpVO empvo, Model model) throws Exception {
        logger.info("Controller : empDetail 호출" + empvo);
        EmpVO empDetail = dashboardService.empDetail(empvo);
        logger.info(empDetail.toString());
        model.addAttribute("empDetail", empDetail);
//    logger.info(ticketList.toString());
        return "forward:/mypage/mypage.jsp";
    }

    /**********************************************************************************
     작성자 : 박병현
     작성일자 : 24.02.24
     기능 : 사원정보 수정
     **********************************************************************************/
    @GetMapping("empDetailUpdate")
    public String empDetailUpdate(EmpVO empvo) throws Exception {
        logger.info("empDetailUpdate");
        int result = 0;
        result = dashboardService.empDetailUpdate(empvo);

        return "redirect:/";
    }
}
