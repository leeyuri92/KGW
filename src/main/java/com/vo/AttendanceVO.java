package com.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AttendanceVO {

    private int attendance_no;
    private int emp_no;
    private String work_date;
    private String start_time;
    private String end_time;
    private String state;
    private String mod_content;

    @Override
    public String toString() {
        return "AttendanceVO{" +
                "attendance_no=" + attendance_no +
                ", emp_no=" + emp_no +
                ", work_date='" + work_date + '\'' +
                ", start_time='" + start_time + '\'' +
                ", end_time='" + end_time + '\'' +
                ", state='" + state + '\'' +
                ", mod_content='" + mod_content + '\'' +
                '}';
    }
}
