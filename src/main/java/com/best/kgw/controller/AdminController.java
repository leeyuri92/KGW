package com.best.kgw.controller;

import com.best.kgw.service.AdminSevice;
import com.best.kgw.vo.EmpVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
