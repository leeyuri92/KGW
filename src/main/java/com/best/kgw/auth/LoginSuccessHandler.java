package com.best.kgw.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import java.io.IOException;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {
    Logger logger = LoggerFactory.getLogger(LoginSuccessHandler.class);

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {

        logger.info("login 성공 - handler발동");

        // 세션시간 설정
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(600);
//        int sessionMaxInactiveInterval =     session.setMaxInactiveInterval(600);
//        int sessionMaxInactiveInterval = session.getMaxInactiveInterval();

        // 세션의 만료 시간을 분 단위로 변환하여 세션의 남은 시간 계산
//        int sessionTimeoutMinutes = sessionMaxInactiveInterval / 60;

//        request.setAttribute("sessionTimeoutMinutes", sessionTimeoutMinutes);
        response.sendRedirect(request.getContextPath() + "/");
    }
}
