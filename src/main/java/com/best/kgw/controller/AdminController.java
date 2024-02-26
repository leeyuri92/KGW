package com.best.kgw.controller;

import com.best.kgw.service.AdminSevice;
import com.vo.EmpVO;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.sql.*;
import java.util.List;
import java.util.Map;
import java.util.Objects;

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
        logger.info("Controller : empList 호출");
        List<Map<String ,Object>> empList = null;
        empList = adminSevice.empList(pmap);
        model.addAttribute("empList", empList);
        logger.info(empList.toString());
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

/**********************************************************************************
 작성자 : 이동건
 작성일자 : 24.02.24
 기능 : 전체사원정보 다운
 **********************************************************************************/

    @GetMapping("/allDownLoadExel")
    public void downloadExel(@RequestParam Map<String, Object> pmap, HttpServletResponse response) throws IOException, SQLException {

        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@(description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1522)(host=adb.ap-chuncheon-1.oraclecloud.com))(connect_data=(service_name=ga45479ea3c71df_l4hrfixp1sgbh0pd_medium.adb.oraclecloud.com))(security=(ssl_server_dn_match=yes)))","ADMIN","Abcd12345678");
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("select e.emp_no,t.team_name,t.team_no, e.emp_access, e.emp_position, e.sign_no, e.dayoff_cnt, e.emp_year,e.hire_date, e.emp_state, e.reg_date, e.mod_date, e.password, e.name, e.email,e.phone_num,e.address,e.birthdate\n" +
                "        from emp e JOIN team t ON e.team_no = t.team_no");

        Workbook workbook = new HSSFWorkbook();
        Sheet sheet = workbook.createSheet("Emp Data");

        Row headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("이름");
        headerRow.createCell(1).setCellValue("사번");
        headerRow.createCell(2).setCellValue("입사일");
        headerRow.createCell(3).setCellValue("부서");
        headerRow.createCell(4).setCellValue("직급");
        headerRow.createCell(5).setCellValue("상태");
        headerRow.createCell(6).setCellValue("휴대전화");
        headerRow.createCell(7).setCellValue("생일");
        headerRow.createCell(8).setCellValue("이메일");
        headerRow.createCell(9).setCellValue("주소");

        int r = 1;
        while (rs.next()) {
            String name = rs.getString("NAME");
            int empno = rs.getInt("EMP_NO");
            String hiredate = rs.getString("HIRE_DATE");
            String teamname = rs.getString("TEAM_NAME");
            String position = rs.getString("EMP_POSITION");
            String state = rs.getString("EMP_STATE");
            String phonenum = rs.getString("PHONE_NUM");
            String birthdate = rs.getString("BIRTHDATE");
            String email = rs.getString("EMAIL");
            String address = rs.getString("ADDRESS");
            if(Objects.equals(state, "0")){
                state = "퇴직";
            }else {
                state = "재직";
            }
            Row row = sheet.createRow(r++);
            row.createCell(0).setCellValue(name);
            row.createCell(1).setCellValue(empno);
            row.createCell(2).setCellValue(hiredate);
            row.createCell(3).setCellValue(teamname);
            row.createCell(4).setCellValue(position);
            row.createCell(5).setCellValue(state);
            row.createCell(6).setCellValue(phonenum);
            row.createCell(7).setCellValue(birthdate);
            row.createCell(8).setCellValue(email);
            row.createCell(9).setCellValue(address);
        }
        response.setContentType("ms-vnd/excel");
        response.setHeader("Content-Disposition", "attachment;filename=empList.xls");

        workbook.write(response.getOutputStream());
        workbook.close();
        con.close();
    }

    /**********************************************************************************
     작성자 : 이동건
     작성일자 : 24.02.24
     기능 : 선택사원정보 다운
     **********************************************************************************/
    @GetMapping("/selectDownLoadExel")
    public void downloadExel(@RequestParam Map<String, Object> pmap, HttpServletResponse response,EmpVO empVO) throws IOException {

        // 엑셀에 들어갈 데이터 생성
        logger.info("Controller : empList 호출");
        List<Map<String, Object>> empList = null;
        empList = adminSevice.empList(pmap);
        logger.info(empList.toString());
        Map<String, Object> rmap = empList.get(0);

        Workbook workbook = new HSSFWorkbook();
        Sheet sheet = workbook.createSheet("Emp Data");

        Row headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("이름");
        headerRow.createCell(1).setCellValue("사번");
        headerRow.createCell(2).setCellValue("입사일");
        headerRow.createCell(3).setCellValue("부서");
        headerRow.createCell(4).setCellValue("직급");
        headerRow.createCell(5).setCellValue("상태");
        headerRow.createCell(6).setCellValue("휴대전화");
        headerRow.createCell(7).setCellValue("생일");
        headerRow.createCell(8).setCellValue("이메일");
        headerRow.createCell(9).setCellValue("주소");


        String name = (String) rmap.get("NAME");
        int empno = empVO.getEmp_no();
        String hiredate = (String) rmap.get("HIRE_DATE");
        String teamname = (String) rmap.get("TEAM_NAME");
        String position = (String) rmap.get("EMP_POSITION");
        String state = (String) rmap.get("EMP_STATE");
        if (Objects.equals(state, "0")) {
            state = "퇴직";
        } else {
            state = "재직";
        }
        String phonenum = (String) rmap.get("PHONE_NUM");
        String birthdate = (String) rmap.get("BIRTHDATE");
        String email = (String) rmap.get("EMAIL");
        String address = (String) rmap.get("ADDRESS");

        Row row = sheet.createRow(1);
        row.createCell(0).setCellValue(name);
        row.createCell(1).setCellValue(empno);
        row.createCell(2).setCellValue(hiredate);
        row.createCell(3).setCellValue(teamname);
        row.createCell(4).setCellValue(position);
        row.createCell(5).setCellValue(state);
        row.createCell(6).setCellValue(phonenum);
        row.createCell(7).setCellValue(birthdate);
        row.createCell(8).setCellValue(email);
        row.createCell(9).setCellValue(address);

        response.setContentType("ms-vnd/excel");
        response.setHeader("Content-Disposition", "attachment;filename=empList.xls");

        workbook.write(response.getOutputStream());
        workbook.close();
    }
}
