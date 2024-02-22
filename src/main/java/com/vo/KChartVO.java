package com.vo;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class KChartVO {
    private int K_ID;
    private int K_SS;
    private String K_TEAM;
    private String K_NAME;
    private int K_NUM;
    private String K_POS;
    private String K_BIRTH;
    private String K_PHY;
    private int K_HIRE;
    private int K_WAR;
    private String K_DATE;
    private String K_STATE;
    private int K_YEAR;

    @Builder
    public KChartVO(int K_ID, int K_SS, String K_TEAM, String K_NAME, int K_NUM, String K_POS, String K_BIRTH, String K_PHY,
                    int K_HIRE, int K_WAR, String K_DATE, String K_STATE, int K_YEAR) {
        super();
        this.K_ID = K_ID;
        this.K_SS = K_SS;
        this.K_TEAM = K_TEAM;
        this.K_NAME = K_NAME;
        this.K_NUM = K_NUM;
        this.K_POS = K_POS;
        this.K_BIRTH = K_BIRTH;
        this.K_PHY = K_PHY;
        this.K_HIRE = K_HIRE;
        this.K_WAR = K_WAR;
        this.K_DATE = K_DATE;
        this.K_STATE = K_STATE;
        this.K_YEAR = K_YEAR;
    }
}
