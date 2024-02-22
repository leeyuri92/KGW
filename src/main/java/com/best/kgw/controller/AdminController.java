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

    /**********************************************************************************
     작성자 : 이동건
     작성일자 : 24.02.19
     기능 : 사원추가
     **********************************************************************************/
    @PostMapping("regist")
    public String regist(EmpVO empVO) throws Exception{
        logger.info(empVO.toString());

        int result = 0;
        String path = "";

        result = adminSevice.regist(empVO);
        if(result == 1){
            path = "redirect:/admin/empList";
        }else{
            path = "redirect:/registerror.jsp";
        }
        return path;
    }
    /**********************************************************************************
     작성자 : 이동건
     작성일자 : 24.02.19
     기능 : 사원목록조회
     **********************************************************************************/
    @GetMapping("empList")
    public String empList(@RequestParam Map<String, Object> pmap, Model model) throws Exception{
        logger.info("Controller : search 호출");
        List<Map<String ,Object>> empList = null;
        empList = adminSevice.empList(pmap);
        model.addAttribute("empList", empList);
//    logger.info(ticketList.toString());
        return "forward:/admin/adminSearch.jsp";
    }
    /**********************************************************************************
     작성자 : 이동건
     작성일자 : 24.02.19
     기능 : 사원상세정보조회
     **********************************************************************************/
    @GetMapping("empDetail")
    public String empDetail(Model model, @RequestParam Map<String, Object> pmap) {
        logger.info("empDetail");
        List<Map<String, Object>> empList = null;// [ {},{},{} ]
        empList = adminSevice.empList(pmap);
        model.addAttribute("empList", empList);
        return "forward:/admin/empDetail.jsp"; // webapp아래에서찾음
    }
    /**********************************************************************************
     작성자 : 이동건
     작성일자 : 24.02.19
     기능 : 증명서 조회
     **********************************************************************************/
    @GetMapping("empCertificate")
    public String empCertificate(Model model, @RequestParam Map<String, Object> pmap) {
        logger.info("empCertificate");
        List<Map<String, Object>> empList = null;// [ {},{},{} ]
        empList = adminSevice.empList(pmap);
        model.addAttribute("empList", empList);
        return "forward:/admin/empCertificate.jsp"; // webapp아래에서찾음
    }
    /**********************************************************************************
     작성자 : 이동건
     작성일자 : 24.02.21
     기능 : 전사원 목록 조회
     **********************************************************************************/
    @GetMapping("empInfo")
    public String empInfo(@RequestParam Map<String, Object> pmap, Model model) throws Exception{
        logger.info("Controller : empInfo 호출");
        List<Map<String ,Object>> empList = null;
        empList = adminSevice.empList(pmap);
        model.addAttribute("empList", empList);
//    logger.info(ticketList.toString());
        return "forward:/empinfo/empInfo.jsp";
    }
    /**********************************************************************************
     작성자 : 이동건
     작성일자 : 24.02.21
     기능 : 사원정보 수정
     **********************************************************************************/
    @GetMapping("empInfoUpdate")
    public String empInfoUpdate(@RequestParam Map<String,Object> pmap) {
        logger.info("empInfoUpdate");
        logger.info(pmap.toString());
        int result = 0;
        result = adminSevice.empInfoUpdate(pmap);
        logger.info(String.valueOf(result));

        return "redirect:/admin/empList";
}
}
