package com.best.kgw.vo;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**********************************************************************************
 작성자 : 박병현
 작성일자 : 24.02.19
 기능 : EmpVO
 **********************************************************************************/
@Data
@NoArgsConstructor
public class EmpVO {

    private int emp_no = 0;
    private  int team_no= 0;
    private  String emp_access="";
    private  String emp_position="";
    private int sign_no = 0;
    private  int dayoff_cnt = 0;
    private  int emp_year = 0;
    private  String hire_date="";
    private  String retire_date="";
    private String emp_state ="";
    private  String reg_date ="";
    private  String mod_date ="";
    private  String password ="";
    private  String name ="";
    private  String email ="";
    private  String birthdate ="";
    private  String phone_num ="";
    private  String address ="";

    @Builder
    public EmpVO(int emp_no, int team_no, String emp_access, String emp_position, int sign_no, int dayoff_cnt, int emp_year, String hire_date, String retire_date, String emp_state, String reg_date, String mod_date, String password, String name, String email, String birthdate, String phone_num, String address) {
        super();
        this.emp_no = emp_no;
        this.team_no = team_no;
        this.emp_access = emp_access;
        this.emp_position = emp_position;
        this.sign_no = sign_no;
        this.dayoff_cnt = dayoff_cnt;
        this.emp_year = emp_year;
        this.hire_date = hire_date;
        this.retire_date = retire_date;
        this.emp_state = emp_state;
        this.reg_date = reg_date;
        this.mod_date = mod_date;
        this.password = password;
        this.name = name;
        this.email = email;
        this.birthdate = birthdate;
        this.phone_num = phone_num;
        this.address = address;
    }
}
