package com.best.kgw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
//@RequestMapping("/*")
public class IndexController {
    @GetMapping("/")
    public String indexpage() {

        return "forward:/index.jsp";
    }
}
