package com.best.kgw.controller;

import com.best.kgw.service.DashboardService;
import com.vo.EmpVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

/**********************************************************************************
 작성자 : 박병현
 작성일자 : 24.02.19
 기능 : 메인페이지 Controller
 **********************************************************************************/
@Controller
//@RequestMapping("/")
public class DashboardController {
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
    public String DashboardForm(EmpVO empVO, Model model) throws Exception{
        logger.info("Controller : DashboardForm");
        List<EmpVO> empList;
        empList = dashboardService.empDetail(empVO);
        logger.info(empList.toString());
        model.addAttribute("empDetail", empList);
        return "forward:/dashboard/dashboardForm.jsp";
    }
}
