package com.best.kgw.controller;

import com.best.kgw.service.AdminSevice;
import com.best.kgw.vo.EmpVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
    Logger logger = LoggerFactory.getLogger(AdminController.class);

    @Autowired
    private AdminSevice adminSevice;

    @PostMapping("regist")
    public String regist(EmpVO empVO) throws Exception{
        logger.info(empVO.toString());

        int result = 0;
        String path = "";

        result = adminSevice.regist(empVO);
        if(result == 1){
            path = "redirect:/auth/login.jsp";
        }else{
            path = "redirect:/registerror.jsp";
        }
        return path;
    }
    @GetMapping("empList")
    public String empList(@RequestParam Map<String, Object> pmap, Model model) throws Exception{
        logger.info("Controller : search 호출");
        List<Map<String ,Object>> empList = null;
        empList = adminSevice.empList(pmap);
        model.addAttribute("empList", empList);
//    logger.info(ticketList.toString());
        return "forward:/admin/adminSearch.jsp";
    }
}
