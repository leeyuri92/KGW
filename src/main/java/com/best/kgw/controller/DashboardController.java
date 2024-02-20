package com.best.kgw.controller;

import com.best.kgw.service.DashboardService;
import com.best.kgw.vo.EmpVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
//@RequestMapping("/")
public class DashboardController {
    Logger logger = LoggerFactory.getLogger(DashboardController.class);
    @Autowired
    private DashboardService dashboardService;
//    private

    @GetMapping("/")
    public String DashboardForm(EmpVO empVO, Model model) throws Exception{
        logger.info("Controller : DashboardForm");
        List<EmpVO> empList;
        empList = dashboardService.empDetail(empVO);
        model.addAttribute("empDetail", empList);
        return "forward:/dashboard/dashboardForm.jsp";
    }
}
