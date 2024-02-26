package com.vo;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class DocumentVO {

        private Integer document_No;
        private Integer emp_No;
        private String document_Title;
        private String document_Category;
        private String submission_Date;
        private String state;
        private String draftDay;
        private String start_Date;
        private String end_Date;
        private String dayoff_Content;
        private Integer k_id;
        private Integer SALARY;
        private String contract_Term;



        @Builder
    public DocumentVO(Integer document_No, Integer emp_No, String document_Title, String document_Category,
                      String submission_Date, String state, String draftDay, String start_Date, String end_Date,
                      String dayoff_Content, Integer k_id, Integer SALARY, String contract_Term){
            super();
            this.document_No=document_No;
            this.emp_No=emp_No;
            this.document_Title=document_Title;
            this.document_Category=document_Category;
            this.submission_Date=submission_Date;
            this.state=state;
            this.draftDay=draftDay;
            this.start_Date=start_Date;
            this.end_Date=end_Date;
            this.dayoff_Content=dayoff_Content;
            this.k_id=k_id;
            this.SALARY=SALARY;
            this.contract_Term=contract_Term;

        }
    }

