package com.vo;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PitchersVO {
    private Integer p_id;
    private String p_name;
    private String p_team;
    private Double p_era;
    private Double p_ip;
    private Integer p_win;
    private Integer p_lose;
    private Integer p_save;
    private Integer p_h;
    private Integer p_ob;
    private Integer p_bh;
    private Double p_war;
    private Double p_whip;

    @Builder
    public PitchersVO( Integer p_id ,String p_name, String p_team, Double p_era, Double p_ip, Integer p_win,
                      Integer p_lose, Integer p_save, Integer p_h, Integer p_ob, Integer p_bh,
                      Double p_war, Double p_whip) {
        super();
        this.p_id=p_id;
        this.p_name = p_name;
        this.p_team = p_team;
        this.p_era = p_era;
        this.p_ip = p_ip;
        this.p_win = p_win;
        this.p_lose = p_lose;
        this.p_save = p_save;
        this.p_h = p_h;
        this.p_ob = p_ob;
        this.p_bh = p_bh;
        this.p_war = p_war;
        this.p_whip = p_whip;
    }
}