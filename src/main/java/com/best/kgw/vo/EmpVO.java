package com.best.kgw.vo;

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
	private int emp_no;
	private int team_no;
	private String emp_access;
	private String emp_position;
	private int sign_no;
	private int dayoff_cnt;
	private int emp_year;
	private String hire_date;
	private String retire_date;
	private String emp_state;
	private String reg_date;
	private String mod_date;
	private String password;
	private String name;
	private String email;
	private String birthdate;
	private String phoneNum;
	private String address;


	@Override
	public String toString() {
		return "EmpVO{" +
				"emp_no=" + emp_no +
				", team_no=" + team_no +
				", emp_access='" + emp_access + '\'' +
				", emp_position='" + emp_position + '\'' +
				", sign_no=" + sign_no +
				", dayoff_cnt=" + dayoff_cnt +
				", emp_year=" + emp_year +
				", hire_date='" + hire_date + '\'' +
				", retire_date='" + retire_date + '\'' +
				", emp_state='" + emp_state + '\'' +
				", reg_date='" + reg_date + '\'' +
				", mod_date='" + mod_date + '\'' +
				", password='" + password + '\'' +
				", name='" + name + '\'' +
				", email='" + email + '\'' +
				", birthdate='" + birthdate + '\'' +
				", phoneNum='" + phoneNum + '\'' +
				", address='" + address + '\'' +
				'}';
	}
}
